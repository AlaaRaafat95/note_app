import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/models/note_model.dart';

part 'all_notes_state.dart';

class AllNotesCubit extends Cubit<AllNotesState> {
  AllNotesCubit() : super(AllNotesInitial());
  List<NoteModel> allNotes = [];
  void getAllNotes() {
    var noteBox = Hive.box<NoteModel>("NotesBox");
    allNotes = noteBox.values.toList();
    emit(AllNotesSuccess());
  }
}
