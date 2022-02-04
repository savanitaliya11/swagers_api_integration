import 'dart:developer';

import 'package:swagger_api_integration/api/api_service/api_handler.dart';
import 'package:swagger_api_integration/api/model/res_model/note_list_res_model.dart';
import 'package:swagger_api_integration/api/routes/api_routes.dart';

class GetUserRepo {
  //To fetch data from the api
  static Future<List<NotesListResModel>> getUserRepo() async {
    var headers = {'apiKey': 'f7e85fb8-2ce0-4d3b-b14c-28691028b534'};

    var response = await APIHandler.apiHandler(
      //contains api link.....
      url: APIRoutes.getNoticeData,
      //Mandatory to provide type of the api calling.....
      apiType: APIType.aGet,
      //If required.......
      headers: headers,
    );
    return notesListResModelFromJson(response);
  }
}
