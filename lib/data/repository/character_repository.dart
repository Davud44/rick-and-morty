import 'package:dio/dio.dart';
import 'package:rick_and_morty/constants/constans.dart';

import '../model/character_response.dart';

class CharacterRepository {
  Future<CharacterResponse> getCharacters() async {
    var response = await Dio().get('${baseUrl}character');
    if (response.statusCode == 200) {
      CharacterResponse characterResponse =
          CharacterResponse.fromJson(response.data);
      return characterResponse;
    } else {
      throw Exception('Failed');
    }
  }
}
