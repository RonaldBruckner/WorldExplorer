import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/emergency_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmergencyNumbersWidget extends StatefulWidget {
  final String countryCode;
  final String address;
  final double latitude;
  final double longitude;
  final bool gpsMode;

  const EmergencyNumbersWidget({super.key, required this.countryCode , required this.address , required this.latitude , required this.longitude , required this.gpsMode});

  @override
  State<EmergencyNumbersWidget> createState() => _EmergencyNumbersWidgetState();
}

class _EmergencyNumbersWidgetState extends State<EmergencyNumbersWidget> {
  EmergencyData? _data;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadFromLocalJson();
  }

  @override
  void didUpdateWidget(covariant EmergencyNumbersWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.countryCode != widget.countryCode) {
      setState(() {
        _loading = true;
        _error = null;
      });
      _loadFromLocalJson(); // re-trigger local JSON load
    }
  }

  Future<void> _loadFromLocalJson() async {
    try {
      final jsonString = await rootBundle.loadString('assets/emergency_data.json');
      final jsonMap = json.decode(jsonString);
      final List<dynamic> dataList = jsonMap['data'];

      final List<EmergencyData> allData = dataList
          .map((e) => EmergencyData.fromJson(e))
          .where((entry) => entry.isoCode.toUpperCase() == widget.countryCode.toUpperCase())
          .toList();

      setState(() {
        _data = allData.isNotEmpty ? allData.first : null;
        _loading = false;
        if (_data == null) {
          _error = '${AppLocalizations.of(context)!.no_emergency_numbers_found_for} ${widget.countryCode}';
        }
      });
    } catch (e, stackTrace) {
      debugPrint('_loadFromLocalJson Error: $e');
      debugPrint('_loadFromLocalJson StackTrace: $stackTrace');
      setState(() {
        _error = AppLocalizations.of(context)!.failed_to_load_local_emergency_numbers;
        _loading = false;
      });
    }
  }

  void _callNumber(String number) async {
    final shouldCall = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirm_call_title),
        content: Text(AppLocalizations.of(context)!.confirm_call_text(number)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );

    if (shouldCall == true) {
      //number="123";
      final uri = Uri.parse('tel:$number');
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildEmergencyItem({
    required IconData icon,
    required String label,
    required String? number,
  }) {
    final displayNumber = (number != null && number.trim().isNotEmpty) ? number : '-';

    return Expanded(
      child: InkWell(
        onTap: () {
          if (number != null && number.trim().isNotEmpty && widget.gpsMode) {
            _callNumber(number);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Column(
            children: [
              Icon(icon, size: 28, color: Colors.redAccent),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    displayNumber,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  if (number != null && number.trim().isNotEmpty)
                    const SizedBox(width: 8),
                  if (number != null && number.trim().isNotEmpty)
                    const Icon(Icons.phone, size: 18, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(_error!, style: const TextStyle(color: Colors.red)),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildEmergencyItem(
                  icon: Icons.local_police,
                  label: AppLocalizations.of(context)!.police,
                  number: _data!.police?.first,
                ),
                _buildEmergencyItem(
                  icon: Icons.local_fire_department,
                  label: AppLocalizations.of(context)!.fire,
                  number: _data!.fire?.first,
                ),
                _buildEmergencyItem(
                  icon: Icons.local_hospital,
                  label: AppLocalizations.of(context)!.ambulance,
                  number: _data!.ambulance?.first,
                ),
              ],
            ),
            if (widget.gpsMode) ...[
              const SizedBox(height: 4),
              const Divider(),
              Text('📍 ${AppLocalizations.of(context)!.current_location}:',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(widget.address, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Text(
                'Latitude: ${widget.latitude}, Longitude: ${widget.longitude}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
