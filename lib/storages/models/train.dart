import 'package:isar/isar.dart';

part 'train.g.dart';

@collection
class Train {
  Id id = Isar.autoIncrement;

  int? type;
  DateTime? dateTime;
  bool? isFirstDate;
}