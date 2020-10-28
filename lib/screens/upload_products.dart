import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/models/product_class.dart';
import 'package:wickwood/widgets/login_registration/input_field.dart';
import 'package:wickwood/widgets/mainscreen/product_box.dart';
import 'start_screen.dart';

class UploadProductScreen extends StatefulWidget {
  @override
  _UploadProductScreenState createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String name;
  String material;
  String category;
  double price;
  String productId;
  File file;
  int id;
  bool seePreview = false;
  SnackBar imageSelected = SnackBar(
    content: Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 3),
      child: Text(
        'image selected',
        style: TextStyle(color: kButtonColor),
      ),
    ),
    elevation: 5,
    backgroundColor: kOrangeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
  SnackBar productUploaded = SnackBar(
    content: Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 3),
      child: Text(
        'Product Uploaded',
        style: TextStyle(color: kButtonColor),
      ),
    ),
    elevation: 5,
    backgroundColor: kOrangeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
  selectImagefromGallery() async {
    print('yoo');
    PickedFile tempfile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (tempfile != null) {
      _scaffoldKey.currentState.showSnackBar(imageSelected);
    }
    setState(() {
      file = File(tempfile.path);
    });
  }

  refreshPreview() {
    if (seePreview) {
      setState(() {
        seePreview = false;
      });
    }
    setState(() {
      seePreview = true;
    });
  }

  createProductInFirestore(String mediaUrl) async {
    productRef.doc('$category$id').set({
      'material': material,
      'category': category,
      'name': name,
      'price': price,
      'productId': '$category$id',
      'mediaUrl': mediaUrl,
      'likes': {},
    });
    idRef.doc(category).set({'id': id + 1});
    _scaffoldKey.currentState.showSnackBar(productUploaded);
  }

  Future<String> uploadImage(imagefile) async {
    StorageUploadTask uploadTask =
        storageRef.child('$category$id').putFile(imagefile);
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;

    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  handleUpload() async {
    DocumentSnapshot doc = await idRef.doc(category).get();
    id = doc['id'];
    print(id);
    String mediaUrl = await uploadImage(file);
    createProductInFirestore(mediaUrl);
    Navigator.pop(context);
  }

  Padding button({String text, Function function}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 5),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: kOrangeColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        child: GestureDetector(
          onTap: function,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: kButtonColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBrownBGColor,
      appBar: AppBar(
        title: Text('Upload Product'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    updateValue: (newvalue) {
                      name = newvalue;
                      refreshPreview();
                    },
                    labeltext: 'Product Name',
                  ),
                  InputField(
                    updateValue: (newvalue) {
                      material = newvalue;
                      refreshPreview();
                    },
                    labeltext: 'Material',
                  ),
                  InputField(
                    updateValue: (newvalue) {
                      String aaa = newvalue;
                      price = double.parse((aaa).toString());
                      refreshPreview();
                    },
                    labeltext: 'Price',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: DropdownButton(
                        underline: Container(
                          height: 1.5,
                          color: kButtonColor,
                        ),
                        dropdownColor: kOrangeColor,
                        isExpanded: true,
                        value: category,
                        style: TextStyle(
                            color: kButtonColor, fontWeight: FontWeight.w500),
                        items: <String>[
                          'chair',
                          'bed',
                          'table',
                          'cupboard',
                          'sofa'
                        ].map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (e) {
                          category = e;
                          refreshPreview();
                        }),
                  ),
                  button(
                      text: 'Select Image', function: selectImagefromGallery),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 40),
                    child: Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: ProductBox(
                          product: Product(
                              name: name,
                              material: material,
                              price: price,
                              category: category),
                        ),
                      ),
                    ),
                  ),
                  button(
                    text: 'Upload',
                    function: () => handleUpload(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
