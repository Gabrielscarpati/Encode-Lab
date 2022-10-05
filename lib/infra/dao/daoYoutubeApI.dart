import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../domain/models/modelYouTubeAPi.dart';


class DaoYoutube {

  static var client = http.Client();


   Future fetchVideos({required String videoName}) async {
    String url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&q=videoName&key=AIzaSyCjUPI_htV069Dy_3WxBu2ogPZTFJjF5bM';
    var response = await client.get(Uri.parse(url));

    if(response.statusCode == 200) {
      Map<dynamic, dynamic> map = json.decode(response.body);
      return map;
    } else {
      return null;
    }
  }

  Future<List<Snippet>> snippetsFromJsom({required String videoName}) async{
    Map<dynamic, dynamic> map = await fetchVideos(videoName: videoName);
  print(videoName);
  print('bbb');

  List<Snippet> listSipped = [];
  for(int i = 0; i<map['items'].length; i++){
    print(map['items'][i]['snippet']['publishedAt']);

    String publishedAt = map['items'][i]['snippet']['publishedAt'];
    String channelId = map['items'][i]['snippet']['channelId'];
    String title = map['items'][i]['snippet']['title'];
    String description = map['items'][i]['snippet']['description'];
    String channelTitle = map['items'][i]['snippet']['channelTitle'];
    String publishTime = map['items'][i]['snippet']['publishTime'];

    listSipped.add(Snippet(
      publishedAt: publishedAt,
      channelId: channelId,
      title: title,
      description: description,
      channelTitle: channelTitle,
      publishTime: publishTime,

    ));
      print(listSipped);

  }
  return listSipped;
  }
}
