// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:swagger_api_integration/api/model/res_model/note_list_res_model.dart';
import 'package:swagger_api_integration/api/repo/delete_notelist_user.dart';
import 'package:swagger_api_integration/api/repo/get_user_repo.dart';
import 'package:swagger_api_integration/view/add_data_screen.dart';
import 'package:swagger_api_integration/view/update_note_screen.dart';

class GetNoticeData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get User Data'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<NotesListResModel>>(
              future: GetUserRepo.getUserRepo(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<NotesListResModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String? _id = '${snapshot.data![index].noteId}';
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Icon(Icons.delete),
                        key: ValueKey(_id),
                        onDismissed: (value) async {
                          DeleteNoteRepo.deleteNoteRepo(
                            noteId: _id,
                            //  noteTitle: '${snapshot.data![index].noteTitle}',
                          );
                        },
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateNoteScreen(
                                    noteId: '${snapshot.data![index].noteId}',
                                    noteTitle:
                                        '${snapshot.data![index].noteTitle}',
                                  ),
                                ));
                          },
                          title: Text('${snapshot.data![index].noteTitle}'),
                          subtitle:
                              Text('${snapshot.data![index].createDateTime}'),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddDataScreen(),
                          ));
                    },
                    icon: Icon(Icons.add)),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.update),
                label: 'Update',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delete),
                label: 'Delete',
              ),
            ],
            selectedItemColor: Colors.amber[800],
          ),
        ],
      ),
    );
  }
}
