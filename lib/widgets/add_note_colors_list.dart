import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';

class AddNoteColorsList extends StatefulWidget {
  const AddNoteColorsList({super.key});

  @override
  State<AddNoteColorsList> createState() => _AddNoteColorsListState();
}

class _AddNoteColorsListState extends State<AddNoteColorsList> {
  int? currentIndex = 0;
  final List<Color> noteColors = [
    Colors.blueGrey,
    Colors.grey,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.purple,
    Colors.green,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
        itemCount: noteColors.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            currentIndex = index;
            BlocProvider.of<AddNoteCubit>(context).color = noteColors[index];
            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: currentIndex == index
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: noteColors[index],
                        radius: 30,
                      ),
                      const Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  )
                : CircleAvatar(
                    backgroundColor: noteColors[index],
                    radius: 30,
                  ),
          ),
        ),
      ),
    );
  }
}
