import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;

  StudentModel(this.name, this.age);

  @override
  String toString() {
    return 'StudentModel{name: $name, age: $age}';
  }
}
