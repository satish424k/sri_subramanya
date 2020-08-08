import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kavadi_ustav_2020/utils/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final textController = TextEditingController();
  final databaseReference = Firestore.instance;
  bool sendingDataInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xff000428), Color(0xFF004e92)],
            stops: [0.0, 0.9],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            sendingDataInProgress
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: 100, left: 20, right: 20, bottom: 20),
                        child: Text(
                          'We\'d welcome your feedback! \n\nThank you for using our App. Please let us know how we can improve your experience.',
                          style:
                              FontStyle().getRegularFontStyle(20, Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 20),
                        height: 200,
                        child: TextField(
                          controller: textController,
                          style:
                              FontStyle().getRegularFontStyle(20, Colors.white),
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Type here...',
                            labelText: 'Feedback/Suggestions',
                            labelStyle: FontStyle()
                                .getRegularFontStyle(15, Colors.white),
                            hintStyle: FontStyle()
                                .getRegularFontStyle(15, Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: Text(
                          'Submit',
                          style: FontStyle().getBoldFontStyle(20, Colors.blue),
                        ),
                        onPressed: () {
                          _sendFeedback(context);
                        },
                        color: Colors.white,
                        textColor: Colors.blue,
                        padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                        splashColor: Colors.white,
                      )
                    ],
                  ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: BackButton(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  void _sendFeedback(BuildContext context) async {
    String feedbackText = textController.text;
    String date = DateFormat.yMMMd().format(DateTime.now());

    if (textController.text.length > 0) {
      setState(() {
        sendingDataInProgress = true;
      });

      await databaseReference
          .collection("feedback")
          .document()
          .setData({'date': date, 'description': feedbackText});

      setState(() {
        sendingDataInProgress = false;
        textController.clear();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter valid input'),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
              )
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }
}
