import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String ? name;
  String? id;
  String? email;
  List<dynamic>? trailist = [];
  List<dynamic>? favorites = [];
  List<dynamic>? cart = [];
  List<dynamic>? recentSearch = [];

  UserModel({
    this.cart,
    this.email,
    this.favorites,
    this.name,
    this.trailist,
    this.id,
    this.recentSearch,
  });

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'favorites': favorites,
      'trailist': trailist,
      'cart' : cart,
      'recentSearch' : recentSearch,

    };
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    name = (snapshot.data() as dynamic)['name'];
    email = (snapshot.data() as dynamic)['email'];
    id = (snapshot.data() as dynamic)['id'];
    favorites = (snapshot.data() as dynamic)['favorites'];
    trailist = (snapshot.data() as dynamic)['trailist'];
    cart = (snapshot.data()as dynamic)['cart'];
    recentSearch = (snapshot.data() as dynamic)['recentSearch'];

  }
}