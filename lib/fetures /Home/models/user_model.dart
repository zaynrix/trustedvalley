import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String aliasName;
  final String mobileNumber;
  final String location;
  final String servicesProvided;
  final String telegramAccount;
  final String otherAccounts;
  final String reviews;
  final bool isTrusted;

  UserModel({
    required this.id,
    required this.aliasName,
    required this.mobileNumber,
    required this.location,
    required this.servicesProvided,
    required this.telegramAccount,
    required this.otherAccounts,
    required this.reviews,
    required this.isTrusted,
  });

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return UserModel(
      id: data?['id'] ?? '',
      aliasName: data?['aliasName'] ?? '',
      mobileNumber: data?['mobileNumber'] ?? '',
      location: data?['location'] ?? '',
      servicesProvided: data?['servicesProvided'] ?? '',
      telegramAccount: data?['telegramAccount'] ?? '',
      otherAccounts: data?['otherAccounts'] ?? '',
      reviews: data?['reviews'] ?? '',
      isTrusted: data?['isTrusted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aliasName': aliasName,
      'mobileNumber': mobileNumber,
      'location': location,
      'servicesProvided': servicesProvided,
      'telegramAccount': telegramAccount,
      'otherAccounts': otherAccounts,
      'reviews': reviews,
      'isTrusted': isTrusted,
    };
  }
}
