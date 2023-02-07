import 'package:demo_api/feature/home/model/view_appointments_arg.dart';
import 'package:demo_api/feature/view_appointments/view/widgets/custom_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../static/strings.dart';

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
      backgroundColor: Color.fromARGB(222, 255, 255, 255),
      appBar: AppBar(
        title: Text(model == null ? Static.viewAppoinments : model.fullName),
      ),
      body: model == null ? _buildNullBody() : _buildListView(model: model),
    );
  }

  _buildNullBody() => const Center(
        child: Text(Static.nullBodyText,
            style: TextStyle(
                color: Colors.purple,
                fontSize: StaticVal.size_18,
                fontWeight: FontWeight.w400)),
      );
}

_buildListView({required ViewAppointmentsArguments model}) {
  if (model.responseCode == Static.responseCodeOK) {
    return ListView.builder(
      itemCount: model.itemList.length,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) =>
          CustomCard(appointment: model.itemList[index]),
    );
  }
  if (model.responseCode == Static.responseCodeNoDATA) {}
}
