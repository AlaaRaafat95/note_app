import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/all%20notes%20cubit/all_notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';
import 'package:note_app/widgets/custom_text.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          debugPrint("OOOPS Error happends : ${state.errorMsg}");
        }
        if (state is AddNoteSuccuss) {
          SnackBar snackBar = SnackBar(
            content: const CustomText(
              title: "Your Note Added Successfuly",
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
          BlocProvider.of<AllNotesCubit>(context).getAllNotes();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
              top: 30,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: const AddNoteForm(),
          ),
        );
      },
    );
  }
}
