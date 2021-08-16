import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movielist/home_page.dart';

class LoginPage extends StatelessWidget {
  @override

  final _formKey = GlobalKey<FormState>();

  movetoHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Movie Drawer"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_page.png",
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password cannot be empty";
                          }
                          if(value.length<8)
                            return "Password must be atleast 8 characters long";
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 50.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => movetoHome(context),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                margin: const EdgeInsets.only(right: 25.0),
                                width: 80,
                                height: 40,
                                alignment: Alignment.center,
                                child: Text("Login",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => movetoHome(context),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                margin: const EdgeInsets.only(right: 25.0),
                                width: 80,
                                height: 40,
                                alignment: Alignment.center,
                                child: Text("Signup",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        )
      )
    );
  }
}
