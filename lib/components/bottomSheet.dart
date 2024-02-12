
import 'package:flutter/material.dart';

import '../utils/text.dart';


void showBottomSheets(BuildContext context,String title,content,imageUrl,url){
showModalBottomSheet(
    shape: const RoundedRectangleBorder(

      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)
      )
    ),
    elevation: 200,

    context: context, builder: (context)=>
BottomSheet(description: '', content: content, imageUrl: imageUrl, title: title,)
);

}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key, required this.description, required this.content, required this.imageUrl, required this.title});

  final String description,content,title,imageUrl;


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400,
      width: 390,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _bottomSheet(imageUrl,title,content)
        ],
      )

    );
  }

  Widget _bottomSheet( String imageUrl,title,content)=>
      Container(
        decoration: BoxDecoration(
            borderRadius:BorderRadius.only(
                topRight:Radius.circular(20),topLeft: Radius.circular(20)) ),
        height: 400,
        width: 400,
        child: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white,Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)
              ),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(title),
                fit: BoxFit.cover)
              ),
            ),
            Positioned(
                bottom: 170,
                child: Container(
                  width: 300,
                  child: boldText(text: content, size: 22, color: Colors.white),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(1),
                  width: 350,
                  child: modifiedText(text: imageUrl, size: 18, color: Colors.black),
                )),
          ],
        ),
      );
}
