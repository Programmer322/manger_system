import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manger_system/AppColors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.dividerColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(child: Image.asset("assets/images/mine_04.png",)),
          ),
          const SizedBox(height: 20,),
          DrawerListTile(
            title: "活动一览",
            press: () {},
          ),
          const SizedBox(height: 20,),
          DrawerListTile(
            title: "发起活动",
            press: () {},
          ),
          SizedBox(height: 20,),

          DrawerListTile(
            title: "学生管理",
            press: () {},
          ),
          SizedBox(height: 20,),

          DrawerListTile(
            title: "活动管理",
            press: () {},
          ),
          SizedBox(height: 20,),
          DrawerListTile(
            title: "管理员一览",
            press: () {},
          ),
          SizedBox(height: 20,),
          DrawerListTile(
            title: "账户",
            press: () {},
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    // required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title
  // ,svgSrc
  ;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      // leading: SvgPicture.asset(
      //   svgSrc,
      //   colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
      //   height: 16,
      // ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 16),
      ),
    );
  }
}