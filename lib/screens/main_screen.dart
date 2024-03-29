import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/screens/cart_screen.dart';
import 'package:wickwood/screens/upload_products.dart';
import 'package:wickwood/screens/wishlist_screen.dart';
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
  bool isAdmin = false;

  List<ProductBox> chairList = [];
  List<ProductBox> sofaList = [];
  List<ProductBox> cupBoardList = [];
  List<ProductBox> bedList = [];
  List<ProductBox> tableList = [];

  @override
  void initState() {
    super.initState();
    getallProducts();
    if (currentUser.email == 'anasmir24@gmail.com') {
      isAdmin = true;
    }
  }

  clearallLists() {
    chairList.clear();
    bedList.clear();
    sofaList.clear();
    cupBoardList.clear();
    tableList.clear();
  }

  getallProducts() async {
    setState(() {
      isLoading = true;
    });
    clearallLists();
    QuerySnapshot snapshot = await productRef.get();
    for (var v in snapshot.docs) {
      String category = v['category'];

      ProductBox newProduct = ProductBox(
        product: Product.fromDocument(v),
      );
      if (category == 'chair') {
        chairList.add(newProduct);
      } else if (category == 'bed') {
        bedList.add(newProduct);
      } else if (category == 'sofa') {
        sofaList.add(newProduct);
      } else if (category == 'cupboard') {
        cupBoardList.add(newProduct);
      } else if (category == 'table') {
        tableList.add(newProduct);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.only(left: 13, top: 10, bottom: 5),
            child: CircleAvatar(
              backgroundColor: kButtonColor,
              backgroundImage: CachedNetworkImageProvider(currentUser.photoUrl),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  googleSignIn.signOut();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Icon(
                  Icons.logout,
                  color: kButtonColor,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, WishlistScreen.id);
                },
                child: Icon(
                  Icons.favorite,
                  color: kButtonColor,
                  size: 30,
                ),
              ),
            ),
            isAdmin
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadProductScreen(),
                          ),
                        ).then((_) => getallProducts());
                      },
                      child: Icon(
                        Icons.add,
                        color: kButtonColor,
                        size: 30,
                      ),
                    ),
                  )
                : Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
            ),
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
