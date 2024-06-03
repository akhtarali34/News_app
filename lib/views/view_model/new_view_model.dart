



import 'package:news/Models/Repository/new_repo.dart';
import 'package:news/Models/news_chanels_headlines_model.dart';

class NewsViewModel{
  final _repo = NewsRepository();
   Future<NewsChanelsHeadlinesModel> fetchNewsChanelHeadlinesApi(){
     final response = _repo.fetchNewsChanelHeadlinesApi();
     return response;
   }
}