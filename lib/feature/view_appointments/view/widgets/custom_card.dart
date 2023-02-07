import 'package:demo_api/common/model/appointment_model.dart';
import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';

const _headerTextStyle = TextStyle(
    color: Colors.black54,
    fontSize: StaticVal.size_20 - 3,
    fontWeight: FontWeight.bold);

class CustomCard extends StatelessWidget {
  final Appointment appointment;
  const CustomCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_buildNameWidget(appointment.customerName)],
      ),
    );
  }
}

_buildNameWidget(CustomerName name) {
  return Row(
    children: <Widget>[
      Expanded(
        flex: StaticVal.size_4.toInt(),
        child: const Text(Static.customerName + " : ", style: _headerTextStyle),
      ),
      Expanded(
        flex: 5,
        child: Row(
          children: [
            Text("${name.firstName} ${name.surname}".returnNoDataVal()),
          ],
        ),
      )
    ],
  );
}
