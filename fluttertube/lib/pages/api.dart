import 'dart:convert';
import 'package:fluttertube/models/video_model.dart';
import 'package:http/http.dart' as http;

const API_KEY = 'AIzaSyAC5Ok9s2d9lwviGKiz3rY7m2Kx6A2SXHI';

class Api {
  String _search;
  String _nextToken;

  Future<List<Video>> search(String search) async {
    _search = search;

    http.Response response = await http.get(
      'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10',
    );

    return decode(response);
  }

  Future<List<Video>> nextPage() async {
    http.Response response = await http.get(
      'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken',
    );

    return decode(response);
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);

      _nextToken = decode['nextPageToken'];

      List<Video> videos = decode['items'].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception('Erro ao carregar vídeos');
    }
  }
}
