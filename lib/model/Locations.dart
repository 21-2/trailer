import 'package:cloud_firestore/cloud_firestore.dart';

class Locations {
  String ? locationName;
  String? locationId;
  String? phoneNumber;
  String? address;
  String? city;
  String? description;
  String? img;
  var geolocation;
  int?  likes;
  List<dynamic>? reviews = [];
  List<dynamic>? tag = [];

  Locations({
    this.locationName,
    this.locationId,
    this.phoneNumber,
    this.address,
    this.city,
    this.description,
    this.geolocation,
    this.img,
    this.likes,
    this.reviews,
    this.tag,
  });

  Map<String,dynamic> toMap(){
    return {
      'locationId': locationId,
      'locationName': locationName,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'description': description,
      'geolocation' : geolocation,
      'img' : img,
      'likes' : likes,
      'reviews': reviews,
      'tag': tag,
    };
  }

  Locations.fromSnapshot(DocumentSnapshot snapshot){
    locationId = (snapshot.data() as dynamic)['locationId'];
    locationName = (snapshot.data() as dynamic)['locationName'];
    phoneNumber = (snapshot.data() as dynamic)['phoneNumber'];
    address = (snapshot.data() as dynamic)['address'];
    city = (snapshot.data() as dynamic)['city'];
    description = (snapshot.data() as dynamic)['description'];
    geolocation = (snapshot.data() as dynamic)['geolocation'];
    img = (snapshot.data() as dynamic)['img'];
    likes = (snapshot.data() as dynamic)['likes'];
    reviews = (snapshot.data() as dynamic)['reviews'];
    tag = (snapshot.data() as dynamic)['tag'];

  }
}