import 'package:flutter/material.dart';
import 'package:zoonexus/theme/app_theme.dart';

final class CollarTelemetry {
  const CollarTelemetry({
    required this.animalName,
    required this.currentTemperature,
    required this.minNormalTemperature,
    required this.maxNormalTemperature,
    required this.activityStatus,
    required this.batteryLevel,
    required this.status,
  });

  final String animalName;
  final double currentTemperature;
  final double minNormalTemperature;
  final double maxNormalTemperature;
  final String activityStatus;
  final int batteryLevel;
  final AppSeverity status;
}

final class AlertItem {
  const AlertItem({
    required this.title,
    this.subtitle,
    required this.relativeTime,
    required this.severity,
    required this.icon,
  });

  final String title;
  final String? subtitle;
  final String relativeTime;
  final AppSeverity severity;
  final IconData icon;
}

final class BiosecurityTip {
  const BiosecurityTip({
    required this.id,
    required this.text,
    required this.icon,
  });

  final int id;
  final String text;
  final IconData icon;
}

final class TemperaturePoint {
  const TemperaturePoint({required this.label, required this.temperature});

  final String label;
  final double temperature;
}

final class AnimalProfile {
  const AnimalProfile({
    required this.species,
    required this.age,
    required this.lastCheckupDate,
    required this.minNormalTemperature,
    required this.maxNormalTemperature,
    required this.currentTemperature,
    required this.temperatureHistory,
  });

  final String species;
  final String age;
  final String lastCheckupDate;
  final double minNormalTemperature;
  final double maxNormalTemperature;
  final double currentTemperature;
  final List<TemperaturePoint> temperatureHistory;
}

final class TimelinePhase {
  const TimelinePhase({
    required this.step,
    required this.title,
    required this.description,
  });

  final int step;
  final String title;
  final String description;
}

final class ProjectInfo {
  const ProjectInfo({
    required this.overview,
    required this.teamMembers,
    required this.tutor,
    required this.timelinePhases,
  });

  final String overview;
  final List<String> teamMembers;
  final String tutor;
  final List<TimelinePhase> timelinePhases;
}

abstract final class MockData {
  static const CollarTelemetry activeCollar = CollarTelemetry(
    animalName: 'Vaca #04 — Collar ZX-104',
    currentTemperature: 38.5,
    minNormalTemperature: 37.5,
    maxNormalTemperature: 39.5,
    activityStatus: 'Actividad normal',
    batteryLevel: 82,
    status: AppSeverity.normal,
  );

  static const List<AlertItem> alerts = [
    AlertItem(
      title: 'Temperatura elevada — Vaca #04',
      relativeTime: 'hace 2 h',
      severity: AppSeverity.attention,
      icon: Icons.thermostat,
    ),
    AlertItem(
      title: 'Actividad inusual — Vaca #11',
      relativeTime: 'hace 5 h',
      severity: AppSeverity.attention,
      icon: Icons.directions_run,
    ),
    AlertItem(
      title: 'Fiebre confirmada — Vaca #02',
      relativeTime: 'ayer',
      severity: AppSeverity.critical,
      icon: Icons.local_hospital,
    ),
    AlertItem(
      title: 'Monitoreo normal restablecido — Vaca #02',
      relativeTime: 'ayer',
      severity: AppSeverity.normal,
      icon: Icons.check_circle,
    ),
  ];

  static const List<BiosecurityTip> biosecurityTips = [
    BiosecurityTip(
      id: 1,
      text: 'Aísle al animal sospechoso del resto del hato',
      icon: Icons.fence,
    ),
    BiosecurityTip(
      id: 2,
      text: 'Lávese las manos antes y después de manipular al animal',
      icon: Icons.clean_hands,
    ),
    BiosecurityTip(
      id: 3,
      text: 'Use mascarilla y guantes si hay signos de enfermedad',
      icon: Icons.masks,
    ),
    BiosecurityTip(
      id: 4,
      text: 'Notifique al veterinario responsable',
      icon: Icons.phone_in_talk,
    ),
    BiosecurityTip(
      id: 5,
      text: 'Desinfecte el área de contacto',
      icon: Icons.sanitizer,
    ),
  ];

  static const AnimalProfile animalProfile = AnimalProfile(
    species: 'Bovino',
    age: '3 años',
    lastCheckupDate: '15 de Mayo de 2024',
    minNormalTemperature: 37.5,
    maxNormalTemperature: 39.5,
    currentTemperature: 38.5,
    temperatureHistory: [
      TemperaturePoint(label: 'Lun', temperature: 38.2),
      TemperaturePoint(label: 'Mar', temperature: 38.4),
      TemperaturePoint(label: 'Mié', temperature: 38.6),
      TemperaturePoint(label: 'Jue', temperature: 39.1),
      TemperaturePoint(label: 'Vie', temperature: 38.8),
      TemperaturePoint(label: 'Sáb', temperature: 38.5),
      TemperaturePoint(label: 'Dom', temperature: 38.5),
    ],
  );

  static const ProjectInfo projectInfo = ProjectInfo(
    overview:
        'Zoonexus: Conectando Animales, Protegiendo Vidas es un sistema conceptual '
        'de monitoreo ganadero orientado a la detección temprana de anomalías '
        'térmicas y la prevención de brotes zoosanitarios.',
    // TODO: nombres reales - Completar con los nombres de los integrantes del equipo
    teamMembers: [
      'Integrante 1 (TODO: nombre real)',
      'Integrante 2 (TODO: nombre real)',
      'Integrante 3 (TODO: nombre real)',
    ],
    // TODO: nombres reales - Completar con el nombre del tutor/director
    tutor: 'Tutor del Proyecto (TODO: nombre real)',
    timelinePhases: [
      TimelinePhase(
        step: 1,
        title: 'Fase 1: Concepción',
        description: 'Definición de requerimientos y arquitectura del sistema.',
      ),
      TimelinePhase(
        step: 2,
        title: 'Fase 2: Prototipado',
        description:
            'Construcción del modelo de monitoreo y diseño de interfaz.',
      ),
      TimelinePhase(
        step: 3,
        title: 'Fase 3: Validación',
        description: 'Pruebas de usabilidad y ajuste de umbrales biométricos.',
      ),
      TimelinePhase(
        step: 4,
        title: 'Fase 4: Despliegue',
        description:
            'Compilación de la versión demostrativa final en formato .apk.',
      ),
    ],
  );
}
