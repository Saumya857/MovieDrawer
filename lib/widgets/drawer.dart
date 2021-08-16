import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movielist/login_page.dart';

class MyDrawer extends StatelessWidget{
  @override

  movetoLogin(BuildContext context){
    Navigator.pop( context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  Widget build(BuildContext context) {
      return Drawer(
        child: Container(
          color: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text("xyz",style: TextStyle(color: Colors.black),),
                    accountEmail: Text("abc@pqr.com",style: TextStyle(color: Colors.black),),
                    currentAccountPicture: CircleAvatar(),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )
              ),
              ListTile(
                leading: Icon(CupertinoIcons.settings,color: Colors.white,),
                title: Transform.translate(offset: Offset(-16,0),
                  child:Text("Settings",style: TextStyle(color: Colors.white,fontSize: 16) ))
              ),
              ListTile(
                  leading: Icon(CupertinoIcons.info,color: Colors.white,),
                  title: Transform.translate(offset: Offset(-16,0),
                      child:Text("About",style: TextStyle(color: Colors.white,fontSize: 16) ))
              ),
              ListTile(
                  leading: Icon(CupertinoIcons.exclamationmark_circle,color: Colors.white,),
                  title: Transform.translate(offset: Offset(-16,0),
                      child:Text("Help",style: TextStyle(color: Colors.white,fontSize: 16) ))
              ),
              ListTile(
                onTap: () => movetoLogin(context),
                  leading: Icon(CupertinoIcons.lock,color: Colors.white,),
                  title: Transform.translate(offset: Offset(-16,0),
                      child:Text("Logout",style: TextStyle(color: Colors.white,fontSize: 16) ))
              )
            ],
          ),
        )
      );
  }
}