import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetask_screl/provider_class.dart';
import 'package:machinetask_screl/second_page.dart';
import 'package:provider/provider.dart';

import 'model_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, _) {
          return ListView.builder(
            itemCount: noteProvider.notes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(noteProvider.notes[index].title),
                subtitle: Text(noteProvider.notes[index].content),
                onTap: () {
                  _navigateToNoteDetail(context, noteProvider.notes[index], index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToNoteDetail(context, Note.empty(), -1);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToNoteDetail(BuildContext context, Note note, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailScreen(note: note, index: index),
      ),
    );
  }
}
