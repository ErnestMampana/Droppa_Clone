// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

Rental? rentalDetails;

class Rental with ChangeNotifier {
  String? rentalId;
  String? streetAddress;
  int? postalCode;
  String? suburb;
  String? province;
  String? complexName;
  int? unitNumber;
  String? startDate;
  String? endDate;
  String? truckType;
  double? price;
  String? companyName;
  String? contactPerson;
  String? mobileNumber;
  String? rentalBrunch;
  int? labours;
  int? noDays;
  String? instruction;

  Rental({
    this.rentalId,
    this.streetAddress,
    this.postalCode,
    this.suburb,
    this.province,
    this.complexName,
    this.unitNumber,
    this.startDate,
    this.endDate,
    this.truckType,
    this.price,
    this.companyName,
    this.contactPerson,
    this.mobileNumber,
    this.rentalBrunch,
    this.labours,
    this.noDays,
    this.instruction,
  });

  Map<String, dynamic> toMap() {
    return {
      'rentalId': rentalId,
      'streetAddress': streetAddress,
      'postalCode': postalCode,
      'suburb': suburb,
      'province': province,
      'complexName': complexName,
      'unitNumber': unitNumber,
      'startDate': startDate,
      'endDate': endDate,
      'truckType': truckType,
      'price': price,
      'companyName': companyName,
      'contactPerson': contactPerson,
      'mobileNumber': mobileNumber,
      'rentalBunch': rentalBrunch,
      'labours': labours,
      'noDays': noDays,
      'instruction': instruction,
    };
  }

  factory Rental.fromJson(Map<String, dynamic> json) {
    return Rental(
        rentalId: json['rentalId'],
        streetAddress: json['streetAddress'],
        postalCode: json['postalCode'],
        suburb: json['suburb'],
        province: json['province'],
        complexName: json['complexName'],
        unitNumber: json['unitNumber'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        truckType: json['truckType'],
        price: json['price'],
        companyName: json['companyName'],
        contactPerson: json['contactPerson'],
        mobileNumber: json['mobileNumber'],
        rentalBrunch: json['rentalBrunch'],
        labours: json['labours'],
        noDays: json['noDays'],
        instruction: json['instruction']);
  }
}
