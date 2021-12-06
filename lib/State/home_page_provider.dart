import 'package:flutter/material.dart';
import 'package:note_app/Database/note_db_helper.dart';
import 'package:note_app/Model/note_model.dart';

class HomePageProvider extends ChangeNotifier {
  bool fetching = true;
  List<NoteModel> data = [];
  int currentIndex = 0;

  HomepageProvider() {}
  init() async {
    await DatabaseHelper.instance.db;
    getData();
  }

  getData() async {
    data = await DatabaseHelper.instance.getData();
    fetching = false;
    notifyListeners();
  }

  addNote({context, required String title, required String desc}) {
    try {
      NoteModel newNote = NoteModel(title: title, desc: desc);
      DatabaseHelper.instance.insertData(newNote);
      getData();
      Navigator.pop(context);
      notifyListeners();
    } catch (e) {
      print("$e   error here");
    }
  }

  updateNote(
      {required int index,
      context,
      required String title,
      required String desc}) {
    currentIndex = index;
    NoteModel updateNote = data[currentIndex];
    updateNote.title = title;
    updateNote.desc = desc;
    DatabaseHelper.instance.update(updateNote, updateNote.id!);

    Navigator.pop(context);
    getData();
    notifyListeners();
  }

  deleteNote({context, required int index}) {
    DatabaseHelper.instance.delete(data[index].id!);
    getData();
    Navigator.pop(context);

    notifyListeners();
  }
}
