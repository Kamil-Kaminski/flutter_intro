import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/apimodels/WikisResponseDTO.dart';
import 'package:http/http.dart';

class WikiDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WikiDetailsScreenState();
}

class WikiDetailsScreenState extends State {
  Future<WikisResponseDTO> _wikis;

  @override
  void initState() {
    super.initState();
    _wikis = _getWikis();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WikisResponseDTO>(
        future: _wikis,
        builder: (context, snapshot) {
          return Center(child: _getContent(snapshot));
        });
  }

  Widget _getContent(snapshot) {
    if (snapshot.hasData) {
      return Text("size: ${snapshot.data.items.length}");
    } else if (snapshot.hasError) {
      return Text("error: ${snapshot.error}");
    } else {
      return Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
    }
  }

  Future<WikisResponseDTO> _getWikis() async {
    final response =
        await get('https://www.wikia.com/api/v1/Wikis/List?limit=25&batch=1');
    if (response.statusCode == 200) {
      return WikisResponseDTO.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
