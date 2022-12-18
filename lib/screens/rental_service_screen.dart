import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/screens/login_screen.dart';
import 'package:droppa_clone/screens/rental_quote_screen.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RentalServiceScreen extends StatefulWidget {
  const RentalServiceScreen({Key? key}) : super(key: key);

  @override
  State<RentalServiceScreen> createState() => _RentalServiceScreenState();
}

class _RentalServiceScreenState extends State<RentalServiceScreen> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Rental Service'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(children: const [
              Text(
                'Collection Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            const RentalTextField(label: 'Street Address'),
            const SizedBox(
              height: 20,
            ),
            const RentalTextField(
              label: 'Postal Code',
            ),
            const SizedBox(
              height: 20,
            ),
            const RentalTextField(
              label: 'Suburb',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: const [
              Text(
                'Province',
                textAlign: TextAlign.start,
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                border: OutlineInputBorder(),
              ),
              items: LookUp.provinces
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (dynamic value) {
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const RentalTextField(
              label: 'Complex Name (Optional)',
            ),
            const SizedBox(
              height: 20,
            ),
            const RentalTextField(
              label: 'Unit Number/Floor (Optional)',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: const [
              Text(
                'Rental Period',
                textAlign: TextAlign.start,
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(
                  const Duration(days: 4),
                ),
                DateTime.now().add(
                  const Duration(days: 3),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: const [
              Text(
                'Type Of Truck',
                textAlign: TextAlign.start,
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                border: OutlineInputBorder(),
              ),
              items: LookUp.typesOfTruck
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (dynamic value) {
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('is the distance over 200km?'),
                Switch(value: false, onChanged: (dynamic value) {}),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RsButton(
                title: 'Next',
                radisNumber: 5,
                onTaped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RentalQuoteScreen(),
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }
}
