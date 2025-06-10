// settings_page.dart
import 'package:flutter/material.dart';

import '../../tools/shared_preferences_helper.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _autoload = false;

  @override
  void initState() {
    super.initState();
    _autoload = SharedPreferencesHelper.getAutoload();
  }

  void _toggleAutoload(bool value) async {
    setState(() {
      _autoload = value;
    });
    await SharedPreferencesHelper.saveAutoload(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Autoload weather'),
              Switch(
                value: _autoload,
                onChanged: _toggleAutoload,
              ),
            ],
          ),
        ],
      ),
    );
  }
}