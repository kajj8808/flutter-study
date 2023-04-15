import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  // async 의 경우에는 return 에 future 를 적어줘야함.
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonsInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons =
          jsonDecode(response.body); // return 은 dynamic 어떤 타입이든 됨!
      // List<dynamic>  이것은 필수적이진 않지만 JSON 의 형식이 dynamic 으로 이뤄진
      // 리스타른것을 기억하기 쉽도록 적어둔것 . string 을 Decode 해서 가져오기에.!
      // 어떤값이 있는지 정확히 알수가없어서.
      for (var webtoon in webtoons) {
        webtoonsInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonsInstances;
    }
    throw Error();
  }

  // id 를 가져와서 웹툰 정보를 가져옴,
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  // id 를 가져와서 이전 웹툰 들을 가져옴,
  static Future<List<WebtoonEpicodeModel>> getLatestEpisordesById(
      String id) async {
    List<WebtoonEpicodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpicodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
