import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/data/news_response.dart';
import 'package:newsapp/data/sources_response.dart';

class ApiManager {
  // dah el api key bta3i
  static const String API_KEY = "231b91c2b11a487c800df92999949750";

  static Future<SourcesResponse> loadNewsSources(String category) async {
    // de el mas2ola 2nha traga3li el api bta3 el sources bta3t el news
    var parameters = {
      // de el ba7ot feha el parameters el ra7ya le el api w m7tagha mno
      "apiKey": API_KEY,
      "category": category
    };
    var uri = Uri.https(
        // 3l4an el api bta3tna https
        'newsapi.org',
        // dah link el server nafso el hageb mn 3aleh el api el 2na 3ayzo
        // ba7ot el link l7ad.org w ba4el el https el fe el 2wal 3l4an el function keda keda hat7othom
        '/v2/top-headlines/sources',
        // el api nafso el mawgod 3ala el server w hna ba5od ba2i el link bas l7ad abl el ?
        parameters);

    var response =
        await http.get(uri); // dah 3l4an el api el basta5dmha no3ha GET

    var sourcesResponseAfterParsing =
        SourcesResponse.fromJson(jsonDecode(response.body));
    print(response.body);
    // ba4of el response el gali mn el server dah valid walla la eh el status bta3to
    if (response.statusCode == 200) {
      // 200 ya3ny ok
      return sourcesResponseAfterParsing;
    } else {
      if (sourcesResponseAfterParsing.message != null) {
        // dah hna el server rad 3alaya w 7asal connection bas fe mo4kela fe el server
        throw Exception(sourcesResponseAfterParsing.message);
      } else {
        // hna el server ma3aml4 connect 2slun w mafe4 response geh(masalan el net 2ate3)
        throw Exception('cannot load news Sources');
      }
    }
  }

  static Future<NewsResponse> loadNewsDetails(
      {String? sources, String? query}) async {
    var parameters = {
      "apiKey": "231b91c2b11a487c800df92999949750",
      "sources": sources,
      "q": query, // 34lan el search
    };

    var uri = Uri.https("newsapi.org", "/v2/everything", parameters);

    var response = await http.get(uri);

    var newsResponse = NewsResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return newsResponse;
    } else {
      if (newsResponse.message != null) {
        throw Exception(newsResponse.message);
      } else {
        throw Exception('Error loading data');
      }
    }
  }
}
