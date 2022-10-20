import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controllers/note_controller.dart';
import 'package:recipe_app/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    NoteController noteController = NoteController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Notes"),
            Spacer(),
            InkWell(
                onTap: () {
                  Get.to(SettingsScreen());
                },
                child: Icon(Icons.settings))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Obx(
            (() => ListView.builder(
                  itemCount: noteController.notes.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(right:20.0,left:20),
                          child: Row(
                            children: [
                              Text(noteController.notes[index],
                              style:TextStyle(
                                fontSize: 15
                              )),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    noteController
                                        .removeNote(noteController.notes[index]);
                                  },
                                  child: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
          Obx((() => Visibility(
                visible: noteController.showAddNewNoteCArd.value,
                child: SizedBox(
                  height: 500,
                  width: 400,
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: noteController.titleController,
                            maxLength: 30,
                            decoration: InputDecoration(
                              hintText: "Enter title",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 50)),
                        SizedBox(
                          height: 50,
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                noteController.addNewNote(
                                    noteController.titleController.text);
                                noteController.titleController.clear();
                                noteController.toggleshowAddNewNoteCArd(
                                    !noteController.showAddNewNoteCArd.value);
                              },
                              child: Text("Add new note")),
                        )
                      ],
                    ),
                  ),
                ),
              )))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteController.toggleshowAddNewNoteCArd(
              !noteController.showAddNewNoteCArd.value);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
