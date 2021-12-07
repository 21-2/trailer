import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailer/model/Locations.dart';

class SearchLocationCard extends StatefulWidget{
  final Locations? result;
  //SearchLocationCard({Key? key, this.result}) : super(key: key);
  SearchLocationCard({required this.result});

  @override
  _SearchLocationCardState createState() => _SearchLocationCardState(result: result!);
}

class _SearchLocationCardState extends State<SearchLocationCard>{
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  var favorited = false;

  Locations result;
  _SearchLocationCardState({required this.result});

   void _toggleFavorite() {
    setState(() {
      if (favorited) {
       
        favorited = false;
      } else {
        favorited = true;
      }
    });
  }
  @override  
  Widget build(BuildContext context){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: 
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  //이미지 안 들어감!!
                  child: Image(image: NetworkImage(result.img!), height: height*0.14)
                ),
            onTap: ()=>{Get.toNamed('/details')} //여기에 argument 넣기 
          ),
          SizedBox(height: height*0.02),
          //Location 이름
          Text(result.locationName!, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          SizedBox(height: height*0.008),
          //Location 위치 (지역+동)?
          Text(result.city!, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                iconSize: 25,
                icon: (favorited? 
                Icon(Icons.favorite, color:  Color(0xffFE4D68)) :  Icon(Icons.favorite_border, color: Colors.grey)), 
                onPressed: (){_toggleFavorite();},
              ),
              Text(result.likes!.toString(), style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ],
      );
  }
}