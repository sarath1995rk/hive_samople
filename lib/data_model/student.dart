import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;

  StudentModel(this.name, this.age, [this.id]);

  @override
  String toString() {
    return 'StudentModel{id: $id, name: $name, age: $age}';
  }
}
