import 'package:bendungan/feedback_list.dart';
import 'package:bendungan/general_page.dart';
import 'package:bendungan/login_page.dart';
import 'package:bendungan/submit_page.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Informasi Bendung',
      subtitle: 'Input data dan infomasi kondisi',
      child: Padding(
        padding: const EdgeInsets.only(top: 100, right: 25, left: 25),
        child: Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 3),
                    blurRadius: 15)
              ]),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.purple.withOpacity(0.1),
                          child: IconButton(
                            padding: EdgeInsets.all(15),
                            icon: Icon(Icons.send),
                            color: Colors.purple,
                            iconSize: 30,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            'Input Data',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 11,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue.withOpacity(0.1),
                          child: IconButton(
                            padding: EdgeInsets.all(15),
                            icon: Icon(Icons.receipt),
                            color: Colors.orange,
                            iconSize: 30,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => FeedbackListScreen()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            'Data Bendung',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 11,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 15),
              Divider(),
              SizedBox(width: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Text('Pastikan Anda terhubung dengan internet',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Padding(
//                           padding: EdgeInsets.all(8),
//                           child: Container(
//                             width: 80,
//                             height: 120,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                                 color: Colors.orange),
//                             child: Column(
//                               children: [
//                                 Material(
//                                   borderRadius: BorderRadius.circular(100),
//                                   color: Colors.purple.withOpacity(0.1),
//                                   child: IconButton(
//                                     padding: EdgeInsets.all(15),
//                                     icon: Icon(Icons.send),
//                                     color: Colors.purple,
//                                     iconSize: 30,
//                                     onPressed: () {
//                                       Navigator.of(context).pushReplacement(
//                                         MaterialPageRoute(
//                                             builder: (context) => LoginPage()),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 24),
//                                   child: Text(
//                                     'Input Data',
//                                     style: GoogleFonts.poppins(
//                                       color: Colors.black,
//                                       fontSize: 11,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
