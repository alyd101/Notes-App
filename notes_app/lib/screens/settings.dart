import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/settings_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsController _settingsController = SettingsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Icon(Icons.close)),
        title: Text("Settings"),
      ),
      body: Row(
        children: [
          Text("Change theme"),
          Spacer(),
          Obx(
            () => Switch(
                value: _settingsController.isDark.value,
                onChanged: (val) {
                  _settingsController.toggleIsDark(val);
                }),
          ),
        ],
      ),
    );
  }
}
