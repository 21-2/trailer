import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchLocationCard extends StatefulWidget{

  @override 
  _SearchLocationCard createState() => _SearchLocationCard();
}

class _SearchLocationCard extends State<SearchLocationCard>{
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  var favorited = false;

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
                  child: Image(image: AssetImage('lib/images/loc-card-1.png'), height: height*0.14)
                ),
            onTap: ()=>{Get.toNamed('/searchresults')} //여기에 argument 넣기 
          ),
          SizedBox(height: height*0.02), 
          Text("이스케이프 풀 빌라", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          SizedBox(height: height*0.008), 
          Text('포항시 남구 구룡포', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
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
              Text("1100", style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ],
      );
  }
}