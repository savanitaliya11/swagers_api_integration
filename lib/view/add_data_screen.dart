import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swagger_api_integration/api/repo/get_user_repo.dart';
import 'package:swagger_api_integration/view/get_notice_data.dart';

class AddDataScreen extends StatelessWidget {
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Data'),
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
                    log("title:${_title.text}");
                    log("title:${_content.text}");

                    GetUserRepo.addNoticeUSer(
                        content: _content.text, noteTitle: _title.text);
                    _content.clear();
                    _title.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetNoticeData(),
                        ));
                  },
                  child: Text('Add New User'))
            ],
          ),
        ),
      ),
    );
  }
}
