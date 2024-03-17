import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/all%20notes%20cubit/all_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_text.dart';
import 'package:note_app/widgets/custom_text_feild.dart';
import 'package:note_app/widgets/edit_note_color_list.dart';

class EditNotePage extends StatefulWidget {
  final NoteModel myNotes;

  const EditNotePage({super.key, required this.myNotes});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  SnackBar snackBar = SnackBar(
                    content: const CustomText(
                      title: "Your Note Edited Successfuly",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    backgroundColor: Colors.blueGrey,
                    showCloseIcon: true,
                    elevation: 2.0,
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.endToStart,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                  );
                  widget.myNotes.save();

                  BlocProvider.of<AllNotesCubit>(context).getAllNotes();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                title: "Edit Note",
                icon: Icons.check,
              ),
              const SizedBox(height: 10.0),
              CustomField(
                initialValue: widget.myNotes.title,
                labelText: "Title",
                onChanged: (value) {
                  widget.myNotes.title = value;
                },
              ),
              const SizedBox(height: 20.0),
              CustomField(
                initialValue: widget.myNotes.note,
                labelText: "Note",
                maxLines: 5,
                onChanged: (value) {
                  widget.myNotes.note = value;
                },
              ),
              const SizedBox(height: 30.0),
              EditNoteColorsList(
                noteModel: widget.myNotes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
