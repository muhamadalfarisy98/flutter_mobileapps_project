import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginScreen.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/gercep.png',
                  height: 120,
                  width: 150,
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create new account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                TextSpan(
                text: 'Be a',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                    text: ' Gercepnian!',
                    style: TextStyle(
                      shadows: [
                        Shadow(blurRadius: 10,
                        color: Colors.green[200],
                        offset: Offset(5.0,5.0))
                      ],
                      fontWeight: FontWeight.bold, 
                      color: Colors.green[300],
                      fontSize: 20),
                  )
                ]
              ),
                style: TextStyle(fontSize: 20),
              ),],
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
            SizedBox(height:80),
            // Register
            Container(
              height: 40.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
                boxShadow: [BoxShadow(blurRadius: 5,
                color: Colors.blue,offset: Offset(1,3))]
              ),
              child: ElevatedButton(
                onPressed: () async{
                  // Route route = MaterialPageRoute(builder: (context) => HomeScreen());
                  // Navigator.pushNamed(context, '/home');
                  // Navigator.push(context, route);
                  await _firebaseAuth.createUserWithEmailAndPassword(
                    email: emailController.text, password: passwordController.text
                    ).then((value) => Navigator.pushNamed(context, '/login'));
                },
                child: Text('Register', 
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,)
                ),
            ),
            SizedBox(height: 5),
          ],
        )],
      )
      ),
    );
  }
}
