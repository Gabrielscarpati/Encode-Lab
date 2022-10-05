import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/detailsProvider.dart';

class ViewHeaderSelectCities_4 extends StatelessWidget {
  ViewHeaderSelectCities_4({Key? key,});

  @override
  Widget build(BuildContext context) {
    DetailsProvider detailsProvider = context.read<DetailsProvider>();

    return Column(
        children: [
          TextField(
            controller: detailsProvider.videoName,
            onChanged: (value) {
              print(detailsProvider.videoName);
            },
            decoration: new InputDecoration(
              filled: true,

              fillColor: Colors.white,
              prefixIcon: new Icon(Icons.search,
                color: Colors.blue.shade800,
              ),
              labelText: "Pesquisa pela cidade",
                labelStyle: TextStyle(
                  color: Colors.blue.shade800,
                ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}

