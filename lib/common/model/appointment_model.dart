class Appointment {
  final CustomerName customerName;
  final Address address;
  final AppointmentDetails appointmentDetails;
  final String postCode;
  final String mobileNo;

  Appointment({
    required this.customerName,
    required this.address,
    required this.appointmentDetails,
    required this.postCode,
    required this.mobileNo,
  });
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
}

class AppointmentDetails {
  final String chargeType;
  final String jobType;
  AppointmentDetails({required this.chargeType, required this.jobType});
}

class CustomerName {
  final String firstName;
  final String surname;
  CustomerName({required this.firstName, required this.surname});
}
