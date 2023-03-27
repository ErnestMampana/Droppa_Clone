// ignore_for_file: use_build_context_synchronously

import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/payment_screen.dart';
import 'package:droppa_clone/screens/wallet_credit_screen.dart';
import 'package:droppa_clone/screens/wallet_screen.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/dialog.dart';
import 'package:droppa_clone/widgets/walllet_amount_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

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
  double? _price = 00.0;

  final UserService _userService = UserService();

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
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Consumer<AppData>(
                  builder: (context, value, child) {
                    return Text(
                      'R ${value.walletPrice + _price!}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    );
                  },
                ),
                // ),
              ],
            ),
          ),
          WalletAmountSelect(
            onTap: () => _changeRadio(1),
            price: "R 500",
            value: 1,
            groupValue: _groupValue,
            isSelected: _isSelected1,
            onChanged: (value) {
              _changeRadio(1);
            },
          ),
          WalletAmountSelect(
            onTap: () => _changeRadio(2),
            price: "R 1000",
            value: 2,
            groupValue: _groupValue,
            isSelected: _isSelected2,
            onChanged: (value) {
              _changeRadio(2);
            },
          ),
          WalletAmountSelect(
            onTap: () => _changeRadio(3),
            price: "R 2000",
            value: 3,
            groupValue: _groupValue,
            isSelected: _isSelected3,
            onChanged: (value) {
              _changeRadio(3);
            },
          ),
          WalletAmountSelect(
            onTap: () => _changeRadio(4),
            price: "R 5000",
            value: 4,
            groupValue: _groupValue,
            isSelected: _isSelected4,
            onChanged: (value) {
              _changeRadio(4);
            },
          ),
          WalletAmountSelect(
            onTap: () => _changeRadio(5),
            price: "R 10 000",
            value: 5,
            groupValue: _groupValue,
            isSelected: _isSelected5,
            onChanged: (value) {
              _changeRadio(5);
            },
          ),
          WalletAmountSelect(
            onTap: () => _changeRadio(6),
            price: "R 20 000",
            value: 6,
            groupValue: _groupValue,
            isSelected: _isSelected6,
            onChanged: (value) {
              _changeRadio(6);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: RsButton(
              title: 'Credit wallet',
              radisNumber: 20,
              onTaped: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WalletCreditScreen(totalPrice: _price!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _loadWallet() async {
    DialogUtils.showLoading(context);
    double amount = await _userService.loadWallet(_price!);
    context.read<AppData>().changePrice(amount);
    DialogUtils.hideDialog(context);
    // setState(() {
    //   Navigator.pop(context);
    // });
  }

  _changeRadio(int itemNumber) {
    if (itemNumber == 1) {
      setState(() {
        _groupValue = itemNumber;
        _isSelected1 = true;
        _isSelected2 = false;
        _isSelected3 = false;
        _isSelected4 = false;
        _isSelected5 = false;
        _isSelected6 = false;
        _price = 500;
      });
    }
    if (itemNumber == 2) {
      setState(() {
        _groupValue = itemNumber;
        _isSelected1 = false;
        _isSelected2 = true;
        _isSelected3 = false;
        _isSelected4 = false;
        _isSelected5 = false;
        _isSelected6 = false;
        _price = 1000;
      });
    }
    if (itemNumber == 3) {
      setState(() {
        _groupValue = itemNumber;
        _isSelected1 = false;
        _isSelected2 = false;
        _isSelected3 = true;
        _isSelected4 = false;
        _isSelected5 = false;
        _isSelected6 = false;
        _price = 2000;
      });
    }
    if (itemNumber == 4) {
      setState(() {
        _groupValue = itemNumber;
        _isSelected1 = false;
        _isSelected2 = false;
        _isSelected3 = false;
        _isSelected4 = true;
        _isSelected5 = false;
        _isSelected6 = false;
        _price = 5000;
      });
    }
    if (itemNumber == 5) {
      setState(() {
        _groupValue = itemNumber;
        _isSelected1 = false;
        _isSelected2 = false;
        _isSelected3 = false;
        _isSelected4 = false;
        _isSelected5 = true;
        _isSelected6 = false;
        _price = 10000;
      });
    }
    if (itemNumber == 6) {
      setState(() {
        _groupValue = itemNumber;
        _isSelected1 = false;
        _isSelected2 = false;
        _isSelected3 = false;
        _isSelected4 = false;
        _isSelected5 = false;
        _isSelected6 = true;
        _price = 20000;
      });
    }
  }
}
