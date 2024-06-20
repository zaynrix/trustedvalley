import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title!).tr(),
        subtitle: GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: subtitle!));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('copied').tr(),
                backgroundColor: Colors.blue,
                behavior: SnackBarBehavior.floating,
                shape: StadiumBorder(),
                width: 300,
                // margin: EdgeInsets.all(
                //   MediaQuery.of(context).size.width * 0.5,
                // ),
              ),
            );
          },
          child: Text(
            subtitle!,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
