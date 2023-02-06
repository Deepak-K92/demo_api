import 'package:demo_api/feature/home/model/response_view_model.dart';

import '../../../common/model/appointment_model.dart';
import 'package:flutter/material.dart';

class ViewAppointments extends StatelessWidget {
  final ResponseViewModel? responseViewModel;
  ViewAppointments({
    super.key,
    this.responseViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("View Appointments"),
        ),
        body: _buildListTile(model: responseViewModel));
  }
}

_buildListTile({ResponseViewModel? model}) {
  if (model?.appointment == null) {
    return const Center(
      child: Text("Check Settings and Enter the Right Credentials"),
    );
  }
  if (model!.appointment.isNotEmpty && model.responseCode.contains('SC0001')) {
    _buildListTilesWithData(data: model);
  }
  if (model!.appointment.isNotEmpty && model.responseCode.contains('SC0002')) {
    _buildListTilesNoData(data: model);
  }
}

_buildListTilesNoData({required ResponseViewModel data}) {}

ListView _buildListTilesWithData({required ResponseViewModel data}) {
  return ListView.builder(
    itemCount: data.appointment.length,
    itemBuilder: (context, index) {
      return Text(
          "${data.appointment[index].customerName.firstName} ${data.appointment[index].customerName.surname}");
    },
  );
}
