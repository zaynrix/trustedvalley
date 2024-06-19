import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/chipWidget.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/userInfoItem.dart';

class SideBarInformation extends StatelessWidget {
  const SideBarInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0), // Adjust radius as needed
            side: const BorderSide(
              width: 1.0, // Border width
              color: Colors.grey, // Border color
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "معلومات التواصل",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ChipWidget(
                      isTrusted: provider.selectedUser?.isTrusted ?? false),
                  SizedBox(
                    width: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        provider.closeBar();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              Divider(),
              UserInfoItem(
                iconData: Icons.person,
                title: "Name",
                subtitle: provider.selectedUser?.aliasName ?? '',
              ),
              UserInfoItem(
                iconData: Icons.phone,
                title: "Mobile Number",
                subtitle: provider.selectedUser?.mobileNumber ?? '',
              ),
              UserInfoItem(
                iconData: Icons.location_on,
                title: "Location",
                subtitle: provider.selectedUser?.location ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
