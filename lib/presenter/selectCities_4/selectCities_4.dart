import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../providers/detailsProvider.dart';
import 'viewListSearchYoutube.dart';
import 'viewHeaderSearchYoutube.dart';


class SearchYoutube extends StatefulWidget {
  const SearchYoutube({Key? key}) : super(key: key);

  @override
  _SearchYoutube createState() => _SearchYoutube();
}

class _SearchYoutube extends State<SearchYoutube> {



  @override
  Widget build(BuildContext context) {
    RoundedLoadingButtonController buttonController =RoundedLoadingButtonController();
    DetailsProvider detailsProvider = context.read<DetailsProvider>();

    double _ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); //BoxDecorationColorGradient(context),

          }, icon: Icon(Icons.arrow_back, color: Color(0xff4cf2c7), size: 28.0),
        ),

        toolbarHeight: 70,
        title: Text('Youtube to spread sheet conversor',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Card(
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: viewHeaderSearchYoutube(),
            ),
          ),

          
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: _ScreenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Click on the Button below to get the data in your spreed sheet ",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontSize: 30,
                            ),
                    ),
            
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
          ),

            detailsProvider.snippetList.isEmpty?

            Center(
              child: Container(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                ),
              ),
            )

            :viewListSearchYoutube(),



            ],
          ),

      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blue.shade900),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.blue.shade900,  Colors.blue.shade900],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)
        ),

        child: Container(
          constraints: BoxConstraints(minWidth: 300.0, maxHeight: 50.0),
          alignment: Alignment.center,
          child: Text('CLICK HERE',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      onPressed: () async{
             
               await detailsProvider.loadListSnippets(context);
               detailsProvider.createDataSpreadSheet(tempSnippetList: detailsProvider.snippetList);
              },
      
    ),

        ),
      ),
    );
  }
}

