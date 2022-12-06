import 'package:flutter/material.dart';

class Booking with ChangeNotifier {
  final String? pickupadress;
  final String? dropoffadress;
  final DateTime? date;
  final String? vehicle;
  final String? status;
  final String? pickUpName;
  final String? pickUpCellphone;
  final String? dropOffName;
  final String? dropOffPhone;
  final String? paymentType;
  final int? loads;
  final int? labours;
  final String? trackNumber;
  final String? itemsToBeDelivered;

  Booking({
    this.pickupadress,
    this.dropoffadress,
    this.date,
    this.vehicle,
    this.status,
    this.paymentType,
    this.loads,
    this.labours,
    this.trackNumber,
    this.itemsToBeDelivered,
    this.pickUpName,
    this.pickUpCellphone,
    this.dropOffName,
    this.dropOffPhone,
  });

  Map<String, dynamic> toMap() {
    return {
      'pickupadress': pickupadress,
      'dropoffadress': dropoffadress,
      'date': date,
      'vehicle': vehicle,
      'status': status,
      'paymentType': paymentType,
      'loads': loads,
      'labours': labours,
      'trackNumber': trackNumber,
      'itemsToBeDelivered': itemsToBeDelivered,
      'pickUpName': pickUpName,
      'pickUpCellphone': pickUpCellphone,
      'dropOffName': dropOffName,
      'dropOffPhone': dropOffPhone,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      pickupadress: json['pickupadress'],
      dropoffadress: json['dropoffadress'],
      date: json['date'],
      vehicle: json['vehicle'],
      status: json['status'],
      paymentType: json['paymentType'],
      loads: json['loads'],
      labours: json['labours'],
      trackNumber: json['trackNumber'],
      itemsToBeDelivered: json['itemsToBeDelivered'],
      pickUpName: json['pickUpName'],
      pickUpCellphone: json['pickUpCellphone'],
      dropOffName: json['dropOffName'],
      dropOffPhone: json['dropOffPhone'],
    );
  }

  static List<Booking> bookings = [
    Booking(
        pickupadress: 'Mogalatsane',
        dropoffadress: 'Leboakgomo',
        status: 'Awaiting for payments',
        vehicle: '1-ton'),
    Booking(
        pickupadress: 'Mogalatsane',
        dropoffadress: 'Leboakgomo',
        status: 'Awaiting for payments',
        vehicle: '1-ton'),
  ];
}
