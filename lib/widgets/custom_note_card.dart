import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/all%20notes%20cubit/all_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/widgets/custom_icon_button.dart';
import 'package:note_app/widgets/custom_text.dart';

class CustomNoteCard extends StatelessWidget {
  final NoteModel noteModel;
  const CustomNoteCard({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotePage(
              myNotes: noteModel,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: CustomText(
                title: noteModel.title,
                fontSize: 25.0,
                color: Colors.black,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomText(
                  title: noteModel.note,
                  fontSize: 18.0,
                  color: Colors.brown,
                ),
              ),
              trailing: CustomIconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const CustomText(
                              title: "Delete Note",
                              fontSize: 25,
                            ),
                            content: const CustomText(
                              title: "DO You Want to Delete This Note ?",
                              fontSize: 15.0,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const CustomText(
                                  title: "cancel",
                                  fontSize: 15.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  noteModel.delete();
                                  BlocProvider.of<AllNotesCubit>(context)
                                      .getAllNotes();
                                  Navigator.pop(context);
                                },
                                child: const CustomText(
                                  title: "Confirm",
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ));
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            CustomText(
                title: DateFormat('MMMM d, y').format(
                  noteModel.date,
                ),
                fontSize: 15.0,
                color: Colors.brown),
          ],
        ),
      ),
    );
  }
}
