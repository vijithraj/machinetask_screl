import 'package:freezed_annotation/freezed_annotation.dart';


@freezed
class Note with _$Note {
  const factory Note({
    required String title,
    required String content,
    required DateTime timestamp,
  }) = _Note;

  factory Note.empty() => Note(
    title: '',
    content: '',
    timestamp: DateTime.now(),
  );

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}