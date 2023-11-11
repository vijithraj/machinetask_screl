import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetask_screl/provider_class.dart';
import 'package:provider/provider.dart';

import 'model_class.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note note;
  final int index;

  const NoteDetailScreen({required this.note, required this.index});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveNote(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNote(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);

    if (widget.index == -1) {
      // Add new note
      noteProvider.addNote(
        Note(
          title: _titleController.text,
          content: _contentController.text,
          timestamp: DateTime.now(),
        ),
      );
    } else {
      // Edit existing note
      noteProvider.editNote(
        widget.index,
        Note(
          title: _titleController.text,
          content: _contentController.text,
          timestamp: widget.note.timestamp,
        ),
      );
    }

    Navigator.pop(context);
  }
}
