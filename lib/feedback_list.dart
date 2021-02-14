import 'package:bendungan/controller/form_controller.dart';
import 'package:bendungan/model/form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class FeedbackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FeedbackListPage());
  }
}

class FeedbackListPage extends StatefulWidget {
  FeedbackListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  List<FeedbackForm> feedbackItem = List<FeedbackForm>();

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItem) {
      setState(() {
        this.feedbackItem = feedbackItem;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: feedbackItem.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SafeArea(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
                          height: 240,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 3),
                                    blurRadius: 15)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   "${feedbackItem[index].namabendung}",
                                //   style: GoogleFonts.poppins(
                                //       color: Colors.white, fontSize: 16),
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text("${feedbackItem[index].namabendung}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Tgl',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      SizedBox(width: 42),
                                      Text(':',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text(" ${feedbackItem[index].tanggal}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Pukul',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      SizedBox(width: 30),
                                      Text(':',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text(" ${feedbackItem[index].jam}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Cuaca',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      SizedBox(width: 21),
                                      Text(':',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text(" ${feedbackItem[index].cuaca}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Status',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      SizedBox(width: 25),
                                      Text(':',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text(" ${feedbackItem[index].status}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Debit',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      SizedBox(width: 32),
                                      Text(':',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text(" ${feedbackItem[index].debit} ",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text('lt/dt',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Limpas',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      SizedBox(width: 22),
                                      Text(':',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text(" ${feedbackItem[index].limpas} ",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                      Text('cm',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
