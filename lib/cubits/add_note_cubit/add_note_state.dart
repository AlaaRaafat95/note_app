part of 'add_note_cubit.dart';

abstract class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccuss extends AddNoteState {}

final class AddNoteFailure extends AddNoteState {
  final String errorMsg;

  AddNoteFailure({required this.errorMsg});
}
