// ignore_for_file: sized_box_for_whitespace

import 'package:droppa_clone/screens/parcel.dart';
import 'package:droppa_clone/screens/rental_service_screen.dart';
import 'package:droppa_clone/screens/vehlicle_quote_screen.dart';
import 'package:droppa_clone/widgets/buttom_sheet.dart';
import 'package:flutter/material.dart';

class QuoteRequestScreen extends StatefulWidget {
  final String title;
  final String description;

  const QuoteRequestScreen(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  State<QuoteRequestScreen> createState() => _QuoteRequestScreenState();
}

class _QuoteRequestScreenState extends State<QuoteRequestScreen> {
  String? _title;
  String? _description;

  @override
  void initState() {
    _title = widget.title;
    _description = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        actions: const [
          Icon(Icons.chat),
        ],
        title: Text('$_title'),
        centerTitle: true,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Icon(Icons.arrow_back),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Column(
                children: const [
                  Image(
                    width: 400,
                    image: ExactAssetImage('assets/barr.png'),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.my_location_outlined,
                                color: Colors.blue,
                                size: 30,
                              ),
                              Container(
                                width: 225,
                                height: 30,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const TextField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isDismissible: false,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                builder: (BuildContext context) {
                                  return const ButtomSheetWidget();
                                });
                          },
                          child: const Text(
                            "Can't find address? Click here",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 40, 63, 73),
                      ),
                      //color: Colors.black54,
                      child: const Center(
                        child: Text(
                          'Pick-up address',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // margin: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 15,
                        color: Color.fromARGB(255, 219, 8, 8),
                      ),
                      const Text(' - - - - - - '),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 219, 8, 8),
                        ),
                        //color: Colors.black54,
                        child: const Center(
                          child: Text(
                            'Selected Service',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const Text(' - - - - - - '),
                      const Icon(
                        Icons.circle,
                        size: 15,
                        color: Color.fromARGB(255, 219, 8, 8),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 44,
                          minHeight: 44,
                          maxWidth: 64,
                          maxHeight: 100,
                        ),
                        child: Image.asset('assets/dropskyflight.png',
                            fit: BoxFit.scaleDown),
                      ),
                      title: Text(
                        '$_title',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text('$_description'),
                      trailing: const Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.my_location_outlined,
                                color: Color.fromARGB(255, 226, 13, 13),
                                size: 30,
                              ),
                              Container(
                                width: 225,
                                height: 30,
                                child: const TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        const InkWell(
                          child: Text(
                            "Can't find address? Click here",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 40, 63, 73),
                      ),
                      //color: Colors.black54,
                      child: const Center(
                        child: Text(
                          'Drop-off address',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VehicleQuoteScreen(),
                    ),
                  );
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 0,
                minWidth: double.minPositive,
                child: const Text(
                  'Get quote',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
