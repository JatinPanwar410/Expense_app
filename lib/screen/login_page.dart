import 'package:expense_app/screen/signup_page.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset("assets/image/FLASH.png",height: 100,),
                  SizedBox(
                    width: 8,
                  ),
                  Text("spendo",style: TextStyle(fontSize: 80),),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Expenses made easy", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              const SizedBox(height: 80,),
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
                      borderSide: const BorderSide(color: Colors.grey)
                    ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)
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
                          borderSide: const BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                    }, child: const Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: (){}, child: const Text("Forgot password?",style: TextStyle(color: Colors.grey),)),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage(),));
                  }, child: const Text("SignUp",style: TextStyle(color: Colors.grey),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
