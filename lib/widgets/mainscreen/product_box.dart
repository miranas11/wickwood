import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/comment_screen.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:wickwood/widgets/mainscreen/bottom_sheet_product.dart';

class ProductBox extends StatefulWidget {
  final Product product;
  final bool isPreview;
  final File file;
  final disablebutton;
  final bool showImage;

  ProductBox(
      {this.product,
      this.showImage = true,
      this.isPreview = false,
      this.file,
      this.disablebutton = false});

  @override
  _ProductBoxState createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  bool isLiked;
  String userID = currentUser.id;

  removefromfirestorewishlist() {
    wishlistRef
        .doc(userID)
        .collection('wishlistitems')
        .doc(widget.product.productId)
        .delete();
  }

  addtofirestorewishlist() {
    wishlistRef
        .doc(userID)
        .collection('wishlistitems')
        .doc(widget.product.productId)
        .set({
      'material': widget.product.material,
      'category': widget.product.category,
      'name': widget.product.name,
      'price': widget.product.price,
      'productId': widget.product.productId,
      'mediaUrl': widget.product.mediaUrl,
      'quantity': 0,
      'likes': {},
    });
  }

  handlelikes() {
    bool _isLiked = widget.product.likes[userID] == true;
    if (_isLiked) {
      productRef.doc(widget.product.productId).update({'likes.$userID': false});
      removefromfirestorewishlist();
      setState(() {
        isLiked = false;
        widget.product.likes[userID] = false;
      });
    } else if (!_isLiked) {
      productRef.doc(widget.product.productId).update({'likes.$userID': true});
      addtofirestorewishlist();
      setState(() {
        isLiked = true;
        widget.product.likes[userID] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.isPreview
        ? isLiked = false
        : isLiked = widget.product.likes[userID] == true;
    //for the stack
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        width: 260,
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
                width: 260,
              ),
            ),
            Positioned(
              top: 3,
              right: 50,
              child: Container(
                width: 170,
                alignment: Alignment.center,
                child: widget.showImage
                    ? Image(
                        height: 120,
                        image: widget.isPreview
                            ? FileImage(widget.file)
                            : CachedNetworkImageProvider(
                                widget.product.mediaUrl),
                      )
                    : Text(''),
              ),
            ),
            ProductDetail(
              product: widget.product,
            ),
            //see detail button
            Positioned(
              right: -10,
              bottom: 10,
              child: Buttons(
                icons: Icon(
                  Icons.expand_more,
                  color: kOrangeColor,
                ),
                function: () {
                  !widget.disablebutton
                      ? showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.orange[200],
                          context: context,
                          builder: (context) => ProductBottomSheet(
                            product: widget.product,
                          ),
                        )
                      : print('');
                },
              ),
            ),
            //like button
            Positioned(
              right: 35,
              bottom: 10,
              child: Buttons(
                icons: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : kOrangeColor,
                ),
                function: () {
                  !widget.disablebutton ? handlelikes() : print('');
                },
              ),
            ),
            //comment button
            Positioned(
              right: 80,
              bottom: 10,
              child: Buttons(
                icons: Icon(
                  Icons.message,
                  color: kOrangeColor,
                ),
                function: () {
                  !widget.disablebutton
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentScreen(
                              productId: widget.product.productId,
                            ),
                          ),
                        )
                      : print('');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final Function function;
  final Icon icons;
  Buttons({this.function, this.icons});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: CircleBorder(),
      color: kButtonColor,
      child: icons,
      onPressed: function,
    );
  }
}

//displays details like price name and material on product Box
class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({this.product});
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
              name: product.name,
            ),
            MaterialText(
              material: product.material,
            ),
            SizedBox(
              height: 5,
            ),
            PriceText(price: product.price),
          ],
        ),
      ),
    );
  }
}
