import 'package:bmi_tracker_mb_advisor/util/size_utils.dart';
import 'package:flutter/material.dart';

class CommissionDetailsItem extends StatelessWidget {
  final String? label;
  final String? value;

  const CommissionDetailsItem({super.key, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100.h,
            child: Text(
              label!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Text(
              value ?? '',
              style: TextStyle(fontSize: 15.fSize),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          )
        ],
      ),
    );
  }
}
