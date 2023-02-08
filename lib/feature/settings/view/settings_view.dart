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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _datePickerController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDefaultValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Static.settings),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
              horizontal: StaticVal.size_25, vertical: StaticVal.size_20),
          children: <Widget>[
            InputField(controller: _urlController, labelText: Static.enterUrl),
            InputField(
                controller: _userNameController,
                labelText: Static.enterUserName,
                validator: _validateTextField),
            InputField(
              obscureText: true,
              controller: _passwordController,
              labelText: Static.enterPassword,
              validator: _validateTextField,
            ),
            DatePicker(controller: _datePickerController),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveDetails(
                        context: context,
                        url: _urlController.text,
                        username: _userNameController.text,
                        password: _passwordController.text,
                        selectedDate:
                            _datePickerController.text.toNormalTimeFormat());
                  }
                },
                child: const Text(Static.save))
          ],
        ),
      ),
    );
  }

  void setDefaultValues() {
    _userNameController.text = Static.userName;
    _passwordController.text = Static.password;
    _urlController.text = Static.url;
  }
}

String? _validateTextField(String? val) {
  if (val!.isEmpty) return Static.validationIsTextEmpty;
  if (val!.length > StaticVal.size_30) return Static.validationIsGreaterThan30;
}

saveDetails(
    {required BuildContext context,
    String url = '',
    String username = '',
    String password = '',
    DateTime? selectedDate}) {
  Get.back(
    result: InputParameterModel(
      url: url,
      username: username,
      password: password,
      selectedDate: selectedDate ?? DateTime.now(),
    ),
  );
}
