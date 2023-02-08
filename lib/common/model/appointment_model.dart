class Appointment {
  final CustomerName customerName;
  final Address address;
  final AppointmentDetails appointmentDetails;
  final String postCode;
  final String mobileNo;
  final String latitude;
  final String longitude;

  Appointment(
      {required this.customerName,
      required this.address,
      required this.appointmentDetails,
      required this.postCode,
      required this.mobileNo,
      required this.latitude,
      required this.longitude});

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        customerName: CustomerName.fromJson(json['customerName']),
        address: Address.fromJson(json['address']),
        appointmentDetails:
            AppointmentDetails.fromJson(json['appointmentDetails']),
        postCode: json['postCode'],
        mobileNo: json['mobileNo'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'customerName': customerName.toJson(),
        'address': address.toJson(),
        'appointmentDetails': appointmentDetails.toJson(),
        'postCode': postCode,
        'mobileNo': mobileNo,
        'latitude': latitude,
        'longitude': longitude,
      };
}

class Address {
  final String companyName;
  final String buildingName;
  final String street;
  final String addressArea;
  final String areaTown;
  final String county;

  Address({
    required this.companyName,
    required this.buildingName,
    required this.street,
    required this.addressArea,
    required this.areaTown,
    required this.county,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
      companyName: json['companyName'],
      buildingName: json['buildingName'],
      street: json['street'],
      addressArea: json['addressArea'],
      areaTown: json['areaTown'],
      county: json['county']);
  toJson() => {
        'companyName': companyName,
        'buildingName': buildingName,
        'street': street,
        'addressArea': addressArea,
        'areaTown': areaTown,
        'county': county
      };
}

class AppointmentDetails {
  final String chargeType;
  final String jobType;
  AppointmentDetails({required this.chargeType, required this.jobType});
  factory AppointmentDetails.fromJson(Map<String, dynamic> json) =>
      AppointmentDetails(
          chargeType: json['chargeType'], jobType: json['jobType']);
  toJson() => {
        'chargeType': chargeType,
        'jobType': jobType,
      };
}

class CustomerName {
  final String firstName;
  final String surname;
  CustomerName({required this.firstName, required this.surname});
  factory CustomerName.fromJson(Map<String, dynamic> json) =>
      CustomerName(firstName: json['firstName'], surname: json['surname']);
  toJson() => {
        'firstName': firstName,
        'surname': surname,
      };
}
