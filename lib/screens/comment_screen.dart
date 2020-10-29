import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wickwood/components/constants.dart';
import 'package:wickwood/screens/start_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentScreen extends StatefulWidget {
  final String productId;
  CommentScreen({this.productId});
  @override
  _CommentScreenState createState() =>
      _CommentScreenState(productId: this.productId);
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentController = TextEditingController();
  final String productId;
  bool isLoading = false;

  _CommentScreenState({this.productId});

  buildComments() {
    return StreamBuilder(
      stream: commentRef
          .doc(productId)
          .collection('comments')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SpinKitRipple(
              size: 100,
              color: kButtonColor,
            ),
          );
        }
        List<Comment> allcomments = [];
        snapshot.data.docs.forEach((doc) {
          allcomments.add(Comment.fromDocument(doc));
        });

        return ListView(
          children: allcomments,
        );
      },
    );
  }

  addComment() {
    commentRef.doc(productId).collection('comments').add({
      'avatarUrl': currentUser.photoUrl,
      'comment': commentController.text,
      'timestamp': timestamp,
      'userId': currentUser.id,
      'displayname': currentUser.displayName,
    });

    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: buildComments(),
          ),
          Divider(
            height: 1,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: ListTile(
                visualDensity: VisualDensity(horizontal: -4.0),
                title: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: commentController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Enter a comment',
                    labelStyle: TextStyle(color: kButtonColor),
                  ),
                ),
                trailing: OutlineButton(
                  onPressed: addComment,
                  child: Icon(
                    Icons.send,
                    color: kButtonColor,
                    size: 30,
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String comment;
  final String displayname;
  final Timestamp timestamp;
  final String avatarUrl;
  Comment({this.comment, this.displayname, this.timestamp, this.avatarUrl});

  factory Comment.fromDocument(DocumentSnapshot doc) {
    return Comment(
      comment: doc['comment'],
      displayname: doc['displayname'],
      timestamp: doc['timestamp'],
      avatarUrl: doc['avatarUrl'],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 8, 0),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kBrownBGColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(avatarUrl),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 3, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LimitedBox(
                    maxWidth: 330,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayname,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            comment,
                            softWrap: true,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      timeago.format(timestamp.toDate()),
                      style: TextStyle(
                          color: kButtonColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
