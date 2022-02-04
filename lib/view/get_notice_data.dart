// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:swagger_api_integration/api/model/res_model/note_list_res_model.dart';
import 'package:swagger_api_integration/api/repo/get_user_repo.dart';
import 'package:swagger_api_integration/view/add_data_screen.dart';

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
                      return ListTile(
                        leading: Text('${snapshot.data![index].noteTitle}'),
                        subtitle:
                            Text('${snapshot.data![index].createDateTime}'),
                        title: Text('${snapshot.data![index].noteId}'),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 340, bottom: 15),
            child: FloatingActionButton(
              elevation: 15,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddDataScreen(),
                    ));
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
