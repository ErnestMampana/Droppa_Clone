import 'package:flutter/material.dart';

class WalletAmountSelect extends StatelessWidget {
  final int? groupValue;
  final bool? isSelected;
  final Function(int?)? onChanged;
  final VoidCallback onTap;
  final int value;
  final String? price;
  const WalletAmountSelect({
    super.key,
    required this.groupValue,
    required this.isSelected,
    required this.onChanged,
    required this.value,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          height: 50,
          width: 300,
          decoration: groupValue! == 0 || isSelected!
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
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                  ],
                )
              : BoxDecoration(
                  color: Colors.grey[200],
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  price!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
