import 'package:trustedtallentsvalley/fetures/Home/models/user_model.dart';

class HomeState {
  final UserModel? userModel;
  final UserModel? selectedUser;
  final bool showSideBar;

  HomeState({
    this.userModel,
    this.selectedUser,
    this.showSideBar = false,
  });

  // Create a copy of this state with specified fields updated
  HomeState copyWith({
    UserModel? userModel,
    UserModel? selectedUser,
    bool? showSideBar,
  }) {
    return HomeState(
      userModel: userModel ?? this.userModel,
      selectedUser: selectedUser ?? this.selectedUser,
      showSideBar: showSideBar ?? this.showSideBar,
    );
  }
}