import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../providers/detailsProvider.dart';
import '../../ultil/respostaProcessamento.dart';


class viewListSearchYoutube extends StatefulWidget {
  viewListSearchYoutube({Key? key,});

  @override
  State<viewListSearchYoutube> createState() => _viewListSearchYoutube();
}
class _viewListSearchYoutube extends State<viewListSearchYoutube> {
    late Future<RespostaProcessamento> response;

  @override
  void initState() {
    response = context.read<DetailsProvider>().loadListSnippets(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width-10;
    double screenHeight = MediaQuery.of(context).size.height/2;
    DetailsProvider detailsProvider = context.read<DetailsProvider>();

    return Container(
              height: screenHeight,
              width: screenWidth,
              child: detailsProvider == null
              ? CircularProgressIndicator()
            
              : ListView.builder(
                    itemCount: detailsProvider.snippetList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color.fromRGBO(205, 213, 223, 1),width: 1)
                        ),
                        child: Center(
                          child: Column(
                            children: [
                                  Text(
                                detailsProvider.snippetList[index].title,
                                style: const TextStyle(
                                    color: Color.fromRGBO(76, 85, 102, 1),
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            
                            ],
                          )
                        ),
                      );
                    }
                ),
            );

  }
}

