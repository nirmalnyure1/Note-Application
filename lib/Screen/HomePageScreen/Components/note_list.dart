import 'package:flutter/material.dart';
import 'package:note_app/Model/note_model.dart';
import 'package:note_app/Screen/HomePageScreen/Components/share_note.dart';
import 'package:note_app/Screen/HomePageScreen/Components/update_note.dart';
import 'package:note_app/State/homepage_state.dart';

import 'delete_note.dart';


class NoteList extends StatelessWidget {
  final NoteModel data;
  final HomePageState state;
  // final Function update;
  // final Function delete;
  final int index;

  NoteList({required this.data, required this.state, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const Divider(),
                Text(
                  data.desc,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      fontSize: 12),
                  maxLines: 10,
                ),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ShareNote(
                      state: state,
                      context: context,
                      index: index,
                    ),
                    UpdateNote(
                      state: state,
                      context: context,
                      index: index,
                    ),
                  ],
                ),
                DeleteNote(context: context, state: state, index: index)
              ],
            )
          ],
        ),
      ),
    );
  }
}
