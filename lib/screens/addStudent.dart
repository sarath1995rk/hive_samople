import 'package:flutter/material.dart';
import 'package:hive_sanple/data_model/student.dart';
import 'package:hive_sanple/functions/db_functions.dart';

class AddStudentScreen extends StatelessWidget {
  final _ageController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(helperText: 'name'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _ageController,
            decoration: InputDecoration(helperText: 'age'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(onPressed: addStudentClicked, child: Text('Submit'))
        ],
      ),
    );
  }

  Future<void> addStudentClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final id = studentListNotifier.value.length;
    if (name.isEmpty || age.isEmpty) {
      return;
    }

    var _student = StudentModel(name, age, id);
    addStudent(_student);
  }
}
