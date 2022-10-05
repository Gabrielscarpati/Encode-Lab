import 'package:flutter/cupertino.dart';
import 'package:gsheets/gsheets.dart';
import '../domain/models/modelYouTubeAPi.dart';
import '../infra/dao/daoYoutubeApI.dart';
import '../ultil/respostaProcessamento.dart';

class DetailsProvider with ChangeNotifier {

  static final DetailsProvider provider = DetailsProvider._internal();

  factory DetailsProvider() {
    return provider;
  }
  DetailsProvider._internal();


  final _credential = r''' 
  {
    "type": "service_account",
    "project_id": "flutter-encodelab-sheet",
    "private_key_id": "12918ccb466051a10717d8788e131b5bc6443b6c",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC0QqLFVvURK4Wn\nIy12+0fXtGXJ7kg7np/7hPIdJAHeJIqdx/LRvPl5X626kAprrPXRzOfWDY3QDrWC\nJq/nuH22Z0Y4v1U07zZucSeZzsgQ9muLbvp7NlbqQw4pdnmUlfbyyx94uYcRIBbx\n+b+nJixdlGjiAPcL/8T07SQfzlYHx7DBWDanLiMgT0+Z/gBxJf0Wcxfx2lXLfyqt\nAroJC9rLh6DZ81ZJIBsEqrXCqYNLXD5MdyweU/qN3bSce+t5pLLbvTUNipZDWdAm\nAqSbHB2m2PvHig4AGYkN3H2q0HgGFcqtXVTsbcm12SASdH0b6N3nzAmYyPZzFhjU\nNV70hJcnAgMBAAECggEACnHwB5pN0gRhFrm5mTLfS1b3LPfDNL0wzPy7oMek2g/o\n/lKHNfMKy6cpJG3TRMD9b349ktAvPvaTOurt93HfyvF6BrDDibEwyL6Cym1Kd30n\n5yjzl68i4ykmiW2FhwAXkqMFfFPXyTzAR54upktWd8exOiNPLWFRMtYI6VTl9EZb\neib4yOIYcljTng8KrwOL8GVKnPEa1GTDsBaNKeq6p8gLcmrPsslWwhtEcGzzJwB4\nh0mwb3kiPYMLizeaMzoBnOeefgkdKvFhPvyiVwT2NNLIAbw4gcKemCVQqLn8T30j\nELHMWLcQZcStME6phYsnbCbw63iep42AgKVJidUxTQKBgQDl8xAGbSgfoFaoVvz2\n9yiUptqkiHovd2eEHUQimSo3rNP8uunL61329lBdDYcgBYSE6/biyHtJLAdS6zo0\nYpy9yiOKNCjJFwYDalDfp4gJxDmh7nOCT1W7/LIDEQdFG73QKkWqLXt7IQhP8FdT\n0RrH4oNzjWCjJCBQDw/mp3NlFQKBgQDIroAT7E38/5lViA7F25aKC4oXYKGFlTTv\nnPmYLkMlF055DAsMqyVNUP0cj/ay9T4N/wqRl0QRKnjo+N93dr5JNLTouUCwJet/\n259X9+f9ydC+BbMyVg1s88ey2pfzjJN3eRdCfbsN+juy6TGh8nuB9iiYCgXcUDJZ\n1RqJYdCSSwKBgDBdJwmy+7VrK87MPPhUk5xwW5wveENzgbovzZzZSh/bodqOFY5m\nOqUuuUhZCAqcHns2hf682/FP6VpvTxalhwID+eWfgtSImyMswUXJHruvIdAFLxZB\nSW74fxhWBIlshEe8HFrmpgoHsI/fpP5kBJX19l/fZGvrtUAhat7AaWzhAoGAcyde\nqw//uFtauy+1emeEvHXeqYdzZ9m0ZIJo3qA9Oz1idCcq9/wFDZaZhxg88Xe0QgfF\nIsHv9wGuG9EjOcPTcOJjpN8YdXts5RM7HhlM794sf715lDq4vXotbz3rz38s53N+\nm1LWUTDzrLgPGOSxZmO/625k6oTCP7X+4jJUon0CgYEAuT1M27B9r0kIlCMQnsGM\n6pZLdj0N0KAz1vLUlDuD/gzUQM4UOpAcP7eTlhYdckx1Ri3KWTJnARX1m4FMirl8\nauF8w/svNL+4p63B04o0W7pOnbnJLUj2lWBdZ4Ovpl7eVdv7uRV6rZS72IARz5P9\n2KDJOR9aGp2mSJ4vZixTyhk=\n-----END PRIVATE KEY-----\n",
    "client_email": "encodelab-sheets@flutter-encodelab-sheet.iam.gserviceaccount.com",
    "client_id": "103129128311602382453",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/encodelab-sheets%40flutter-encodelab-sheet.iam.gserviceaccount.com"
  }

  ''';

  final _spreadsheetId = '1cPwiHj2KtEtr0I2iKakOtvx5yXeg4V8_Jio54gFJ8F0';


  void createDataSpreadSheet()async{
    final googleSheets = GSheets(_credential);
    
    final ss = await googleSheets.spreadsheet(_spreadsheetId);
    var sheet = ss.worksheetByTitle('Video1');
    
    await sheet!.values.insertValue('Name', column: 2,row:1 );
    await sheet!.values.insertValue('Title', column:3,row:1 );
    await sheet!.values.insertValue('Url', column: 4,row:1 );
    await sheet!.values.insertValue('Auth', column: 5,row:1 );
    await sheet!.values.insertValue('eiii', column: 6,row:1 );
    await sheet!.values.insertValue('Views', column: 7,row:1 );

    for(int i = 0; i<40; i++){
    await sheet!.values.insertValue(i, column:1,row:i );
    }

  }



  List<Snippet> snippetList = [];

  TextEditingController videoName = TextEditingController(); 
  void updateVideoName(){
    
  }


  Future<RespostaProcessamento> loadListSnippets(BuildContext context) async{
    RespostaProcessamento respostaProcessamento = RespostaProcessamento.ok();

    try{
          print(videoName);

      List<Snippet> tempSnippetList = await DaoYoutube().snippetsFromJsom(videoName: videoName.text.trim());
      print(tempSnippetList.length);
      tempSnippetList.forEach((element) {
        snippetList.add(element);
      });
    }catch(err){
      respostaProcessamento = RespostaProcessamento.erro(err.toString());
    }

    return respostaProcessamento;
  }

  notifyListeners();

  }



