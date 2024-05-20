import 'package:flutter/material.dart';
import 'package:datn_test/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String subTitle;
  final icon;

  const CustomAppBar({
    Key? key,
    required this.subTitle,
    this.icon,
  }) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: RichText(
        text: TextSpan(
          text: 'English School\n',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
          children: <TextSpan>[
            TextSpan(
                text: subTitle,
                style: TextStyle(color: Colors.black, fontSize: 14.0)),
          ],
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Image.asset(
          "assets/icons/onlineclass.jpg",
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(
              right: 20.0,
            ),
            child: Icon(
              Icons.notifications,
              size: 20.0,
              color: AppColors.kOrangeClr,
            ),
          ),
        ),
      ],
    );
  }
}

//
class MainText extends StatelessWidget {
  final txt;

  const MainText({Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
    );
  }
}

//sub
class SubText extends StatelessWidget {
  final txt;

  const SubText({Key? key, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: AppColors.kGreyClr,
      ),
    );
  }
}

//
class TextFieldComponent extends StatelessWidget {
  final txtController;
  final bool passHide;
  final String txtHint;
  const TextFieldComponent(
      {Key? key,
      this.txtController,
      required this.passHide,
      required this.txtHint})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 40,
      width: MediaQuery.of(context).size.width * 0.94,
      child: TextFormField(
        controller: txtController,
        cursorColor: AppColors.kGreyClr,
        obscureText: passHide,
        decoration: new InputDecoration(
            focusColor: AppColors.kOrangeClr,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kGreyClr,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kOrangeClr,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: txtHint),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String txt;
  final width;

  const CustomButton(
      {Key? key, required this.onPressed, required this.txt, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      width: width,
      height: 40.0,
      child: RawMaterialButton(
        fillColor: AppColors.kOrangeClr,
        splashColor: Colors.deepOrangeAccent,

        child: Text(
          txt,
          //maxLines: 1,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        //shape: const StadiumBorder(),
      ),
    );
  }
}

//Custom Clickable text GestureDetector class
class CustomGestureText extends StatelessWidget {
  final onTapFunction;
  final txt;

  const CustomGestureText({Key? key, this.onTapFunction, this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Text(
          txt,
          style: TextStyle(
            color: AppColors.kOrangeClr,
            fontSize: 16,
            letterSpacing: 0,
            
          ),
        ),
      ),
    );
  }
}
