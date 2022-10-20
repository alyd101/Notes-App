import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NoteController extends GetxController {
  var notes = <String>[].obs;
  TextEditingController titleController = TextEditingController();
  var widgets = <Widget>[].obs;
  var showAddNewNoteCArd = false.obs;

  void addNewNote(String note) {
    notes.add(note);
  }

  void removeNote(String note) {
    notes.remove(note);
  }

  void toggleshowAddNewNoteCArd(bool val) {
    showAddNewNoteCArd(val);
  }

}
