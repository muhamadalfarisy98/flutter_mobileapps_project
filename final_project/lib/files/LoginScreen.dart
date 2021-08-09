import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'HomeScreen.dart';
import 'RegisterScreen.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/login_user.png',
                  height: 120,
                  width: 150,
                )
              ],
            ),
            SizedBox(height: 30),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, size: 20),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
               ),
               hintText: 'Email',
               
            ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: 20),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
               ),
               hintText: 'Password',
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Doesn't have an account?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c) => RegisterScreen()));
                  },
                  child: 
                  Text(
                  "Register",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.green[300]),
                )
              )
              ],
            ),
            SizedBox(height: 5),
             Container(
              height: 45.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
                boxShadow: [BoxShadow(blurRadius: 5,
                color: Colors.blue,offset: Offset(1,3))]
              ),
              child: ElevatedButton(
                onPressed: () async {
                  // Route route = MaterialPageRoute(builder: (context) => HomeScreen());
                  // Navigator.pushNamed(context, '/home');
                  // Navigator.push(context, route);
                  await _firebaseAuth.signInWithEmailAndPassword(
                    email: emailController.text, password: passwordController.text
                    ).then((value) => Navigator.pushNamed(context, '/mainmenu'));
                    /*
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder:(context)=>HomeScreen()))
                     */
                },
                child: Text('Login', 
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,)
                ),
            ),
          ],
        )],
      )
      ),
    );
  }
}