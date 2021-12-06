import 'package:flutter/material.dart';
import 'package:note_app/State/home_page_provider.dart';
import 'package:note_app/screen/HomePage/Components/add_note.dart';
import 'package:note_app/screen/HomePage/Components/note_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController titleController = TextEditingController();
  // TextEditingController descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomePageProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (BuildContext context, state, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1,
            leading: const Icon(
              Icons.home,
              color: Colors.deepPurple,
              size: 25,
            ),
            title: const Text(
              "MY EASY NOTE ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            actions: [
              AddNote(state: state, context: context),
            ],
          ),
          body: state.fetching
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (BuildContext context, int index) => NoteList(
                      index: index,
                      data: state.data[index],
                      state: state,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
