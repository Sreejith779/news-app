import 'package:flutter/material.dart';
import 'package:nik5/backend/functions.dart';


class SearchBars extends StatefulWidget {
  const SearchBars({Key? key}) : super(key: key);

  static TextEditingController searchcontroller =
  TextEditingController(text: '');

  @override
  State<SearchBars> createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height*0.08,
             width: w,
                  
              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(child: TextField(
                    controller:SearchBars.searchcontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search "
                    ),
                  ))
                ],
              ),
            ),
          ),
        //  SizedBox(width: 10,),
          InkWell(
            onTap: (){
              FocusScope.of(context).unfocus();
              fetchNews(SearchBars.searchcontroller.text);
            },
            child: Container(
              width: 45,
              height: 45,

              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Icon(Icons.search,color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
