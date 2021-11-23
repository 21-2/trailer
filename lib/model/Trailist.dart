import 'package:cloud_firestore/cloud_firestore.dart';

class Trailist {
  String ? trailistName;
  String? trailistId;
  late List<Map<String, dynamic>> locations;
  List<dynamic>? participants= [];

  Trailist({
    required this.trailistId,
    required this.trailistName,  
    required this.locations,
    required this.participants, 
  });

  Map<String,dynamic> toMap(){
    return {
      'trailistId': trailistId,
      'trailistName': trailistName,
      'participants': participants,
      'locations' : locations,
    };
  }

  Trailist.fromSnapshot(DocumentSnapshot snapshot){
    trailistId = (snapshot.data() as dynamic)['trailistId'];
    trailistName = (snapshot.data() as dynamic)['trailistName'];
    participants = (snapshot.data() as dynamic)['participants'];
    locations = (snapshot.data() as dynamic)['locations'];

  }
}