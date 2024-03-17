import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/add_note_colors_list.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_feild.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        AddNoteCubit dataCubit = BlocProvider.of<AddNoteCubit>(context);
        return Form(
          key: dataCubit.formKey,
          autovalidateMode: dataCubit.autovalidateMode,
          child: Column(
            children: [
              CustomField(
                labelText: "Title",
                controller: dataCubit.titleController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                labelText: "Note",
                controller: dataCubit.noteController,
                maxLines: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              const AddNoteColorsList(),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  onPressed: () async {
                    if (dataCubit.formKey.currentState?.validate() ?? false) {
                      NoteModel noteModel = NoteModel(
                          title: dataCubit.titleController.text,
                          note: dataCubit.noteController.text,
                          date: DateTime.now(),
                          color:
                              dataCubit.color?.value ?? Colors.blueGrey.value);
                      await BlocProvider.of<AddNoteCubit>(context)
                          .addNote(note: noteModel);
                      dataCubit.titleController.clear();
                      dataCubit.noteController.clear();
                    } else {
                      dataCubit.autovalidateMode = AutovalidateMode.always;
                    }
                    setState(() {});
                  },
                  isLoading: state is AddNoteLoading ? true : false),
            ],
          ),
        );
      },
    );
  }
}
