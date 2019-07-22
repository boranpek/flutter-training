import 'package:flutter/material.dart';

class ImageViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image View"),
      ),
      body: ListView(
        children: <Widget>[
          Text("use placeholder", style:TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
          FadeInImage.assetNetwork(
            placeholder: "assets/images/giphy.gif",
            image: "https://www.manche.com.tr/images_buyuk/f9/Manche-Vizon-Erkek-Kazak-Balikci_11109_1.jpg",
          ),
          Text("use asset", style:TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
          Image.asset("assets/images/kazak.jpeg"),
          Text("use network", style:TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
          Image.network("https://img-cacharel.mncdn.com/UPLOAD/PRODUCT_NEW/2178x2904/05/1/0TK/thumb/50205518-VR027-erkek-triko-kazak-1_large.jpg"),

        ],
      ),
    );
  }

}