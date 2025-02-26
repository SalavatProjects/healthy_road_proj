import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthy_road_proj/pages/onboarding_screen.dart';
import 'package:healthy_road_proj/state/train_state.dart';
import 'package:healthy_road_proj/storages/isar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_road_proj/storages/models/train.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppIsarDatabase.init();
  runApp(
      ChangeNotifierProvider(
      create: (BuildContext context) => TrainState(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<DateTime> _generateUniqueRandomDates(int weeks, int countPerWeek) {
    DateTime today = DateTime.now();
    Random random = Random();
    Set<DateTime> uniqueDates = {};

    while (uniqueDates.length < weeks * countPerWeek) {
      int week = random.nextInt(weeks);
      int randomDay = random.nextInt(7);
      DateTime randomDate = today.add(Duration(days: week * 7 + randomDay));

      uniqueDates.add(DateTime(randomDate.year, randomDate.month, randomDate.day));
    }

    return uniqueDates.toList();
  }

  DateTime _changeTime(DateTime dateTime, int hour, int minute, int second) {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      hour,
      minute,
      second,
    );
  }

  @override
  Widget build(BuildContext context) {
    final trainState = Provider.of<TrainState>(context);
    trainState.setTrains(AppIsarDatabase.getTrains());

    if (trainState.getTrains.isEmpty) {
      List<DateTime> randomDates = _generateUniqueRandomDates(12, 4);
      randomDates.sort((a, b) => a.compareTo(b));

      for (int i = 0; i < randomDates.length; i++) {
        int type = Random().nextInt(3) + 1;
        if (i == 0) {
          AppIsarDatabase.addTrain(
              Train()
                  ..type = type
                  ..dateTime = randomDates[i]
                  ..isFirstDate = true
          );
        } else {
          AppIsarDatabase.addTrain(
            Train()
                ..type = type
                ..dateTime = randomDates[i]
                ..isFirstDate = false
          );
        }
        /*double? distance;
        switch (type) {
          case (1):
            distance = Random().nextDouble() * (20 - 2) + 2;
          case (2):
            distance = Random().nextDouble() * (50 - 10) + 10;
          case (3):
            distance = null;
          default:
            distance = null;
        }
        int hour = Random().nextInt(2);
        int second = Random().nextInt(60);
        int minute = 0;
        switch (hour) {
          case (0):
            minute = Random().nextInt(60) + 30;
          case (1):
            minute = Random().nextInt(40);
          default:
            minute = 0;
        }
        double sleep = 0.3 + Random().nextDouble() * (0.37 - 0.3);
        double power = 0.2 + Random().nextDouble() * (sleep - 0.2);
        if (i == 0) {
          AppIsarDatabase.addTrain(Train()
            ..type = type
            ..dateTime = randomDates[i]
            ..isFirstDate = true
            ..distance = distance
          );
        }*/
      }
      trainState.setTrains(AppIsarDatabase.getTrains());
    }

    if (DateTime.now().isAfter(trainState.getTrains.lastWhere((e) => e.isFirstDate!).dateTime!.add(Duration(days: 7 * 12)))){
      List<DateTime> randomDates = _generateUniqueRandomDates(12, 4);
      randomDates.sort((a, b) => a.compareTo(b));

      for (int i = 0; i < randomDates.length; i++) {
        int type = Random().nextInt(3) + 1;
        if (i == 0) {
          AppIsarDatabase.addTrain(
              Train()
                ..type = type
                ..dateTime = randomDates[i]
                ..isFirstDate = true
          );
        } else {
          AppIsarDatabase.addTrain(
              Train()
                ..type = type
                ..dateTime = randomDates[i]
                ..isFirstDate = false
          );
        }

      }
    }
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}

