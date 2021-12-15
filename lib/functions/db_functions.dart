import 'package:flutter/cupertino.dart';
import 'package:hive_sanple/data_model/student.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel model) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.add(model);

  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int? id) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentDb.delete(id);
  getAllStudents();
}

Future<void> editStudentInDb(StudentModel model) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentDb.put(model.id, model);
  getAllStudents();
}
