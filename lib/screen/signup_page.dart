import 'package:expense_app/screen/homepage.dart';
import 'package:flutter/material.dart';


class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/FLASH.png",height: 100,),
                  SizedBox(
                    width: 8,
                  ),
                  Text("spendo",style: TextStyle(fontSize: 80),),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Expenses made easy", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Conform Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                width: 350,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    }, child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
