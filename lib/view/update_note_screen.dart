import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger_api_integration/api/repo/add_new_user_repo.dart';
import 'package:swagger_api_integration/api/repo/update_old_user_repo.dart';
import 'package:swagger_api_integration/view/get_notice_data.dart';

class UpdateNoteScreen extends StatelessWidget {
  final String noteId;

  final _title = TextEditingController();
  final _content = TextEditingController();

  UpdateNoteScreen({Key? key, required this.noteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _title,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Required!!';
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Enter title ',
                    hintStyle: const TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _content,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Required!!';
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Enter content ',
                    hintStyle: const TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    UpdateNoteRepo.updateNoteRepo(
                        noteId: noteId,
                        noteTitle: _title.text,
                        content: _content.text);
                    _content.clear();
                    _title.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetNoticeData(),
                        ));
                  },
                  child: Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}
