import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationCard extends StatefulWidget{

  @override 
  _LocationCard createState() => _LocationCard();
}

class _LocationCard extends State<LocationCard>{
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  @override  
  Widget build(BuildContext context){

    var favorited = false;

    Widget heart = Container(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: (favorited
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border)),
                color: Colors.red,
                
                onPressed: ()=>{favorited = !favorited},
              ),
            ),
          ],
        )
      );

    return Container(
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(image: AssetImage('lib/images/loc-card-1.png'), height: height*0.147)
              ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(50, 65, 0, 0),
                 child: heart,
               ),
            ]
          ),
           SizedBox(height: height*0.02), 
          Text("이스케이프 풀 빌라", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          SizedBox(height: height*0.008), 
          Text('포항시 남구 구룡포', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
        ],
        
      ),
      );
  }
}