import 'package:flutter/material.dart';

enum AppSeverity {
  normal,
  attention,
  critical;

  Color get color {
    switch (this) {
      case AppSeverity.normal:
        return const Color(0xFF2E7D5B);
      case AppSeverity.attention:
        return const Color(0xFFC98A1F);
      case AppSeverity.critical:
        return const Color(0xFFA33B3B);
    }
  }

  Color get backgroundColor {
    switch (this) {
      case AppSeverity.normal:
        return const Color(0xFFE8F5E9);
      case AppSeverity.attention:
        return const Color(0xFFFFF8E1);
      case AppSeverity.critical:
        return const Color(0xFFFFEBEE);
    }
  }

  IconData get icon {
    switch (this) {
      case AppSeverity.normal:
        return Icons.check_circle_outline;
      case AppSeverity.attention:
        return Icons.warning_amber_rounded;
      case AppSeverity.critical:
        return Icons.error_outline;
    }
  }

  String get label {
    switch (this) {
      case AppSeverity.normal:
        return 'Normal';
      case AppSeverity.attention:
        return 'Atención';
      case AppSeverity.critical:
        return 'Alerta';
    }
  }
}
