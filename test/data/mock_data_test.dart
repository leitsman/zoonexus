import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoonexus/data/mock_data.dart';
import 'package:zoonexus/theme/app_severity.dart';

void main() {
  group('MockData', () {
    test('activeCollar matches dashboard specification', () {
      final collar = MockData.activeCollar;
      expect(collar.animalName, 'Vaca #04 — Collar ZX-104');
      expect(collar.currentTemperature, 38.5);
      expect(collar.minNormalTemperature, 37.5);
      expect(collar.maxNormalTemperature, 39.5);
      expect(collar.activityStatus, 'Actividad normal');
      expect(collar.batteryLevel, 82);
      expect(collar.status, AppSeverity.normal);
    });

    test('alerts contains exactly 4 records in chronological order with correct severities', () {
      final alerts = MockData.alerts;
      expect(alerts.length, 4);

      expect(alerts[0].title, contains('Temperatura elevada'));
      expect(alerts[0].relativeTime, 'hace 2 h');
      expect(alerts[0].severity, AppSeverity.attention);
      expect(alerts[0].icon, Icons.thermostat);

      expect(alerts[1].title, contains('Actividad inusual'));
      expect(alerts[1].relativeTime, 'hace 5 h');
      expect(alerts[1].severity, AppSeverity.attention);
      expect(alerts[1].icon, Icons.directions_run);

      expect(alerts[2].title, contains('Fiebre confirmada'));
      expect(alerts[2].relativeTime, 'ayer');
      expect(alerts[2].severity, AppSeverity.critical);
      expect(alerts[2].icon, Icons.local_hospital);

      expect(alerts[3].title, contains('Monitoreo normal restablecido'));
      expect(alerts[3].relativeTime, 'ayer');
      expect(alerts[3].severity, AppSeverity.normal);
      expect(alerts[3].icon, Icons.check_circle);
    });

    test('biosecurityTips contains 5 Spanish recommendations', () {
      final tips = MockData.biosecurityTips;
      expect(tips.length, 5);

      final texts = tips.map((t) => t.text).toList();
      expect(texts, contains('Aísle al animal sospechoso del resto del hato'));
      expect(
        texts,
        contains('Lávese las manos antes y después de manipular al animal'),
      );
      expect(
        texts,
        contains('Use mascarilla y guantes si hay signos de enfermedad'),
      );
      expect(texts, contains('Notifique al veterinario responsable'));
      expect(texts, contains('Desinfecte el área de contacto'));
    });

    test('animalProfile contains bovine details and 7 historical temperature points between 37.0 and 40.0 C', () {
      final profile = MockData.animalProfile;
      expect(profile.species, 'Bovino');
      expect(profile.age, '3 años');
      expect(profile.lastCheckupDate, '15 de Mayo de 2024');
      expect(profile.minNormalTemperature, 37.5);
      expect(profile.maxNormalTemperature, 39.5);
      expect(profile.currentTemperature, 38.5);

      expect(profile.temperatureHistory.length, 7);
      for (final point in profile.temperatureHistory) {
        expect(point.temperature, greaterThanOrEqualTo(37.0));
        expect(point.temperature, lessThanOrEqualTo(40.0));
        expect(point.label, isNotEmpty);
      }
    });

    test(
      'projectInfo contains 4 timeline phases and TODO placeholder markers',
      () {
        final project = MockData.projectInfo;
        expect(project.overview, isNotEmpty);
        expect(project.teamMembers.length, 3);
        for (final member in project.teamMembers) {
          expect(member, contains('TODO:'));
        }
        expect(project.tutor, contains('TODO:'));

        expect(project.timelinePhases.length, 4);
        expect(project.timelinePhases[0].title, contains('Fase 1'));
        expect(project.timelinePhases[1].title, contains('Fase 2'));
        expect(project.timelinePhases[2].title, contains('Fase 3'));
        expect(project.timelinePhases[3].title, contains('Fase 4'));
      },
    );

    test('all user-facing mock copy is in Spanish with zero lorem ipsum or English copy', () {
      final bannedEnglishWords = [
        'lorem',
        'ipsum',
        'temperature',
        'activity',
        'battery',
        'warning',
        'alert',
        'normal status',
      ];

      final allStrings = <String>[
        MockData.activeCollar.animalName,
        MockData.activeCollar.activityStatus,
        ...MockData.alerts.map((a) => a.title),
        ...MockData.alerts.map((a) => a.relativeTime),
        ...MockData.biosecurityTips.map((b) => b.text),
        MockData.animalProfile.species,
        MockData.animalProfile.age,
        MockData.animalProfile.lastCheckupDate,
        ...MockData.animalProfile.temperatureHistory.map((p) => p.label),
        MockData.projectInfo.overview,
        ...MockData.projectInfo.timelinePhases.map((p) => p.title),
        ...MockData.projectInfo.timelinePhases.map((p) => p.description),
      ];

      for (final str in allStrings) {
        final lower = str.toLowerCase();
        for (final banned in bannedEnglishWords) {
          expect(
            lower.contains(banned),
            isFalse,
            reason: 'Found banned word "$banned" in string "$str"',
          );
        }
      }
    });
  });
}
