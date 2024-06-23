import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/chipWidget.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/userInfoItem.dart';

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "معلومات التواصل",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ChipWidget(
                        isTrusted: provider.selectedUser?.isTrusted ?? false),
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black54,
                ),
                UserInfoItem(
                  iconData: Icons.person,
                  title: "aliasName",
                  subtitle: provider.selectedUser?.aliasName ?? '',
                ),
                UserInfoItem(
                  iconData: Icons.phone,
                  title: "mobile_number",
                  subtitle: provider.selectedUser?.mobileNumber ?? '',
                ),
                UserInfoItem(
                  iconData: Icons.location_on,
                  title: "location",
                  subtitle: provider.selectedUser?.location ?? '',
                ),
                UserInfoItem(
                  iconData: Icons.settings_rounded,
                  title: "services_provided",
                  subtitle: provider.selectedUser?.servicesProvided ?? '',
                ),
                UserInfoItem(
                  iconData: Icons.telegram,
                  title: "telegram_account",
                  subtitle: provider.selectedUser?.telegramAccount ?? '',
                ),
                UserInfoItem(
                  iconData: Icons.location_on,
                  title: "other_accounts",
                  subtitle: provider.selectedUser?.telegramAccount ?? '',
                ),
                UserInfoItem(
                  iconData: Icons.star_border_purple500_outlined,
                  title: "reviews",
                  subtitle: provider.selectedUser?.reviews ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
