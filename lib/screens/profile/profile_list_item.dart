import 'package:datn_test/screens/login/screens.dart';
import 'package:datn_test/screens/profile/change_pass.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:datn_test/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:datn_test/globals.dart' as globals;

class ProfileListItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final String apiUrl;
  final bool onTap;

  const ProfileListItem(
      {Key? key,
      required this.icon,
      required this.text,
      this.hasNavigation = true,
      this.apiUrl = "",
      required this.onTap})
      : super(key: key);

  @override
  _ProfileListItemState createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.onTap == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChanegPassWord()),
          );
        }
        var response = await http.get(
          Uri.parse(widget.apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${globals.accessToken}',
          },
        );
        if (!widget.hasNavigation && response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
      child: Container(
        height: kSpacingUnit * 5,
        margin: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 6,
        ).copyWith(
          bottom: kSpacingUnit * 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit * 3),
          color: widget.hasNavigation
              ? Color.fromARGB(255, 225, 225, 240)
              : Color.fromARGB(255, 238, 94, 84),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              size: kSpacingUnit * 2.5,
            ),
            SizedBox(width: kSpacingUnit * 1.5),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            if (widget.hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: kSpacingUnit * 1.5,
              ),
          ],
        ),
      ),
    );
  }
}
