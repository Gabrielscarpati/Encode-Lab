import 'package:encode_lab/presenter/selectCities_4/selectCities_4.dart';
import 'package:encode_lab/providers/detailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{


  runApp(  MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (context) => DetailsProvider() ,),
    ],
    child: MyApp(),
  ),);

  WidgetsFlutterBinding.ensureInitialized();

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SelectCities_4(), //SelectCities_4(),
    );
  }
}

