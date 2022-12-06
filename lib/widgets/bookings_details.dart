import 'package:droppa_clone/screens/booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingsDetails extends StatelessWidget {
  const BookingsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 400,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Saturday,Dec 24,2022',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.Spa,
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 25,
                        ),
                        // Flexible(
                        //   child:
                        SizedBox(
                          width: 250,
                          child: Text(
                              '852 kobus st,Silverton, Pretoria, 0184, South Africa'),
                        ),
                        //  ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: RichText(
                              text: const TextSpan(
                                text: '---',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 250,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.Spa,
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 25,
                        ),
                        // Flexible(
                        //   child:
                        SizedBox(
                          width: 250,
                          child: Text(
                              '852 kobus st,Silverton, Pretoria, 0184, South Africa'),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  child: Center(
                    child: Text(
                      'MINI_VAN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Pick-up Details'),
              Text('2022-12-24'),
              Text('11:34 AM'),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Text(
              'Awaiting payments',
              style: TextStyle(fontSize: 17, color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
