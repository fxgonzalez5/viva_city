import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/infrastructure/mappers/mappers.dart';

import 'package:viva_city/infrastructure/models/models.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<User?> authStatus() {
    return _auth.authStateChanges();
  }

  Future<UserEntity?> getUser() async {
    DocumentSnapshot snapshot = await _firestore.collection('users').doc(_auth.currentUser?.uid).get();
    return UserDBMapper.userDBToEntity(UserDB.fromMap(snapshot.data() as Map<String, dynamic>));
  }

  Future<int?> createAccount(String name, String email, String password, String phone,) async {
    try {
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final data = UserDBMapper.userEntityToModel(
        UserEntity(
          id: credential.user!.uid,
          name: name,
          email: email,
          phone: phone
        )
      );

      await _firestore.collection('users').doc(credential.user!.uid).set(data.toMap());

      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // La cuenta ya existe para ese correo electrónico.
        return 1;
      } else if (e.code == 'weak-password') {
        // La contraseña proporcionada es demasiado débil.
        return 2;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<String?> uploadImage(File? image) async {
    if (image == null) return null;

    final user = await getUser();
    final formattedName = user!.name.replaceAll(' ', '_');
    final formated = DateFormat('yyyyMMdd_HHmmss');
    final nameFile = '${formattedName}_${formated.format(DateTime.now())}';
    final Reference ref = _storage.ref().child('Users').child(nameFile);
    final UploadTask uploadTask = ref.putFile(image);
    final TaskSnapshot snapshot = await uploadTask;

    if (snapshot.state == TaskState.success) {
      return await snapshot.ref.getDownloadURL();
    } else {
      return null;
    }
  }

  Future<int?> updateUser(UserEntity uploatedUser) async {
    try {
      final data = UserDBMapper.userEntityToModel(uploatedUser);
      await _firestore.collection('users').doc(uploatedUser.id).update(data.toMap());
      return 0;
    } catch (e) {
      return 1;
    }
  }

  Future<int?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Ningún usuario encontrado para ese correo electrónico.
        return 1;
      } else if (e.code == 'wrong-password') {
        // Contraseña incorrecta proporcionada para ese usuario.
        return 2;
      } else {
        return 3;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}