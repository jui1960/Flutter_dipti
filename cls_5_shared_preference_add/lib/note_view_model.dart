import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteViewModel extends ChangeNotifier{

  final List<String> _notes = [];

  List<String> get notes => List.unmodifiable(_notes);

  NoteViewModel(){
    _loadNotes();
  }
  Future<void> _loadNotes() async{
    final prefs = await SharedPreferences.getInstance();
    final saveNotes = prefs.getStringList('notes') ?? [];
    _notes.clear();
    _notes.addAll(saveNotes);
    notifyListeners();
  }
  Future<void> _saveNotes() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notes', _notes);
  }

  void addNote(String text){
    if(text.trim().isNotEmpty){
      _notes.add(text);
      _saveNotes();
      notifyListeners();
    }
  }
  void deleteNoteAt(int index){
    _notes.removeAt(index);
    _saveNotes();
    notifyListeners();
  }
  void updateNoteAt(int index,String newText){
    if(newText.trim().isNotEmpty){
      _notes[index] = newText;
      _saveNotes();
      notifyListeners();
    }
  }
}