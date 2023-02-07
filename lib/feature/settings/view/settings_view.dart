import 'package:demo_api/feature/home/model/input_parameter_model.dart';
import 'package:demo_api/feature/settings/view/widgets/date_picker.dart';
import 'package:demo_api/static/strings.dart';
import 'package:get/get.dart';

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
  final TextEditingController _datePickerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Static.settings),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
            horizontal: StaticVal.size_25, vertical: StaticVal.size_20),
        children: <Widget>[
          InputField(controller: _urlController, labelText: Static.enterUrl),
          InputField(
              controller: _userNameController, labelText: Static.enterUserName),
          InputField(
            obscureText: true,
            controller: _passwordController,
            labelText: Static.enterPassword,
          ),
          DatePicker(controller: _datePickerController),
          ElevatedButton(
              onPressed: () {
                saveDetails(
                    context: context,
                    url: _urlController.text,
                    username: _userNameController.text,
                    password: _passwordController.text);
              },
              child: const Text(Static.save))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.text_fields),
        onPressed: () {
          _userNameController.text = Static.userName;
          _passwordController.text = Static.password;
          _urlController.text = Static.url;
        },
      ),
    );
  }
}

saveDetails({
  required BuildContext context,
  String url = '',
  String username = '',
  String password = '',
}) {
  Get.back(
    result: InputParameterModel(
      url: url,
      username: username,
      password: password,
      selectedDate: DateTime.now(),
    ),
  );
}
