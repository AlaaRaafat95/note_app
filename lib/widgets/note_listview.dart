import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/all%20notes%20cubit/all_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class NoteListView extends StatefulWidget {
  const NoteListView({super.key});

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesCubit, AllNotesState>(
      builder: (context, state) {
        final List<NoteModel> allNotes =
            BlocProvider.of<AllNotesCubit>(context).allNotes;
        return allNotes.isEmpty
            ? Expanded(child: Image.asset("assets/images/Add notes.png"))
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomNoteCard(
                      noteModel: allNotes[index],
                    ),
                  ),
                  itemCount: allNotes.length,
                ),
              );
      },
    );
  }
}
