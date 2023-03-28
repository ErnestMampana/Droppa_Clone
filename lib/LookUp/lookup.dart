import 'package:droppa_clone/backend/classes/Rental.dart';
import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:droppa_clone/backend/classes/person.dart';

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

//prices
  static double finalPrice = 0.0;
  static double basePrice = 37;
  static double minivanPrice = 170;
  static double oneTonVanPrice = 220;
  static double pointFivePrice = 270;
  static double fourTonTruckPrice = 550;
  static double eightTonTruckPrice = 1000;

  static final rentalBranch = [
    'EAST RAND AND HEADOFFICE',
    'WEST RAND',
    'Cape Town',
    'Durban',
    'Polokwane',
    'Nelspruit',
    'Droppa Rental'
  ];

  static final typesOfTruck = [
    'Non Refrigerated',
    'Refrigerated',
  ];

  static final adressType = [
    'Business',
    'Residential',
  ];

  static List<Booking> bookings = [
    // Booking(
    //     pickupadress: 'Mogalatsane',
    //     dropoffadress: '2 Waterbessie Ave, Roodekrans, Roodepoort, 1724',
    //     status: 'Awaiting for payments',
    //     vehicle: 'Mini-Van'),
    // Booking(
    //     pickupadress: 'Elandskraal',
    //     dropoffadress: '88 Montjane St, Emangweni, Tembisa',
    //     status: 'Driver Assigned',
    //     vehicle: '1-ton'),
    // Booking(
    //     pickupadress: 'Elandskraal',
    //     dropoffadress: '88 Montjane St, Emangweni, Tembisa',
    //     status: 'Completed',
    //     vehicle: '1-ton'),
  ];

  static List<Rental> rentals =[];

  //For Rental service page
  static String streetAddress = "";
  static int postalCode = 0;
  static String suburb = "";
  static String province = "";
  static String complexName = "";
  static int unitNumber = 0;
  static String? startDate;
  static String? endDate;
  static String truckType = "";
  static int noDays = 0;
}
