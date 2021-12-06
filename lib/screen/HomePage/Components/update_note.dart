import 'package:flutter/material.dart';
import 'package:note_app/Constant/textstyle.dart';
import 'package:note_app/State/home_page_provider.dart';

class UpdateNote extends StatelessWidget {
  HomePageProvider state;
  BuildContext context;
  int index;
  UpdateNote({required this.state, required this.context, required this.index});
  updateNote(HomePageProvider state, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 220,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Note Title",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    maxLines: 5,
                    controller: descController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Description",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                state.updateNote(
                    context: context,
                    index: index,
                    title: titleController.text,
                    desc: descController.text);
              },
              child: const Text(
                "Update",
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
                "Cancel",
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

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleController.text = state.data[index].title;
    descController.text = state.data[index].desc;

    return TextButton(
      child: Text(
        " Update",
        style: CustomTextStyle.kstyle1(),
      ),
      onPressed: () {
        updateNote(state, index);
      },
    );
  }
}
