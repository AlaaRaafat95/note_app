import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Color? color;

  Future<void> addNote({required NoteModel note}) async {
    note.color = color?.value ?? Colors.blueGrey.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>("NotesBox");
      await noteBox.add(note);

      emit(AddNoteSuccuss());
    } catch (e) {
      emit(AddNoteFailure(errorMsg: e.toString()));
    }
  }
}
