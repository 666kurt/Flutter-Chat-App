import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get users

  /* 
  
  [
    {
      'email': value,
      'id': value,
    },
    {
      'email': value2,
      'id': value2,
    },
  ]

  */

  Stream<List<Map<String, dynamic>>> getUsers() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // send message

  // get message
}
