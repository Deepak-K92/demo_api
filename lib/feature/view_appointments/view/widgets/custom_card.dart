import 'package:demo_api/common/model/appointment_model.dart';
import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';
import '../../../../static/styles.dart';

class CustomCard extends StatelessWidget {
  final Appointment appointment;
  const CustomCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(StaticVal.size_15),
          color: Colors.white),
      padding: const EdgeInsets.symmetric(
          horizontal: StaticVal.size_5, vertical: StaticVal.size_10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildNameWidget(appointment.customerName),
          _buildHeader(
              headerName: Static.customerAddress,
              icon: Icons.apartment_rounded),
          _buildAddressWidget(appointment.address),
          _buildHeader(headerName: Static.appointmentDetails, icon: Icons.work),
          _buildAppointmentDetails(appointment.appointmentDetails),
        ],
      ),
    );
  }
}

_buildNameWidget(CustomerName name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildHeader(headerName: Static.customerName, icon: Icons.person),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: StaticVal.size_25),
        child: Text(name.firstName.giveGap() + name.surname.returnNoDataVal(),
            style: errorHandling),
      )
    ],
  );
}

_buildAddressWidget(Address address) {
  return ListView(
    padding: const EdgeInsets.only(left: 50),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      _buildRowNameAndValueWidget(
          labelName: Static.companyName, value: address.companyName),
      _buildRowNameAndValueWidget(
          labelName: Static.buidingName, value: address.buildingName),
      _buildRowNameAndValueWidget(
          labelName: Static.customerStreet, value: address.street),
      _buildRowNameAndValueWidget(
          labelName: Static.addressArea, value: address.areaTown),
      _buildRowNameAndValueWidget(
          labelName: Static.addressTown, value: address.addressArea),
      _buildRowNameAndValueWidget(
          labelName: Static.county, value: address.county),
    ],
  );
}

_buildAppointmentDetails(AppointmentDetails appointmentDetails) {
  return ListView(
    padding: const EdgeInsets.only(left: 50),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      _buildRowNameAndValueWidget(
          labelName: Static.chargeType, value: appointmentDetails.chargeType),
      _buildRowNameAndValueWidget(
          labelName: Static.jobType, value: appointmentDetails.jobType),
    ],
  );
}

_buildRowNameAndValueWidget(
    {required String labelName, required String value, IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: StaticVal.size_2),
    child: Row(
      children: <Widget>[
        icon != null
            ? Expanded(
                flex: 1,
                child: Icon(icon, color: Colors.deepPurple),
              )
            : Container(),
        Expanded(
          flex: 3,
          child: Text(labelName.addColon(), style: headerTextStyle),
        ),
        Expanded(
          flex: 4,
          child: Text(value.returnNoDataVal(), style: errorHandling),
        ),
      ],
    ),
  );
}

_buildHeader({required String headerName, required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: StaticVal.size_4),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        Expanded(
          flex: 7,
          child: Text(headerName.addColon(), style: headerTextStyle2),
        ),
      ],
    ),
  );
}
