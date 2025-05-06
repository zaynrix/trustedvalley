import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trustedtallentsvalley/config/firebase_constant.dart';
import 'package:trustedtallentsvalley/fetures/Home/models/user_model.dart';
import 'package:trustedtallentsvalley/service_locator.dart';

class HomeProvider extends ChangeNotifier {
  UserModel? userModel;
  UserModel? selectedUser;
  bool showSideBar = false;
  Future getGoalData() async {
    DocumentSnapshot d = await sl<FirebaseFirestore>()
        .collection(FirebaseConstant.trustedUsers)
        .doc()
        .get();
    userModel = UserModel.fromFirestore(d);
    notifyListeners();
  }

  closeBar() {
    showSideBar = !showSideBar;
    notifyListeners();
  }

visibleBar({UserModel? selected}) {
    if (selectedUser == selected) {
      showSideBar = !showSideBar; // Toggle sidebar visibility
    } else {
      showSideBar = true; // Show sidebar if clicking on a different user
      selectedUser = selected; // Update selected user
    }
    notifyListeners();
  }

  UserModel getUser() {
    return selectedUser!;
  }

  addNewData() {
    sl<FirebaseFirestore>()
        .collection(FirebaseConstant.trustedUsers)
        .doc("3")
        .set({
      'aliasName': "مhjjhjhحمد",
      "id": "3",

      'mobileNumber': "059122222",
      'location': "غزة",
      'servicesProvided': "بنكي",
      'telegramAccount': "@غشا",
      'otherAccounts': "فيسبوك",
      'reviews': "3/4",
      'isTrusted': true,
      // FirebaseConstant.uid: uid,
      // FirebaseConstant.email: email,
      // FirebaseConstant.name: name,
      // FirebaseConstant.phone: phone,
      // FirebaseConstant.image: '',
      // FirebaseConstant.goal: '',
      // FirebaseConstant.level: 0,
    });
  }
}
