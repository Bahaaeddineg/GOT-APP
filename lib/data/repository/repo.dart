import '../api/api.dart';
import '../models/models.dart';

class Repository {
  final Api api;

  Repository(this.api);

  Future<List<MyCharacters>> getCharacters() async {
    Map chars = await api.getAllCharacters();
    List characters = chars["results"];
    return characters
        .map((character) => MyCharacters.fromJson(character))
        .toList();
  }
}
