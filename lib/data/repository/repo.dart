import '../api/api.dart';
import '../models/models.dart';

class Repository {
  final Api api;

  Repository(this.api);

  Future<List<MyCharacters>> getCharacters() async {
    List chars = await api.getAllCharacters();
    return chars.map((character) => MyCharacters.fromJson(character)).toList();
  }
}

class QuoteRepo {
  final Api2 api;
  QuoteRepo(this.api);
  Future<Quote> getQuotes(String name) async {
    List quotes = await api.getAllQuotes();
    Map ok =quotes.firstWhere((quote) => quote["name"] == name);
    return Quote.fromJson(ok);
  }
}
