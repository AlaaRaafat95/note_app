import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/all%20notes%20cubit/all_notes_cubit.dart';
import 'package:note_app/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_bottom_sheet.dart';
import 'package:note_app/widgets/note_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<AllNotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            OverlayWidget.showBottomSheet(
              context: context,
              widget: const AddNoteBottomSheet(),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {},
                title: "Note",
                icon: Icons.bedtime_outlined,
              ),
              const SizedBox(height: 10.0),
              const NoteListView(),
            ],
          ),
        ),
      ),
    );
  }
}
