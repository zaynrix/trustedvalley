import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final bool? isTrusted;
  const ChipWidget({Key? key, this.isTrusted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: isTrusted == true
            ? Colors.green.shade50
            : Colors.red.shade50, // Background color of the container
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Adjust radius as needed
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: Text(
          isTrusted == true ? "موثوق" : "نصاب",
          style:
              TextStyle(color: isTrusted == true ? Colors.green : Colors.red),
        ).tr(),
      ),
    );
  }
}
