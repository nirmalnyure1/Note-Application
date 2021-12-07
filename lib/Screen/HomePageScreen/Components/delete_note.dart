import 'package:flutter/material.dart';
import 'package:note_app/Constant/textstyle.dart';
import 'package:note_app/State/homepage_state.dart';


class DeleteNote extends StatelessWidget {
  HomePageState state;
  int index;
  BuildContext context;
  DeleteNote({required this.context, required this.state, required this.index});
  delete(HomePageState state, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 50,
            child: Column(
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text("Are you sure your want to delete ?")),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                state.deleteNote(index: index, context: context);
              },
              child: const Text(
                "yes",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.green),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "no",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        delete(state, index);
      },
      child: Text(
        "Remove",
        style: CustomTextStyle.kstyle1(),
      ),
    );
  }
}
