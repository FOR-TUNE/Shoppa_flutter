// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/profile/PersonalInformationScreen.dart';
import 'package:shoppa_app/screens/profile/SecurityInfoScreen.dart';
import 'package:shoppa_app/screens/profile/SupportInfoScreen.dart';
import 'package:shoppa_app/screens/profile/storeInformationScreen.dart';
import 'package:shoppa_app/screens/profile/widgets/profileDetailsCard.dart';
import 'package:shoppa_app/screens/profile/widgets/profileLogoutCard.dart';
import '../../widgets/customNavBar.dart';
import '../../constants/constants.dart';
import '../../enums.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String routeName = '/Profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 2,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: headerStyle.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getPropHeight(16),
              ),
              Text(
                "Helen's Boutique",
                style: headerStyle3.copyWith(
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(
                height: getPropHeight(16),
              ),
              ProfileCard(
                press: () {
                  Navigator.pushNamed(
                    context,
                    PersonalInformationScreen.routeName,
                  );
                },
              ),
              SizedBox(
                height: getPropHeight(32),
              ),
              Column(
                children: [
                  ProfileDetailsCard(
                    press: () {
                      Navigator.pushNamed(
                        context,
                        StoreInformationScreen.routeName,
                      );
                    },
                    topText: 'Store Information',
                    leadingIcon: "assets/icons/person_icon.svg",
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: getPropHeight(2)),
                  ProfileDetailsCard(
                    press: () {
                      Navigator.pushNamed(
                        context,
                        SecurityInfoScreen.routeName,
                      );
                    },
                    topText: 'Security',
                    leadingIcon: "assets/icons/lock_icon.svg",
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: getPropHeight(2)),
                  ProfileDetailsCard(
                    press: () {},
                    topText: 'FAQ',
                    leadingIcon: "assets/icons/faq_icon.svg",
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: getPropHeight(2)),
                  ProfileDetailsCard(
                    press: () {
                      Navigator.pushNamed(
                        context,
                        SupportInfoScreen.routeName,
                      );
                    },
                    topText: 'Support center',
                    leadingIcon: "assets/icons/support_icon.svg",
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: getPropHeight(2)),
                  ProfileDetailsCard(
                    press: () {},
                    topText: 'Terms and Conditions',
                    leadingIcon: "assets/icons/tac_icon.svg",
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: getPropHeight(2)),
                  ProfileDetailsCard(
                    press: () {},
                    topText: 'Privacy Policy',
                    leadingIcon: "assets/icons/privacy_icon.svg",
                    iconData1: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: getPropHeight(2)),
                  ProfileDetailsCard(
                    press: () {},
                    topText: 'Notifications',
                    leadingIcon: '',
                    iconData1: const Icon(
                      Icons.notifications_active,
                      size: 18,
                    ),
                  ),
                  SizedBox(height: getPropHeight(2)),
                  ProfileDetailsCard2(
                    press: () {},
                    topText: 'Store Link',
                    bottomText: "shoppa/helen’s boutique",
                    iconData1: const Icon(Icons.share),
                    iconData2: const Icon(Icons.content_copy_outlined),
                  ),
                  SizedBox(
                    height: getPropHeight(16),
                  ),
                  const LogOutCard(),
                ],
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: const CustomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
