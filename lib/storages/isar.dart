import 'package:isar/isar.dart';

import 'models/train.dart';
import 'package:path_provider/path_provider.dart';

abstract class AppIsarDatabase {
  static late final Isar _instance;

  static Future<Isar> init() async {
  final dir = await getApplicationDocumentsDirectory();
  return _instance = await Isar.open(
      [TrainSchema],
      directory: dir.path);
  }

  static List<Train> getTrains() {
    return _instance.writeTxnSync(
        () => _instance.trains.where().findAllSync(),
    );
  }

  static void addTrain(Train train) {
    _instance.writeTxnSync(() => _instance.trains.putSync(train));
  }
}