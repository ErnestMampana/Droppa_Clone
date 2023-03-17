import 'package:flutter/material.dart';

BookingItem? book;

class Booking with ChangeNotifier {
  final String? userId;
  final String? bookingId;
  final String? pickupadress;
  final String? dropoffadress;
  final String? date;
  final String? vehicle;
  final String? status;
  final String? pickUpName;
  final String? pickUpCellphone;
  final String? dropOffName;
  final String? dropOffPhone;
  final String? paymentType;
  final String? time;
  final int? loads;
  final int? labours;
  final String? trackNumber;
  final String? itemsToBeDelivered;
  final double? bookingPrice;

  Booking({
    this.userId,
    this.bookingId,
    this.pickupadress,
    this.dropoffadress,
    this.date,
    this.vehicle,
    this.status,
    this.paymentType,
    this.time,
    this.loads,
    this.labours,
    this.trackNumber,
    this.itemsToBeDelivered,
    this.pickUpName,
    this.pickUpCellphone,
    this.dropOffName,
    this.dropOffPhone,
    this.bookingPrice
  });

  Map<String, dynamic> toMap() {
    return {
      'userId' : userId,
      'bookingId' : bookingId,
      'pickupadress': pickupadress,
      'dropoffadress': dropoffadress,
      'date': date,
      'vehicle': vehicle,
      'status': status,
      'paymentType': paymentType,
      'time' :time,
      'loads': loads,
      'labours': labours,
      'trackNumber': trackNumber,
      'itemsToBeDelivered': itemsToBeDelivered,
      'pickUpName': pickUpName,
      'pickUpCellphone': pickUpCellphone,
      'dropOffName': dropOffName,
      'dropOffPhone': dropOffPhone,
      'bookingPrice' : bookingPrice
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      userId : json['userId'],
      bookingId : json['bookingId'],
      pickupadress: json['pickUpAddess'],
      dropoffadress: json['dropOffAdress'],
      date: json['bookingDate'],
      vehicle: json['vehicleType'],
      status: json['status'],
      paymentType: json['paymentType'],
      time : json['time'],
      loads: json['loads'],
      labours: json['labours'],
      trackNumber: json['trackNumber'],
      itemsToBeDelivered: json['itemsToBeDelivered'],
      pickUpName: json['dropDetails']['pickUpNames'],
      pickUpCellphone: json['dropDetails']['pickUpContact'],
      dropOffName: json['dropDetails']['dropOffNames'],
      dropOffPhone: json['dropDetails']['dropOffContact'],
      bookingPrice: json['price']
    );
  }
}

class BookingItem with ChangeNotifier {
  final String? userId;
  final String? bookingId;
  final String? pickupadress;
  final String? dropoffadress;
  final String? date;
  final String? vehicle;
  final String? status;
  final String? pickUpName;
  final String? pickUpCellphone;
  final String? dropOffName;
  final String? dropOffPhone;
  final String? paymentType;
  final String? time;
  final int? loads;
  final int? labours;
  final String? trackNumber;
  final String? itemsToBeDelivered;
  final double? bookingPrice;

  BookingItem({
    this.userId,
    this.bookingId,
    this.pickupadress,
    this.dropoffadress,
    this.date,
    this.vehicle,
    this.status,
    this.paymentType,
    this.time,
    this.loads,
    this.labours,
    this.trackNumber,
    this.itemsToBeDelivered,
    this.pickUpName,
    this.pickUpCellphone,
    this.dropOffName,
    this.dropOffPhone,
    this.bookingPrice
  });

  Map<String, dynamic> toMap() {
    return {
      'userId' : userId,
      'bookingId' : bookingId,
      'pickupadress': pickupadress,
      'dropoffadress': dropoffadress,
      'date': date,
      'vehicle': vehicle,
      'status': status,
      'paymentType': paymentType,
      'time' :time,
      'loads': loads,
      'labours': labours,
      'trackNumber': trackNumber,
      'itemsToBeDelivered': itemsToBeDelivered,
      'pickUpName': pickUpName,
      'pickUpCellphone': pickUpCellphone,
      'dropOffName': dropOffName,
      'dropOffPhone': dropOffPhone,
      'bookingPrice' : bookingPrice
    };
  }

  factory BookingItem.fromJson(Map<String, dynamic> json) {
    return BookingItem(
      userId : json['userId'],
      bookingId : json['bookingId'],
      pickupadress: json['pickupadress'],
      dropoffadress: json['dropoffadress'],
      date: json['date'],
      vehicle: json['vehicle'],
      status: json['status'],
      paymentType: json['paymentType'],
      time : json['time'],
      loads: json['loads'],
      labours: json['labours'],
      trackNumber: json['trackNumber'],
      itemsToBeDelivered: json['itemsToBeDelivered'],
      pickUpName: json['pickUpName'],
      pickUpCellphone: json['pickUpCellphone'],
      dropOffName: json['dropOffName'],
      dropOffPhone: json['dropOffPhone'],
      bookingPrice: json['bookingPrice']
    );
  }
}
