import 'package:demo_api/feature/home/model/view_appointments_arg.dart';
import 'package:demo_api/feature/view_appointments/view/widgets/custom_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../static/strings.dart';
import '../view/widgets/error_widget.dart';

class ViewAppointments extends StatefulWidget {
  const ViewAppointments({
    super.key,
  });

  @override
  State<ViewAppointments> createState() => _ViewAppointmentsState();
}

class _ViewAppointmentsState extends State<ViewAppointments> {
  late ViewAppointmentsArguments model;
  @override
  void initState() {
    super.initState();
    model = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
            model.fullName != "" ? model.fullName : Static.viewAppoinments),
      ),
      body: (model == null ? _buildNullBody() : _buildListView(model: model)) ??
          _buildNullBody(),
    );
  }

  _buildNullBody() => const Center(
        child: Padding(
          padding: EdgeInsets.all(StaticVal.size_18),
          child: ErrorWidgetCustom(
              message: Static.nullBodyText, icon: Icons.warning_amber_rounded),
        ),
      );
}

_buildListView({required ViewAppointmentsArguments model}) {
  if (model.responseCode == Static.responseCodeOK) {
    return ListView.builder(
      itemCount: model.appointments.length,
      padding: const EdgeInsets.symmetric(
          horizontal: StaticVal.size_7, vertical: StaticVal.size_8),
      itemBuilder: (context, index) =>
          CustomCard(appointment: model.appointments[index]),
    );
  }
  if (model.responseCode == Static.responseCodeNoDATA) {
    return ErrorWidgetCustom(
      message: model.responseDescription,
      icon: Icons.calendar_today,
    );
  }
}
