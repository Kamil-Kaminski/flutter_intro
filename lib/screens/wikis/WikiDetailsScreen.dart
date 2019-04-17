import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/apimodels/WikisResponseDTO.dart';
import 'package:http/http.dart';

class WikiDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WikiDetailsScreenState();
}

class WikiDetailsScreenState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Future<WikisResponseDTO> _getWikis() async {
    final response =
        await get('https://www.wikia.com/api/v1/Wikis/List?limit=25&batch=1');
    if (response.statusCode == 200) {
      return WikisResponseDTO.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
