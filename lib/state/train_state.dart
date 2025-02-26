import 'package:flutter/cupertino.dart';

import '../storages/models/train.dart';

class TrainState extends ChangeNotifier {
  List<Train> _trains = [];

  List<Train> get getTrains => _trains;

  Future<void> setTrains(List<Train> trains) async {
    _trains = trains;
  }
}