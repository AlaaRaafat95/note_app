import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/bloc%20observer/bloc_observer.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/all%20notes%20cubit/all_notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/home_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(
    NoteModelAdapter(),
  );
  await Hive.openBox<NoteModel>("NotesBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          primary: Colors.blueGrey,
          brightness: Brightness.dark),
      useMaterial3: true,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => AllNotesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
