import 'package:get/get.dart';

class NoteController extends GetxController {
  var notes = <Map<String, String>>[].obs;

  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  void deleteNoteAt(int index) {
    notes.removeAt(index);
  }
}
