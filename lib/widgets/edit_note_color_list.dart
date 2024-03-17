import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

class EditNoteColorsList extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteColorsList({super.key, required this.noteModel});

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int? currentIndex = 0;
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
  void initState() {
    currentIndex = noteColors
        .indexWhere((element) => element.value == widget.noteModel.color);
    super.initState();
  }

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
            widget.noteModel.color = noteColors[index].value;

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
