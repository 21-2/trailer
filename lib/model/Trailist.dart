import 'package:cloud_firestore/cloud_firestore.dart';

class Trailist {
  String ? trailistName;
  String? trailistId;
  List<Map<dynamic, dynamic>>? locations;
  List<dynamic>? participants;
  Map<dynamic, dynamic>? period;

  Trailist({
    this.trailistId,
    this.trailistName,  
    this.locations,
    this.participants, 
    this.period,
  });

  Map<String,dynamic> toMap(){
    return {
      'trailistId': trailistId,
      'trailistName': trailistName,
      'participants': participants,
      'locations' : locations,
      'period' : period,
    };
  }

  Trailist.fromSnapshot(DocumentSnapshot snapshot){
    trailistId = (snapshot.data() as dynamic)['trailistId'];
    trailistName = (snapshot.data() as dynamic)['trailistName'];
    participants = (snapshot.data() as dynamic)['participants'];
    locations = (snapshot.data() as dynamic)['locations'];
    period = (snapshot.data() as dynamic)['period'];

  }
}