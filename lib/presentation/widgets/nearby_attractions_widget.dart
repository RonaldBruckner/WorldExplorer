import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import '../../l10n/app_localizations.dart';
import '../../tools/tools.dart';

class NearbyAttractionsWidget extends StatefulWidget {
  final List<Map<String, dynamic>>? attractions;
  final bool attractionsError;
  final String? cityName;

  const NearbyAttractionsWidget({
    super.key,
    required this.attractions,
    required this.attractionsError,
    this.cityName,
  });

  @override
  State<NearbyAttractionsWidget> createState() => _NearbyAttractionsWidgetState();
}

class _NearbyAttractionsWidgetState extends State<NearbyAttractionsWidget> {

  static String TAG = "NearbyAttractionsWidget";

  PageController? _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _initPageController();
  }

  void _initPageController() {
    _controller?.dispose();
    _controller = PageController(viewportFraction: 0.9);
    _controller!.addListener(() {
      final newPage = _controller!.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() => _currentPage = newPage);
      }
    });
  }

  String? _photoUrl(String? ref) {
    if (ref == null) return null;
    return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$ref&key=${Constants.mapsApiKey}';
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hide widget entirely on error
    if (widget.attractionsError) {
      return const SizedBox.shrink();
    }

    // Show loading card
    if (widget.attractions == null) {

      _currentPage = 0;
      _controller?.dispose();
      _controller = null;

      final loc = AppLocalizations.of(context);
      final title =
          '${loc?.nearby_places_around ?? "Nearby places around"} ${widget.cityName ?? "..."}';

      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.chevron_right, color: Colors.teal, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                height: 180,
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      );
    }

    if (_controller == null && widget.attractions != null) {
      _initPageController();
    }
    // Attractions are available
    final places = widget.attractions!.take(10).toList();
    final loc = AppLocalizations.of(context);
    final title =
        '${loc?.nearby_places_around ?? "Nearby places around"} ${widget.cityName ?? "..."}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔽 Header (city)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.chevron_right, color: Colors.teal, size: 20),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Scroll indicator (dots)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(places.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentPage == index ? 20 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.teal
                          : Colors.teal.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 12),

            // PageView of places
            SizedBox(
              height: 180,
              child: PageView.builder(
                key: ValueKey(widget.attractions),
                controller: _controller,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  final image = _photoUrl(place['photo']);
                  final name = place['name'] ?? '';
                  final lat = place['lat'];
                  final lng = place['lng'];
                  final types = place['types'] ?? [];
                  final rawLang = Localizations.localeOf(context).languageCode;
                  final lang = rawLang == 'de' ? 'de' : 'en'; // fallback to English
                  final description = Tools.getPrimaryReadableType(types, lang);

                  return GestureDetector(
                    onTap: () async {
                      final query = (lat != null && lng != null)
                          ? '$lat,$lng'
                          : Uri.encodeComponent(name);

                      final uri = Platform.isIOS
                          ? Uri.parse(
                        lat != null && lng != null
                            ? 'http://maps.apple.com/?ll=$query'
                            : 'http://maps.apple.com/?q=$query',
                      )
                          : Uri.parse(
                          'https://www.google.com/maps/search/?api=1&query=$query');

                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title above image
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                description,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: image != null
                                ? CachedNetworkImage(
                              imageUrl: image,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const SizedBox(height: 150), // optional
                              errorWidget: (context, url, error) => Container(
                                height: 100,
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Icon(Icons.image_not_supported),
                                ),
                              ),
                            )
                                : Container(
                              height: 100,
                              color: Colors.grey[300],
                              child: const Center(child: Icon(Icons.image)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
