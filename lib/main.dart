import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ibans Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "images/table.jpg",
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 175),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.deepOrange,
                    child:myProfile(72)
                  ),
                )
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "Alpha Ibrahima",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Spacer()
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10.5),
              child: Text(
                "Le courage ne se mesure pas par la taille de l'homme, mais par la force de sa volonté",
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Row(
              children: [
                Expanded(child: boutonContainer(text: "Mise à jours")),
                boutonContainer(icon: Icons.border_color)
              ],
            ),
            Divider(thickness: 2,),
            sectionTitleText("A propos"),
            aboutRow(icon: Icons.house, text: "Tivaoun Peulh"),
            aboutRow(icon: Icons.work, text: "Full Stack developper"),
            aboutRow(icon: Icons.favorite, text: "Je suis en couple avec mon ordinateur"),
            Divider(thickness: 2,),
            sectionTitleText("Amis"),
            allFriends(width / 3.6),
            Divider(thickness: 2,),
            sectionTitleText("Mes Posts"),
            post(
                time: "2 mois", image: "images/defarusci_1.JPG",
                desc: "desc descdescdesc descdesc descdesc defaru sci france france france france ",
                likes: 300,
                comments: 45
            ),
            post(
                time: "1 mois", image: "images/defarusci_2.JPG",
                desc: "desc descdescdesc descdesc descdesc defaru sci france france france france ",
                likes: 500,
                comments: 50
            ),
            post(
              time: "15 minutes", image: "images/defarusci_3.JPG",
              desc: "desc descdescdesc descdesc descdesc",
              likes: 2000,
              comments: 1500
            ),
          post(
              time: "5 minutes", image: "images/girl.jpg",
              desc: "desc descdescdesc descdesc descdesc",
              likes: 20,
              comments: 5),
        post(
            time: "1h minutes", image: "images/flowers.jpg",
            desc: "description description description description description description ",
            likes: 9,
            comments: 8
            ),
        post(
             time: "1h minutes", image: "images/defarusci_4.JPG",
             desc: "description description description description description description ",
             likes: 17,
             comments: 19
            ),

         ],
        ),
      ),
      );
  }

  CircleAvatar myProfile(double radius){
    return CircleAvatar(
      radius:radius ,
      backgroundImage: AssetImage("images/lion.jpg"),
    );
  }

  Container boutonContainer({IconData? icon, String? text}){
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepOrange
      ),
      child: (icon==null)
        ? Center(child: Text(text ?? "", style: TextStyle(color: Colors.white),),)
        : Icon(icon, color: Colors.white,),
      height: 50,
    );
  }

  Widget sectionTitleText(String text){
    return Padding(
        padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18
        ),
      ),
    );
  }

  Widget aboutRow({required IconData icon, required String text}){
    return Row(
      children: [
        Icon(icon),
        Padding(
            padding: EdgeInsets.all(5),
          child: Text(text),
        )
      ],
    );
  }

  Column friendsImage( String name, String imagePath, double width){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepOrange,
          ),
        ),
        Text(name,
        style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }

  Row allFriends(double width){
    Map<String, String> friends = {
      "Baridinho": "images/african.png",
      "Moussa": "images/defarusci_1.JPG",
      "Molou": "images/defarusci_2.JPG",
    };
    List<Widget> children = [];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Container post({required String time, required String image,
        required String desc, int likes = 0, int comments = 0}){

    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepOrange[50]
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfile(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text("Alpha Ibrahima", style: TextStyle(fontWeight: FontWeight.bold),),
              Spacer(),
              timeText(time)
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(image, fit: BoxFit.cover,),
          ),
          Text(desc),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text("$likes likes"),
              Icon(Icons.comment),
              Text("$comments comments")
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time){
    return Text("Il y a $time", style: TextStyle(color: Colors.blue),);
  }

}


