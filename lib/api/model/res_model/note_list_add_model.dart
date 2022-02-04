// To parse this JSON data, do
//
//     final notesAddResModel = notesAddResModelFromJson(jsonString);

import 'dart:convert';

NotesAddResModel notesAddResModelFromJson(String str) =>
    NotesAddResModel.fromJson(json.decode(str));

String notesAddResModelToJson(NotesAddResModel data) =>
    json.encode(data.toJson());

class NotesAddResModel {
  NotesAddResModel({
    this.noteId,
    this.noteTitle,
    this.noteContent,
    this.createDateTime,
    this.latestEditDateTime,
  });

  String? noteId;
  String? noteTitle;
  String? noteContent;
  DateTime? createDateTime;
  DateTime? latestEditDateTime;

  factory NotesAddResModel.fromJson(Map<String, dynamic> json) =>
      NotesAddResModel(
        noteId: json["noteID"],
        noteTitle: json["noteTitle"],
        noteContent: json["noteContent"],
        createDateTime: DateTime.parse(json["createDateTime"]),
        latestEditDateTime: json["latestEditDateTime"],
      );

  Map<String, dynamic> toJson() => {
        "noteID": noteId,
        "noteTitle": noteTitle,
        "noteContent": noteContent,
        "createDateTime": createDateTime!.toIso8601String(),
        "latestEditDateTime": latestEditDateTime,
      };
}
