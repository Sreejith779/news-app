import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nik5/components/bottomSheet.dart';
import 'package:nik5/utils/text.dart';

class NewsBox extends StatelessWidget {
  const NewsBox({super.key, required this.imageUrl, required this.title, required this.time, required this.description, required this.url, required this.content});

  final String imageUrl,title,time,description,url,content;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
showBottomSheets(context,imageUrl,title,content,url);
      },
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          width: w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: imageUrl,
              imageBuilder: (context,imageProvider)=>
                Container(
                  width: 100,
                  height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
          image: DecorationImage(image: imageProvider,fit: BoxFit.cover,
          ),
        ),
                ),
              placeholder: (context,url)=>
                CircularProgressIndicator(),
              ),
        SizedBox(width: 10,),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
        
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: title, size: 18, color: Colors.black,),
            modifiedText(text: time, size: 13, color: Colors.black)
          ],
        ))),
        
            ],
          ),
        ),
      ),
    );
  }
}
