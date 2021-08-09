import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text("About Me")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/img/faris.jpg'),
                  radius: 50,
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Muhamad Alfarisy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold),),
        
              ],
            ),
            
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                TextSpan(
                text: 'Electrical /',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[300]),
                children: [
                  TextSpan(
                    text: ' Software Engineer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      color: Colors.green[300],
                      fontSize: 20),
                  ),
                
                ]
              ),
                style: TextStyle(fontSize: 20),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'muhamadalfarisy98.github.io/myprofile',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic),),
        
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
                boxShadow: [BoxShadow(blurRadius: 10,
                color: Colors.black,offset: Offset(1,3))]
              ),
              child: Column(
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Portofolio',
                    style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,),
                    )
                ],
              ),
              SizedBox(
              height: 100,
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  for (var porto in portofolios)
                    Image.asset('assets/img/$porto.png')
                ],
              )
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "muhamadalfarisy98",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,),
                ),
              ],
            ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
                boxShadow: [BoxShadow(blurRadius: 10,
                color: Colors.black,offset: Offset(1,3))]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Programming Languages',
                        style: TextStyle(
                        color: Colors.green[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,),
                        )
                    ],
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                  height: 180,
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      for (var skill in skills)
                        Image.asset('assets/img/$skill.png')
                    ],
                  )
                )
                ],
              ),
            ),
            
          
          ],
      )]
      ),
    ),
    );
  }
}

final portofolios = ["github","gitlab"];
final skills = ["python", "sql", "html","javascript","c", "dart"];