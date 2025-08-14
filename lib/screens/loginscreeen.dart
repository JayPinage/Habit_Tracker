import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers.dart';
import 'package:habit_tracker/screens/homescreen.dart';
import 'package:habit_tracker/screens/signupscreen.dart';

class Loginscreeen extends ConsumerWidget {
   Loginscreeen({super.key});
 

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final TextEditingController emailcontroller=TextEditingController();
    final TextEditingController passwordcontroller =TextEditingController();
     final globalkey = GlobalKey<FormState>();

     final logdata=ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 25, color: Colors.blue),
        ),
      ),
      body:logdata.isLoading? Center(child: CircularProgressIndicator(),): Form(
        key: globalkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Email";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                 hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Password of Six Characters";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.3,vertical: 20),
                  backgroundColor: Colors.blue[100],
                ),
                onPressed: () {
                  if(globalkey.currentState!.validate()){
                   
                   ref.read(authNotifierProvider.notifier).login(emailcontroller.text.trim(), passwordcontroller.text.trim());

                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Homescreen()), (Route<dynamic>route)=>false);
                    //login an account

                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Valid Details")));
                  } 
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                ),
              ),
              SizedBox(height: 20),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Signupscreen();
                      },
                    ),
                  );
                },
                child: Text(
                  " Create an Accunt",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
