import 'dart:convert';

List<NotesListResModel> notesListResModelFromJson(String str) =>
    List<NotesListResModel>.from(
        json.decode(str).map((x) => NotesListResModel.fromJson(x)));

String notesListResModelToJson(List<NotesListResModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotesListResModel {
  NotesListResModel({
    this.noteId,
    this.noteTitle,
    this.createDateTime,
    this.latestEditDateTime,
  });

  String? noteId;
  String? noteTitle;
  DateTime? createDateTime;
  DateTime? latestEditDateTime;

  factory NotesListResModel.fromJson(Map<String, dynamic> json) =>
      NotesListResModel(
        noteId: json["noteID"],
        noteTitle: json["noteTitle"],
        createDateTime: DateTime.parse(json["createDateTime"]),
        latestEditDateTime: json["latestEditDateTime"],
      );

  Map<String, dynamic> toJson() => {
        "noteID": noteId,
        "noteTitle": noteTitle,
        "createDateTime": createDateTime,
        "latestEditDateTime": latestEditDateTime,
      };
}
