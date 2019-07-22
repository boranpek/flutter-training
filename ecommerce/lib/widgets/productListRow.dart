import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget{
  String name;
  int currentPrice;
  int originalPrice;
  int discount;
  String imageUrl;

  ProductListRow({this.name, this.currentPrice, this.originalPrice,
    this.discount, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildProductItemCard(context),
        _buildProductItemCard(context)
      ],
    );
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(this.imageUrl),
              height: 250.0,
              width: MediaQuery.of(context).size.width/2.2,
            )
          ],
        ),
      ),
    );
  }

}