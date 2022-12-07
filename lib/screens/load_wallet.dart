import 'package:droppa_clone/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadWalletScreen extends StatefulWidget {
  const LoadWalletScreen({super.key});

  @override
  State<LoadWalletScreen> createState() => _LoadWalletScreenState();
}

class _LoadWalletScreenState extends State<LoadWalletScreen> {
  //varialbles
  int _groupValue = 0;
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Load Wallet'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 30,
              width: 300,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40, 63, 73),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
              child: const Center(
                child: Text(
                  'Droppa wallet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Wallet balance',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'R0,00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 300,
            decoration: _groupValue == 0 || _isSelected1
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: Colors.grey[200],
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'R500',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Radio(
                  value: 1,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 1;
                      _isSelected1 = true;
                      _isSelected2 = false;
                      _isSelected3 = false;
                      _isSelected4 = false;
                      _isSelected5 = false;
                      _isSelected6 = false;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: _groupValue == 0 || _isSelected2
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: Colors.grey[200],
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'R1 000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Radio(
                  value: 2,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 2;
                      _isSelected1 = false;
                      _isSelected2 = true;
                      _isSelected3 = false;
                      _isSelected4 = false;
                      _isSelected5 = false;
                      _isSelected6 = false;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: _groupValue == 0 || _isSelected3
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: Colors.grey[200],
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'R2 000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Radio(
                  value: 3,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 3;
                      _isSelected1 = false;
                      _isSelected2 = false;
                      _isSelected3 = true;
                      _isSelected4 = false;
                      _isSelected5 = false;
                      _isSelected6 = false;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: _groupValue == 0 || _isSelected4
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: Colors.grey[200],
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'R5 000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Radio(
                  value: 4,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 4;
                      _isSelected1 = false;
                      _isSelected2 = false;
                      _isSelected3 = false;
                      _isSelected4 = true;
                      _isSelected5 = false;
                      _isSelected6 = false;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: _groupValue == 0 || _isSelected5
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: Colors.grey[200],
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'R10 000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Radio(
                  value: 5,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 5;
                      _isSelected1 = false;
                      _isSelected2 = false;
                      _isSelected3 = false;
                      _isSelected4 = false;
                      _isSelected5 = true;
                      _isSelected6 = false;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: _groupValue == 0 || _isSelected6
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  )
                : BoxDecoration(
                    color: Colors.grey[200],
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'R20 000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Radio(
                  value: 6,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 6;
                      _isSelected1 = false;
                      _isSelected2 = false;
                      _isSelected3 = false;
                      _isSelected4 = false;
                      _isSelected5 = false;
                      _isSelected6 = true;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: RsButton(
              title: 'Credit wallet',
              radisNumber: 20,
              onTaped: () {},
            ),
          ),
        ],
      ),
    );
  }
}
