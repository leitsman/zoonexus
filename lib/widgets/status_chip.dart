import 'package:flutter/material.dart';
import 'package:zoonexus/theme/app_theme.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.severity,
    this.label,
    this.showIcon = true,
  });

  final AppSeverity severity;
  final String? label;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final text = label ?? severity.label;
    final color = severity.color;
    final bgColor = severity.backgroundColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(severity.icon, size: 16.0, color: color),
            const SizedBox(width: 4.0),
          ],
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
