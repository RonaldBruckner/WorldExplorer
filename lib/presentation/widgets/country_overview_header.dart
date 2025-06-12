import 'package:country_flags/country_flags.dart';
import 'package:country_map_svg/country_map_svg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../data/models/country.dart';
import '../../tools/tools.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CountryOverviewHeader extends StatefulWidget {
  final String? countryCode;
  final String? countryName;
  final Country? country;
  final VoidCallback? onTap;
  final int? utcOffset;
  final bool isGpsMode;


  final Function(Map<String, dynamic>?) onCountrySelected;

  const CountryOverviewHeader({
    super.key,
    required this.countryCode,
    required this.countryName,
    required this.country,
    required this.utcOffset,
    required this.onCountrySelected,
    required this.isGpsMode,
    this.onTap,
  });


  @override
  State<CountryOverviewHeader> createState() => _CountryOverviewHeaderState();

}

class _CountryOverviewHeaderState extends State<CountryOverviewHeader> with TickerProviderStateMixin {
  int? population;
  String? capital;
  String? formattedUtcOffset;
  List<String>? languages;
  bool isLoading = true;
  late List<DropdownMenuItem<String>> _dropdownItems;
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _dropdownItems = [
      const DropdownMenuItem<String>(
        value: '__current__',
        child: Text('📍 GPS'),
      ),
      ...Constants.supportedCountries.map((country) {
        final nameKey = country['nameKey'] as String;
        final localizedName = Tools.translateByKey(context, nameKey, nameKey);
        return DropdownMenuItem<String>(
          value: country['code'],
          child: Text(localizedName),
        );
      }).toList(),
    ];
  }

  @override
  void didUpdateWidget(covariant CountryOverviewHeader oldWidget) {
    super.didUpdateWidget(oldWidget);

      Tools.logDebug('didUpdateWidget country: $widget.country');

      setState(() {
        if(widget.country == null) {
          isLoading = true;
          population = null;
          capital = null;
          languages = null;
          formattedUtcOffset = null;
          _fadeController.reset();
        } else {
          isLoading = false;
          population = widget.country?.population;
          capital = widget.country?.capital;
          languages = widget.country?.languages;
          _fadeController.forward();
        }
      });


    //utcOffset is provided by the openWeather API, which is loaded after the countryCode is available
    if (oldWidget.utcOffset != widget.utcOffset || formattedUtcOffset == null) {
      setState(() {
        if (widget.utcOffset == null || widget.utcOffset == 0) {
          formattedUtcOffset = '';
        } else {
          final offsetInHours = widget.utcOffset! / 3600.0;
          formattedUtcOffset = 'UTC${offsetInHours >= 0 ? '+' : ''}${offsetInHours.toStringAsFixed(1)}';
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    if (widget.countryCode == null) {
      return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 240),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }

    final formattedPopulation = population != null
        ? NumberFormat.compact().format(population)
        : '...';
    final languagesText = languages?.join(', ') ?? '...';
    final capitalText = capital ?? '...';

    final fact = widget.countryCode != null
        ? Tools.getFact(AppLocalizations.of(context)!, widget.countryCode!)
        : null;

    final hasFact = fact != null && fact.trim().isNotEmpty;

    final existingCodes = _dropdownItems.map((item) => item.value).toList();
    if (widget.countryCode != null && !existingCodes.contains(widget.countryCode)) {
      _dropdownItems.insert(
        0,
        DropdownMenuItem(
          value: widget.countryCode,
          child: Text(widget.countryName!), // Optionally show localized name
        ),
      );
    }


    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 240),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputDecorator(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.country,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: widget.countryCode,
                                icon: const Icon(Icons.arrow_drop_down, size: 24),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                dropdownColor: Colors.white,
                                items: _dropdownItems,
                                onChanged: (String? selectedCode) async {
                                  if (selectedCode == '__current__') {
                                    widget.onCountrySelected(null);
                                  } else {
                                    final selected = Constants.supportedCountries
                                        .firstWhere((c) => c['code'] == selectedCode);
                                    widget.onCountrySelected(selected);
                                  }
                                },
                              ),
                            ),
                          ),
                          if (widget.isGpsMode)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Chip(
                                avatar: const Icon(Icons.gps_fixed, size: 16, color: Colors.white),
                                label: const Text("GPS", style: TextStyle(color: Colors.white)),
                                backgroundColor: Colors.teal,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                              ),
                            ),
                        ],
                      ),
                    ),

                    /*
                    const SizedBox(height: 0),
                    Text(
                      widget.cityName,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),

                     */
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: CountryFlag.fromCountryCode(
                        widget.countryCode!.toUpperCase(),
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CountryMapSvg.getWidget(
                            widget.countryCode!.toLowerCase(),
                            colorFilter: const ColorFilter.mode(
                                Colors.teal, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('🏙️ $capitalText',
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(height: 4),
                          Text('👥 $formattedPopulation',
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(height: 4),
                          Text('🗣️ $languagesText',
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(height: 4),

                          Text(
                            '🕒 ${formattedUtcOffset ?? ''}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (hasFact)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      fact,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


