import 'package:flutter/material.dart';

class UserInfoItem extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final String? subtitle;
  const UserInfoItem({Key? key, this.iconData, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      // height: 70,
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title!),
        subtitle: Text(subtitle!),
      ),
    );
  }
}
