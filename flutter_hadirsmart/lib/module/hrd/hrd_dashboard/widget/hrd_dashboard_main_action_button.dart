import 'package:flutter/material.dart';

class HrdDashboardMainActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;
  final String status;
  const HrdDashboardMainActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            14.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 11),
          ),
        ],
        border: Border.all(
          width: 1.0,
          color: Colors.grey[300]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 24.0,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            time,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            status,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
