import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductDetailState();

}

class ProductDetailState extends State<ProductDetail> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 40.0, color: Colors.black),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text("Product Detail",style: TextStyle(color: Colors.black),),
      ),
      body: _buildProductDetails(context),
    );;
  }

  _buildProductDetails(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProductImages(),
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesController = TabController(length: 3,vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO_IxBFyIR8uWRSzf2bRwGKcngr2ykYWa9t7c5MWcn5QlzPPB_"),
                    Image.network("https://www.manche.com.tr/images_buyuk/f9/Manche-Vizon-Erkek-Kazak-Balikci_11109_1.jpg"),
                    Image.network("https://www.heptarz.com/i/l/000/0003051_233-sunteks-erkek-gri-balikci-yaka-kazak.jpeg"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}