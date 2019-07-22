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
      bottomNavigationBar: _buildBottomNavigationBar(),
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
              SizedBox(height: 12.0,),
              _buildDivider(screenSize),
              SizedBox(height: 12.0,),
              _buildSizeArea(),
              SizedBox(height: 12.0,),
              _buildInfo(),

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
                    Image.asset("assets/images/kazak.jpeg"),
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
          Icon(Icons.local_offer, color: Colors.grey),
          SizedBox(width: 12.0,),
          Text("Click for more information", style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.straighten, color: Colors.grey,),
              SizedBox(width: 12.0,),
              Text("Size: M", style: TextStyle(color: Colors.grey),)
            ],
          ),
          Row(
            children: <Widget>[
              Text("Size Table", style: TextStyle(fontSize: 12.0,color: Colors.blue)),
            ],
          )
        ],
      ),
    );
  }

  _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text("Product Detail", style: TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text("Washing Detail", style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 40.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text("60% Coton, 30% Polyester", style: TextStyle(color: Colors.black),),
                Text("max 30 celcius degree", style: TextStyle(color: Colors.black),)
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: (){

              },
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.list,color: Colors.white,),
                  SizedBox(width: 4.0,),
                  Text("Wish", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: RaisedButton(
              onPressed: (){

              },
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.card_travel,color: Colors.white,),
                  SizedBox(width: 4.0,),
                  Text("Add Cart", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}