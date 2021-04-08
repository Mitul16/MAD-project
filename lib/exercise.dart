import 'package:flutter/material.dart';
import 'dart:io';
import 'globals.dart';
import 'dart:convert';

class Exercise {
  String value, filename;
  bool checked;

  Exercise(String value, bool checked, {String filename}) {
    this.value = value;
    this.checked = checked;
    this.filename = filename;
  }
  
  void setValue(String value) {
    this.value = value;
  }
  
  void setFilename(String filename) {
    this.filename = filename;
  }
  
  void setChecked(bool checked) {
    this.checked = checked;
  }
  
  Exercise.fromJson(Map<String, dynamic> json) : value = json['value'], checked = json['checked'] == 'true';

  Map<String, dynamic> toJson() => {
    'value': value,
    'checked': checked.toString()
  };

  Exercise.fromFile(File file) {
    Map<String, dynamic> json = jsonDecode(file.readAsStringSync());

    this.value = json['value'];
    this.checked = json['checked'] == 'true';
    this.filename = file.path;
  }

  void toFile(File file) {
    file.writeAsStringSync(jsonEncode(this));
  }

  Exercise.readFromFile() {
    if (filename != null) {
      File file = File(filename);
      if (file.existsSync()) {
        Map<String, dynamic> json = jsonDecode(file.readAsStringSync());

        this.value = json['value'];
        this.checked = json['checked'] == 'true';
      }
    }
  }

  void saveToFile() {
    File file = File(filename);

    if (!file.existsSync()) {
      file.createSync();
    }
    
    file.writeAsStringSync(jsonEncode(this));
  }
}

class ExerciseModel extends ChangeNotifier {
  List<Exercise> exercises;
  Directory exercisesDir;

  ExerciseModel() {
    exercises = <Exercise>[];
    exercisesDir = Directory('$appDirPath/exercises');

    if (!exercisesDir.existsSync()) {
      exercisesDir.createSync();
    }
  }

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
    
    String filename = '${exercisesDir.path}/exercise_${DateTime.now()}.json';
    exercise.setFilename(filename);
    exercise.saveToFile();
    
    notifyListeners();
  }
  
  void editExercise(int index, String newValue) {
    exercises[index].setValue(newValue);
    exercises[index].saveToFile();
    
    notifyListeners();
  }

  void removeExercise(int index) {
    File(exercises[index].filename).deleteSync();
    exercises.removeAt(index);

    notifyListeners();
  }

  void toggleExerciseCheckedMark(int index) {
    exercises[index].setChecked(!exercises[index].checked);
    exercises[index].saveToFile();

    notifyListeners();
  }

  bool isEmpty() {
    return exercises.isEmpty;
  }

  int getExerciseCount() {
    return exercises.length;
  }

  Exercise getExercise(int index) {
    return exercises[index];
  }

  void readData() {
    exercises = <Exercise>[];

    exercisesDir.listSync().forEach((filename) {
      exercises.add(Exercise.fromFile(File(filename.path)));
    });

    notifyListeners();
  }
}
