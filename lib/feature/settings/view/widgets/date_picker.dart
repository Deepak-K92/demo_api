import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:demo_api/feature/settings/view/widgets/input_field.dart';
import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';

const double _size_325 = 325;
const double _size_400 = 400;

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  const DatePicker({super.key, required this.controller});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  var selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.controller.text = changeToIndianFormat(selectedDate);
    });
  }

  changeToIndianFormat(DateTime date) =>
      "${date.day}/${date.month}/${date.year}";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Text(Static.dateHeading),
        ),
        Expanded(
          flex: 3,
          child:
              InputField(controller: widget.controller, labelText: Static.date),
        ),
        Expanded(
          child: CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: IconButton(
              onPressed: () async {
                List<DateTime?>? temp = await _buildDatePickerDialog();
                setState(() {
                  widget.controller.text = changeToIndianFormat(
                      temp == null || temp.length == 0
                          ? DateTime.now()
                          : temp[0]!);
                });
              },
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
                size: StaticVal.size_20,
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildDatePickerDialog() {
    return showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: const Size(_size_325, _size_400),
    );
  }
}
