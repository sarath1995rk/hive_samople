import 'package:flutter/cupertino.dart';
import 'package:hive_sanple/data_model/student.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel model) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.add(model);
  print(studentDb.values);

  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  print(studentDb.values);
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int? id) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  // print(studentDb.keys);
  studentDb.delete(id);
  getAllStudents();
}

Future<void> editStudentInDb(StudentModel model, int key) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');

  studentDb.put(key, model);
  getAllStudents();
}
