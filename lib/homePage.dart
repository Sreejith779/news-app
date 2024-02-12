import 'package:flutter/material.dart';
import 'package:nik5/backend/functions.dart';
import 'package:nik5/components/newsBox.dart';
import 'package:nik5/utils/constants.dart';
import 'package:nik5/utils/key.dart';

import 'components/searchBar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
late Future<List>news;
  @override
  void initState() {
    SearchBars.searchcontroller.addListener(_onSearchTextChanged);
    news = fetchNews(SearchBars.searchcontroller.text);
    super.initState();
  }
  @override
  void dispose() {
 SearchBars.searchcontroller.dispose();
    super.dispose();
  }

void _onSearchTextChanged() {
  // Trigger search whenever the search text changes
  setState(() {
    news = fetchNews(SearchBars.searchcontroller.text);
  });
}
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        title: const Center(child: Text("News App")),
      ),
body: Column(
  children: [
    // SearchBars(),
    Expanded(child: Container(
      width: w,
      child: FutureBuilder<List>(
        future: news,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount:snapshot.data!.length,
                itemBuilder: (context,index)=>
            NewsBox(imageUrl: snapshot.data![index]['urlToImage']!=null
                ?snapshot.data![index]['urlToImage']:Constants.imageUrl,
                title: snapshot.data![index]['title'],
                time: snapshot.data![index]['publishedAt'],
                description: snapshot.data![index]['description'].toString(),
                url: snapshot.data![index]['url'],
              content:snapshot.data![index]['content'].toString(),)
            );
          }
          return Text("Not Found");
        },
      ),
    ))
  ],
),
    );
  }

}
