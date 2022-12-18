import 'package:droppa_clone/backend/classes/booking.dart';

class LookUp {
  static final provinces = [
    'Limpopo',
    'Mpumalanga',
    'Free State',
    'Gauteng',
    'Western Cape',
    'Eastern Cape',
    'North West',
    'Northern Cape',
    'Kwazulu Natal',
  ];

  static final typesOfTruck = [
    'Non Refrigerated',
    'Refrigerated',
  ];

  static List<Booking> bookings = [
    Booking(
        pickupadress: 'Mogalatsane',
        dropoffadress: '2 Waterbessie Ave, Roodekrans, Roodepoort, 1724',
        status: 'Awaiting for payments',
        vehicle: 'Mini-Van'),
    Booking(
        pickupadress: 'Elandskraal',
        dropoffadress: '88 Montjane St, Emangweni, Tembisa',
        status: 'Driver Assigned',
        vehicle: '1-ton'),
    Booking(
        pickupadress: 'Elandskraal',
        dropoffadress: '88 Montjane St, Emangweni, Tembisa',
        status: 'Completed',
        vehicle: '1-ton'),
  ];
}
