import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:trustedtallentsvalley/config/firebase_constant.dart';
import 'package:trustedtallentsvalley/fetures/Home/models/home_state.dart';
import 'package:trustedtallentsvalley/fetures/Home/models/user_model.dart';


final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});


class HomeNotifier extends StateNotifier<HomeState> {
  final FirebaseFirestore _firestore;

  HomeNotifier(this._firestore) : super(HomeState());

  // Get user data from Firestore
  Future<void> getGoalData() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection(FirebaseConstant.trustedUsers)
          .doc()
          .get();

      state = state.copyWith(userModel: UserModel.fromFirestore(doc));
    } catch (e) {
      // Handle errors
      print('Error fetching goal data: $e');
    }
  }

  // Close/toggle sidebar
  void closeBar() {
    state = state.copyWith(showSideBar: !state.showSideBar);
  }

  // Toggle sidebar visibility based on selected user
  void visibleBar({UserModel? selected}) {
    if (state.selectedUser == selected) {
      // Toggle sidebar if same user is selected
      state = state.copyWith(showSideBar: !state.showSideBar);
    } else {
      // Show sidebar and update selected user
      state = state.copyWith(
        showSideBar: true,
        selectedUser: selected,
      );
    }
  }

  // Get currently selected user
  UserModel getUser() {
    return state.selectedUser!;
  }

  // Add new data to Firestore
  Future<void> addNewData() async {
    try {
      await _firestore
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
      });
    } catch (e) {
      // Handle errors
      print('Error adding new data: $e');
    }
  }
}

// Provider for HomeState using StateNotifierProvider
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return HomeNotifier(firestore);
});

// Providers for specific parts of the state for more granular updates
final showSideBarProvider = Provider<bool>((ref) {
  return ref.watch(homeProvider).showSideBar;
});

final selectedUserProvider = Provider<UserModel?>((ref) {
  return ref.watch(homeProvider).selectedUser;
});