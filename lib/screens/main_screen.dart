import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/cart_screen.dart';
import 'package:wickwood/screens/upload_products.dart';
import 'package:wickwood/widgets/mainscreen/product_box.dart';
import 'package:wickwood/widgets/mainscreen/slogan.dart';
import 'package:wickwood/widgets/mainscreen/categorywidget.dart';
import 'start_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = true;

  List<ProductBox> chairList = [];
  List<ProductBox> sofaList = [];
  List<ProductBox> cupBoardList = [];
  List<ProductBox> bedList = [];
  List<ProductBox> tableList = [];

  @override
  void initState() {
    super.initState();
    getallProducts();
  }

  getallProducts() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot snapshot = await productRef.get();
    for (var v in snapshot.docs) {
      String category = v['category'];

      ProductBox newProduct = ProductBox(
        product: Product.fromDocument(v),
      );
      if (category == 'chair') {
        chairList.add(newProduct);
      } else if (category == 'bed') {
        chairList.add(newProduct);
      } else if (category == 'sofa') {
        sofaList.add(newProduct);
      } else if (category == 'cupboard') {
        cupBoardList.add(newProduct);
      } else if (category == 'table') {
        cupBoardList.add(newProduct);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: FlatButton(
          padding: EdgeInsets.only(left: 10),
          onPressed: null,
          child: CircleAvatar(
            backgroundColor: kButtonColor,
            child: Image(
              height: 30,
              image: AssetImage('assets/images/usericon.png'),
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UploadProductScreen()));
            },
            child: Icon(
              Icons.add,
              color: kButtonColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CartScreen.id);
              },
              child: Icon(
                Icons.shopping_cart,
                color: kButtonColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
      backgroundColor: kBrownBGColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Slogan(),
            isLoading
                ? Expanded(
                    child: Center(
                      child: SpinKitRipple(
                        size: 100,
                        color: kButtonColor,
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      child: ListView(
                        children: <Widget>[
                          CategoryWidget(
                            image: 'chair',
                            text: 'Chairs',
                          ),
                          ProductList(list: chairList),
                          CategoryWidget(
                            image: 'sofa',
                            text: 'Sofas',
                          ),
                          ProductList(
                            list: sofaList,
                          ),
                          CategoryWidget(
                            image: 'cupboard',
                            text: 'Cupboards',
                          ),
                          ProductList(list: cupBoardList),
                          CategoryWidget(
                            image: 'bed',
                            text: 'Beds',
                          ),
                          ProductList(list: bedList),
                          CategoryWidget(
                            image: 'table',
                            text: 'Tables',
                          ),
                          ProductList(list: tableList),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<ProductBox> list;

  ProductList({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: list,
      ),
    );
  }
}
