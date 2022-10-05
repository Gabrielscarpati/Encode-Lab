import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/detailsProvider.dart';
import '../selectCities_4/viewListSelectCities_4.dart';
import '../selectCities_4/viewHeaderPesquisaCidade.dart';


class SelectCities_4 extends StatefulWidget {
  const SelectCities_4({Key? key}) : super(key: key);

  @override
  _SelectCities_4State createState() => _SelectCities_4State();
}

class _SelectCities_4State extends State<SelectCities_4> {



  @override
  Widget build(BuildContext context) {
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
        title: Text('Search for a video',
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
              child: ViewHeaderSelectCities_4(),
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
                      "Selecione as cidades que voce pretende trabalhar",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .fontSize),
                    ),
                    Text(
                      "Cidades selecionadas: ${8/*providerCitie.selectedcities.length*/} ",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .fontSize),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
          ),

            ViewListSelectCities_4(),
            ],
          ),

      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(

            onPressed: () async{
             
               await detailsProvider.loadListSnippets(context);
               detailsProvider.createDataSpreadSheet();

              },
            child: Container(
              height: 50,
              width: 300,
              color: Colors.grey,
              child: Text('here'),
            ),
          ),
        ),
      ),
    );
  }
}

