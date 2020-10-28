import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/start_screen.dart';

class CartProductBox extends StatefulWidget {
  final Product product;
  final double totalPrice;
  final Function function;

  CartProductBox({this.product, this.totalPrice, this.function});

  @override
  _CartProductBoxState createState() => _CartProductBoxState();
}

class _CartProductBoxState extends State<CartProductBox> {
  TextEditingController quantitycontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    quantitycontroller =
        TextEditingController(text: widget.product.quantity.toString());
  }

  changequantityinFirestore(int newquantity) {
    cartRef
        .doc(currentUser.id)
        .collection('cartitems')
        .doc(widget.product.productId)
        .update({'quantity': newquantity});
  }

  deleteproductinFirestore() {
    cartRef
        .doc(currentUser.id)
        .collection('cartitems')
        .doc(widget.product.productId)
        .delete();

    widget.function();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //image
          Container(
            height: 150,
            width: 170,
            decoration: BoxDecoration(
              color: kBrownBGColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 2),
              ],
            ),
            child: Image(
              image: CachedNetworkImageProvider(widget.product.mediaUrl),
            ),
          ),

          //name and material
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              NameText(
                name: widget.product.name,
              ),
              SizedBox(
                height: 5,
              ),
              MaterialText(
                material: widget.product.material,
              )
            ],
          ),

          //price
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PriceText(
                  price: widget.product.price,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.close,
                      color: kOrangeColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 40,
                        width: 36,
                        child: TextField(
                          controller: quantitycontroller,
                          maxLength: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            changequantityinFirestore(int.parse(value));
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kButtonColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  elevation: 5,
                  child: Icon(
                    Icons.delete_outline,
                    color: kOrangeColor,
                  ),
                  color: kButtonColor,
                  shape: CircleBorder(
                    side: BorderSide(color: kOrangeColor),
                  ),
                  onPressed: deleteproductinFirestore,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
