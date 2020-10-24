import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';

class AdminUsersManager extends ChangeNotifier {
  List<User> users = [];

  final Firestore firestore = Firestore.instance;

  StreamSubscription _subscription;

  void updateUser(UserManager userManager) {
    _subscription?.cancel();

    if (userManager.adminEnabled) {
      _listenToUsers();
    } else {
      users.clear();

      notifyListeners();
    }
  }

  void _listenToUsers() {
    /*
    const faker = Faker();

    for (int i = 0; i <= 500; i++) {
      users.add(
        User(
          name: faker.person.name(),
          email: faker.internet.email(),
        ),
      );
    }

    users.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );

    notifyListeners();
    */

    //firestore.collection('users').getDocuments().then((snapsot) {
    _subscription = firestore.collection('users').snapshots().listen((snapsot) {
      users = snapsot.documents.map((u) => User.fromDocument(u)).toList();

      users.sort(
        (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
      );

      notifyListeners();
    });
  }

  List<String> get names => users.map((u) => u.name).toList();

  @override
  void dispose() {
    _subscription?.cancel();

    super.dispose();
  }
}
