import 'package:demo_api/static/strings.dart';

import '../../../../common/model/appointment_model.dart';
import '../../data_layer/data_models/response_data_model.dart';
import '../../data_layer/data_models/service_parameter_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

abstract class PostDataDataSource {
  Future getDataFromSource(
      ServiceParameterDataModel parameterDataModel) async {}
}

class PostDataSourceImpl implements PostDataDataSource {
  final http.Client client;

  PostDataSourceImpl({required this.client});

  @override
  Future<ResponseDataModel> getDataFromSource(
      ServiceParameterDataModel parameterDataModel) async {
    var body = '''
    <GetAppointmentDetails>
    <SLUsername>${parameterDataModel.userName}</SLUsername>
    <SLPassword>${parameterDataModel.password}</SLPassword>
    <CurrentDate>${parameterDataModel.currentDate.day}/${parameterDataModel.currentDate.month}/${parameterDataModel.currentDate.year}</CurrentDate>
    </GetAppointmentDetails>
    ''';
    final resp = await client.post(Uri.parse(parameterDataModel.url),
        headers: {'content-type': 'text/xml'}, body: body);

    final data = '''<?xml version="1.0"?>${resp.body}''';
    return _changeToModel(data);
  }

  ResponseDataModel _changeToModel(String doc) {
    //? Define XmlDoc Parser
    final docx = XmlDocument.parse(doc);

    // *  Working Response Code
    final responsCode = docx
        .findAllElements('ResponseCode')
        .map((e) => e.text)
        .reduce((value, element) => value);
    // *  Working Response Description
    final responseDescription = docx
        .findAllElements('ResponseDescription')
        .map((e) => e.text)
        .reduce((value, element) => value);
    // * Working Full Name
    final fullName = docx
        .findAllElements('FullName')
        .map((e) => e.text)
        .reduce((value, element) => value);

    //? Customer Name
    var namesIterable = docx.findAllElements('Appointment').map((appointment) {
      return CustomerName(
          firstName:
              appointment.findAllElements('CustomerForename').single.text,
          surname: appointment.findAllElements('CustomerSurname').single.text);
    });
    // * Working CustomerName
    List<CustomerName> name = List.from(namesIterable);

    //? Latitude
    var latitudeIterable =
        docx.findAllElements('Appointment').map((appointment) {
      return appointment.findAllElements('ApptLatitude').single.text;
    });
    // * Working Latitude
    List<String> latitude = List.from(latitudeIterable);

    //? Longitude
    var longitudeIterable =
        docx.findAllElements('Appointment').map((appointment) {
      return appointment.findAllElements('ApptLongitude').single.text;
    });
    // * Working Longitude
    List<String> longitude = List.from(longitudeIterable);

    //? Address
    var addressIterable =
        docx.findAllElements('Appointment').map((appointment) {
      return Address(
          companyName:
              appointment.findAllElements('CustomerCompanyName').single.text,
          buildingName:
              appointment.findAllElements('CustomerBuildingName').single.text,
          street: appointment.findAllElements('CustomerStreet').single.text,
          addressArea:
              appointment.findAllElements('CustomerAddressArea').single.text,
          areaTown:
              appointment.findAllElements('CustomerAddressTown').single.text,
          county: appointment.findAllElements('CustomerCounty').single.text);
    });

    // * Working Address
    List<Address> address = List.from(addressIterable);

    //? Appointment Details
    var appointmentDetailsIterable =
        docx.findAllElements('Appointment').map((appointment) {
      return AppointmentDetails(
          chargeType: appointment.findAllElements('ChargeType').single.text,
          jobType: appointment.findAllElements('JobType').single.text);
    });

    // * Working AppointmentDetails
    List<AppointmentDetails> appointmentDetails =
        List.from(appointmentDetailsIterable);

    //? PostCode
    var postCodeIterable =
        docx.findAllElements('Appointment').map((appointment) {
      return appointment.findAllElements('CustomerPostcode').single.text;
    });

    // * Working PostCode
    List<String> postCode = List.from(postCodeIterable);

    //? MobileNo
    var mobNoIterable = docx.findAllElements('Appointment').map((appointment) {
      return appointment.findAllElements('CustomerMobileNo').single.text;
    });

    // * Working MobileNumber
    List<String> mobNo = List.from(mobNoIterable);

    // * Working AppointmentList
    List<Appointment> appointmentList = _mapToAppointmentList(name, address,
        appointmentDetails, postCode, mobNo, latitude, longitude);

    if (responsCode == Static.responseCodeOK) {
      return ResponseDataModel(
          responseCode: responsCode.toString(),
          responseDescription: responseDescription.toString(),
          fullName: fullName.toString(),
          appointment: appointmentList);
    } else {
      return ResponseDataModel(
          responseCode: responsCode.toString(),
          responseDescription: responseDescription.toString(),
          fullName: fullName.toString(),
          appointment: []);
    }
  }

  List<Appointment> _mapToAppointmentList(
    List<CustomerName> name,
    List<Address> address,
    List<AppointmentDetails> appointmentDetails,
    List<String> postCode,
    List<String> mobNo,
    List<String> latitude,
    List<String> longitude,
  ) {
    List<Appointment> appointmentsList = [];

    for (int i = 0; i < address.length; i++) {
      appointmentsList.add(Appointment(
        customerName: name[i],
        address: address[i],
        appointmentDetails: appointmentDetails[i],
        postCode: postCode[i],
        mobileNo: mobNo[i],
        latitude: latitude[i],
        longitude: longitude[i],
      ));
    }
    // * Return AppointmentList
    return appointmentsList;
  }
}
