import '../../../common/model/appointment_model.dart';
import 'package:flutter/material.dart';

class ViewAppointments extends StatelessWidget {
  final List<Appointment>? itemList;
  ViewAppointments({
    super.key,
    this.itemList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("View Appointments"),
        ),
        body: _buildListTile(list: itemList));
  }
}

_buildListTile({List<Appointment>? list}) {
  if (list == null) {
    return const Center(
      child: Text("Check Settings and Enter the Right Credentials"),
    );
  }
}
