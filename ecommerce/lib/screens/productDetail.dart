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
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProductImages(),
              _buildProductTitle(),
              SizedBox(height: 12.0,),
              _buildProductPrice(),
              SizedBox(height: 12.0,),
              _buildDivider(screenSize),
              SizedBox(height: 12.0,),
              _buildFurtherInfo(),
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

  _buildProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text("Kazak", style: TextStyle(fontSize: 16.0, color: Colors.black),),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Text("\$ 100", style: TextStyle(fontSize: 16.0, color: Colors.black)),
          SizedBox(width: 8.0,),
          Text("\$ 200", style: TextStyle(fontSize: 12.0, color: Colors.grey, decoration: TextDecoration.lineThrough),),
          SizedBox(width: 8.0,),
          Text("50\% discount", style: TextStyle(fontSize: 12.0, color: Colors.blue)),

        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.local_offer),
          SizedBox(width: 12.0,),
          Text("Click for more information", style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}