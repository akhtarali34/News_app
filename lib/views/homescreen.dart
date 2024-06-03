import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/views/view_model/new_view_model.dart';

import '../Models/news_chanels_headlines_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.sizeOf(context).width*1;
   final height = MediaQuery.sizeOf(context).height*1;

    NewsViewModel newsViewModel = NewsViewModel();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Image.asset("images/category_icon.png", width: 30, height: 30,),
        ),
        centerTitle: true,
        title: Text("News", style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height*.55,
            width: width,
            child: FutureBuilder<NewsChanelsHeadlinesModel>(
              future: newsViewModel.fetchNewsChanelHeadlinesApi(),
              builder: (BuildContext context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: SpinKitCircle(size: 50,color: Colors.blue,),
                  );

                }else{
                  return ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index){
                    return Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data!.articles![index].urlToImage.toString(), placeholder: (context, url) => Container(child: spinkit2,),
                            ),
                          )
                        ],
                      ),
                    );
                  });
                }
              } ,
            ),
          )
        ],
      ),
    );
  }
}
const spinkit2 = SpinKitFadingCircle(
  color:  Colors.amber,
  size: 50,
);