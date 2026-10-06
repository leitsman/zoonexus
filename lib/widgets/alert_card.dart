import 'package:flutter/material.dart';
import 'package:zoonexus/data/mock_data.dart';
import 'package:zoonexus/widgets/app_card.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key, required this.alert, this.onTap});

  final AlertItem alert;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = alert.severity.color;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(width: 12.0),
          Icon(alert.icon, color: color, size: 24.0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                if (alert.subtitle != null) ...[
                  const SizedBox(height: 2.0),
                  Text(
                    alert.subtitle!,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            alert.relativeTime,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
