import 'package:flutter/material.dart';
import 'DrawerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'SearchPage.dart';
// import 'AccountPage.dart';
import 'LoginScreen.dart';

class HomeScreen extends StatelessWidget {

  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if(auth.currentUser != null){
      print(auth.currentUser.email);
    };

    return Scaffold(
      appBar: AppBar(title : Text("Home"),
      actions: <Widget>[
        Padding(padding: const EdgeInsets.all(8.0),
        // child : Icon(Icons.search), // menambah search feature
        )
      ],
      ),
      drawer: DrawerScreen(),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.pinkAccent,
      //     child: Text('+'),
      //     onPressed: () {},
      //   ),
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [ 
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(icon: Icon(Icons.notifications),onPressed:() {}),
            //     IconButton(icon: Icon(Icons.add_shopping_cart),onPressed:() {}),
            //   ],
            // ),
            SizedBox(height: 5),
            Text.rich(
              TextSpan(
                text: 'Welcome,\n',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[300]),
                children: [
                  TextSpan(
                    text: auth.currentUser.email,
                    // text: 'Faris',
                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blue[800]),
                  )
                ]
              ),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
               ),
               hintText: 'Search',
            ),
            ),
            SizedBox(height: 20),
            Text(
              'Hot News',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(height: 10),
            SizedBox(
                  height: 300,
                  // width: 200,
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 1,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      for (var city in cities)
                        Image.asset('assets/img/$city.jpeg',
                        width: 100,height: 100,)
                    ],
                  )
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
              child: ElevatedButton(
                onPressed: (){
                  _signOut().then((value) => 
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>LoginScreen()))
                  );
                },
                child: Text('Logout'),
                ),
            )
              ],
            )
            
          ],
        )],
      ),
    )
    );
  }
}

final cities = ['bronze','dinho','tokyo','magnus'];
