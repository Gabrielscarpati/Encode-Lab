/*import 'package:encode_lab/providers/detailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ultil/respostaProcessamento.dart';

class HomeView extends StatefulWidget {
  HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<RespostaProcessamento> response;

  @override
  void initState() {
    response = context.read<DetailsProvider>().loadListSnippets(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DetailsProvider detailsProvider = context.read<DetailsProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff535FF7),
        title:  Text('detailsProvider.eee'),
      ),
      body: FutureBuilder<RespostaProcessamento>(
            future: response,
            builder: (contexto, snapshot){
              if (snapshot.hasData) {
                return ListView.builder(
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
                                detailsProvider.snippetList[index].description,
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
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),

     
        
    );
  }
}
*/