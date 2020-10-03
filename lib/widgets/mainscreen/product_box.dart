import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/widgets/mainscreen/bottom_sheet_product.dart';

class ProductBox extends StatelessWidget {
  final String name;
  final String image;
  final String material;
  final double price;
  final String categoryname;
  ProductBox(
      {this.name = 'Brown Chair',
      this.image = 'chair1',
      this.material = 'Wood',
      this.price = 99.99,
      this.categoryname});
  @override
  Widget build(BuildContext context) {
    //for the stack
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(color: kBrownBGColor),
        child: Stack(
          children: <Widget>[
            //the white box
            Positioned(
              top: 53,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.orange[300], blurRadius: 2),
                  ],
                ),
                height: 140,
                width: 170,
              ),
            ),
            //Product Image
            Positioned(
              top: 3,
              child: Container(
                width: 170,
                alignment: Alignment.center,
                child: Image(
                  height: 120,
                  image: AssetImage('assets/images/$categoryname/$image.png'),
                ),
              ),
            ),
            ProductDetail(
              name: name,
              material: material,
              price: price,
            ),
            //Button
            Positioned(
              right: -10,
              bottom: 17,
              child: RaisedButton(
                shape: CircleBorder(),
                color: kButtonColor,
                child: Icon(
                  Icons.expand_more,
                  color: kOrangeColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.orange[200],
                    context: context,
                    builder: (context) => ProductBottomSheet(
                      image: image,
                      categoryname: categoryname,
                      name: name,
                      material: material,
                      price: price,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

//displays details like price name and material on product Box
class ProductDetail extends StatelessWidget {
  final String name;
  final String material;
  final double price;
  ProductDetail({this.name, this.material, this.price});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameText(
              name: name,
            ),
            MaterialText(
              material: material,
            ),
            SizedBox(
              height: 5,
            ),
            PriceText(price: price),
          ],
        ),
      ),
    );
  }
}
