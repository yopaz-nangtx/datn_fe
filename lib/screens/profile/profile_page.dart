import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:datn_test/constants/route.dart';
import 'package:datn_test/screens/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/screens/profile/profile_list_item.dart';
import 'package:datn_test/globals.dart' as globals;

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 10,
            width: kSpacingUnit * 10,
            margin: EdgeInsets.only(top: kSpacingUnit * 5),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit * 5,
                  backgroundImage: AssetImage("assets/icons/avatar.png"),
                ),
                
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit * 2),
          Text(
            globals.fullName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            globals.phoneNumber,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            globals.email,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            globals.address,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          
          SizedBox(height: 300),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit * 3),
      ],
    );

    return Container(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.lock,
                        text: 'Change Password',
                        onTap: true,
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        hasNavigation: false,
                        apiUrl: urlLogout,
                        onTap: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
