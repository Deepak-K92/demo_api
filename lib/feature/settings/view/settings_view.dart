import 'package:demo_api/feature/settings/view/widgets/input_field.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: <Widget>[
          InputField(controller: _urlController, labelText: 'Enter Url'),
          InputField(
              controller: _userNameController, labelText: 'Enter User Name'),
          InputField(
              controller: _passwordController, labelText: 'Enter Password'),
          ElevatedButton(onPressed: () {}, child: const Text('SAVE'))
        ],
      ),
    );
  }
}
