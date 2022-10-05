/*
import '../../domain/models/modelYouTubeAPi.dart';
import 'daoYoutubeApI.dart';


class GetDetails {

  Map map = DaoYoutube().map;
  late List<Snippet> listaSnippet;
  List<Snippet> snippetsFromJsom(Map map){
  print(map);
  print('aaa');

  List<Snippet> listSipped = [];
  for(int i = 0; i<map.length; i++){
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
  }
  listaSnippet = listSipped;
  return listSipped;
}

}*/
