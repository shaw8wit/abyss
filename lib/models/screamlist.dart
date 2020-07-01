import 'dart:collection';
import 'dart:math';

import 'package:abyss/models/screams.dart';
import 'package:flutter/foundation.dart';

class Screamlist extends ChangeNotifier {
  List<Screams> _screams = [
    Screams("hey there!"),
    Screams("UnmodifiableListView<Task> get tasks"),
    Screams("void addTask(String newTaskTitle"),
    Screams("task.toggleDone();"),
    Screams("d deleteTask(Task task) "),
    Screams("rt 'package:flutter/"),
    Screams(" Task(name: 'Buy something'),"),
    Screams("hey there!"),
    Screams("UnmodifiableListView<Task> get tasks"),
    Screams("void addTask(String newTaskTitle"),
    Screams(
        "task.toggleDone();skdfjkdsnfkldsnkfnkdsjnfkdsnkfjndskjfnkdsnfkjdsbnjfkndskjfnkjsdnfkjdsnkjfnsdknfk"),
    Screams("d deleteTask(Task task) "),
    Screams("rt 'package:flutter/"),
    Screams(" Task(name: 'Buy something'),"),
  ];

  int get total {
    return _screams.length;
  }

  UnmodifiableListView<Screams> get screams {
    return UnmodifiableListView(_screams);
  }

  void addScream(String voice) {
    _screams.add(Screams(voice));
    print(_screams[_screams.length - 1].text);
    print(_screams[_screams.length - 2].text);
    notifyListeners();
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  String getScream() {
    return getRandomElement(_screams).text;
  }
}
