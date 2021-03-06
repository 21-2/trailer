import 'package:cloud_firestore/cloud_firestore.dart';

class Trailist {
  String ? trailistName;
  String? trailistId;
  List<dynamic>? locations;
  List<dynamic>? participants;
  Map<dynamic, dynamic>? period;
  String? trailistCover;


  Trailist({
    this.trailistId,
    this.trailistName,  
    this.locations,
    this.participants, 
    this.period,
    this.trailistCover,
  });

  Map<String,dynamic> toMap(){
    return {
      'trailistId': trailistId,
      'trailistName': trailistName,
      'participants': participants,
      'locations' : locations,
      'period' : period,
      'trailistCover' : trailistCover,
    };
  }

  Trailist.fromSnapshot(DocumentSnapshot snapshot){
    trailistId = (snapshot.data() as dynamic)['trailistId'];
    trailistName = (snapshot.data() as dynamic)['trailistName'];
    participants = (snapshot.data() as dynamic)['participants'];
    locations = (snapshot.data() as dynamic)['locations'];
    period = (snapshot.data() as dynamic)['period'];
    trailistCover = (snapshot.data() as dynamic)['trailistCover'];
  }
}