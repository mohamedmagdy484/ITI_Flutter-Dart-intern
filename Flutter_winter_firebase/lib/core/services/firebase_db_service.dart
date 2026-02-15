import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/features/chat/data/model/chat_message_model.dart';
import 'package:flutter_winter_firebase/features/home/data/model/app_user_model.dart';

class FirebaseDbService {
  FirebaseDbService._();

  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  static final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref();
  static final FirebaseDbService instance = FirebaseDbService._();

  ValueNotifier<List<ChatMessageModel>> messagesNotifier = ValueNotifier([]);

  Future<void> createProfile(AppUserModel appUserModel) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(appUserModel.uid)
          .set(appUserModel.toMap());
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfile(AppUserModel appUserModel) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(appUserModel.uid)
          .update(appUserModel.toMap());
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<AppUserModel> getProfile(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firebaseFirestore.collection('users').doc(uid).get();
      Map<String, dynamic> userData = Map.from(
        doc.data() as Map<String, dynamic>,
      );
      AppUserModel appUserModel = AppUserModel.fromMap(userData);
      return appUserModel;
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<void> insertMessage(ChatMessageModel chatMessageModel) async {
    try {
      await _databaseReference
          .child('messages')
          .child(chatMessageModel.sender)
          .set(chatMessageModel.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> allChatMessage(String uid) async {
    try {
      _databaseReference.child('messages').child(uid).onValue.listen((event) {
        Map<String, dynamic> data = Map.from(
          event.snapshot.value as Map<Object?, Object?>,
        );
        List<ChatMessageModel> messages =
            data.values
                .map((e) => ChatMessageModel.fromMap(e as Map<String, dynamic>))
                .toList();
        messagesNotifier.value = messages;
      });
    } catch (e) {
      rethrow;
    }
  }
}
