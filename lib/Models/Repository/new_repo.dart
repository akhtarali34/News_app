
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../news_chanels_headlines_model.dart';

class NewsRepository{
  Future<NewsChanelsHeadlinesModel> fetchNewsChanelHeadlinesApi() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=fee8636cdbe846c4847c69575fa8e508";
    final response = await http.get(Uri.parse(url));
      print("jjjjjjjjjjjjjjjjjjjjj");
    if (response.statusCode ==200){
      final body = jsonDecode(response.body);

    return NewsChanelsHeadlinesModel.fromJson(body);
    }else{
      throw Exception("error");
    }
  }
}