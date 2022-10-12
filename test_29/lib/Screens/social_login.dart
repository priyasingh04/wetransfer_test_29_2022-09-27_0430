import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:test_29/Screens/navigationdrawer_bottombar.dart';
import 'package:test_29/Screens/sharedpreference.dart';
import 'package:test_29/Screens/url.dart';



GoogleSignIn _googleSignIn =GoogleSignIn();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FacebookLogin facebookSignIn =  FacebookLogin();

  // var http;
  Future<dynamic> _login()async{
    _logOut();

    final result = await facebookSignIn.logIn(customPermissions: ['email']);
    print(result);
    var status = {FacebookLoginStatus}; FacebookLoginStatus.error;  final token = result.accessToken?.token;
    final graphResponse = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token'));
    final profile = json.decode(graphResponse.body);
    print(profile);

    // if (token != null) // login page calling

  }
  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
  }


  void googleSignInProcess(BuildContext context)async{
    if(await _googleSignIn.isSignedIn()){
      handleSignOut();
    }

    GoogleSignInAccount? googleUser;
    GoogleSignInAuthentication googleSignInAuthentication;
    try {
      googleUser = (await _googleSignIn.signIn());
      if (googleUser!= null) {
        googleSignInAuthentication = await googleUser.authentication;
        print(googleSignInAuthentication.accessToken);
      }
    } catch (error) {
      print(error);

    }

    if (await _googleSignIn.isSignedIn()) {
      print(googleUser?.email);
      print(googleUser?.displayName);
      print(googleUser?.photoUrl);
      print(googleUser?.id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sucess:${googleUser?.email}" ?? "")));
    }
  }
  Future<void> handleSignOut() => _googleSignIn.disconnect();

  @override
  void initState() {
    super.initState();


  }
  @override
  dispose() {
    super.dispose();
  }



  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(child:Padding(padding: const EdgeInsets.all(30),child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                googleSignInProcess(context);

              }, child: const Text('Login with gmail',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 30,),

              ElevatedButton(onPressed: (){
                _login();
              }, child: const Text('Login with facebook',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
              }, child: const Text('Navigation drawer with bottombar',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
              }, child: const Text('Landscap Sharedpreference',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePageOne()));
              }, child: const Text('Webview',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),),



            ],
          ),
          ),
        ),

      ),
      )
    );
  }
}
