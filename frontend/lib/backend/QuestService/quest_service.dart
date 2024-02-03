import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Future<Map<String, dynamic>> getDailyQuestList() async {
//   try {
//     DocumentSnapshot dailySnapshot = await _firestore.collection('questList').doc('daily').get();
//     Map<String, dynamic> questList = {};

//     for (var entry in dailySnapshot.data().entries) {
//       questList[entry.key] = entry.value;
//     }

//     return questList;
//   } catch (e) {
//     print('Error getting daily quest list: $e');
//     return {};
//   }
// }