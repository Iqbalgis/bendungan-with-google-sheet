import 'package:bendungan/controller/form_controller.dart';
import 'package:bendungan/feedback_list.dart';
import 'package:bendungan/model/form.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitPage extends StatefulWidget {
  SubmitPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //TextField Controller
  TextEditingController namaController = TextEditingController();
  TextEditingController namabendungController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController jamController = TextEditingController();
  TextEditingController limpasController = TextEditingController();
  TextEditingController debitController = TextEditingController();
  TextEditingController cuacaController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController salsupController = TextEditingController();
  TextEditingController curahhujanController = TextEditingController();
  TextEditingController kiridibukaController = TextEditingController();
  TextEditingController bmakiriController = TextEditingController();
  TextEditingController debitdropkiriController = TextEditingController();
  TextEditingController tengahdibukaController = TextEditingController();
  TextEditingController bmatengahController = TextEditingController();
  TextEditingController debitdroptengahController = TextEditingController();
  TextEditingController kanandibukaController = TextEditingController();
  TextEditingController bmakananController = TextEditingController();
  TextEditingController debitdropkananController = TextEditingController();
  TextEditingController debitlosController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          namaController.text,
          namabendungController.text,
          tanggalController.text,
          jamController.text,
          limpasController.text,
          debitController.text,
          cuacaController.text,
          statusController.text,
          salsupController.text,
          curahhujanController.text,
          kiridibukaController.text,
          bmakiriController.text,
          debitdropkiriController.text,
          tengahdibukaController.text,
          bmatengahController.text,
          debitdroptengahController.text,
          kanandibukaController.text,
          bmakananController.text,
          debitdropkananController.text,
          debitlosController.text);

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

// Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            color: "0274BC".toColor(),
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      width: double.infinity,
                      height: 70,
                      color: "0274BC".toColor(),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Masukan Data",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                              Text("Pastikan semua data sudah benar",
                                  style: GoogleFonts.poppins(
                                      color: "BCC9D4".toColor(),
                                      fontWeight: FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 24,
                      width: double.infinity,
                      color: "0274BC".toColor(),
                      child: Container(
                        height: 24,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            )),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 24, 24, 6),
                                  child: TextFormField(
                                    controller: namaController,
                                    validator: (String value) {
                                      if (value.isEmpty)
                                        return "Anda harus mengisi nama";
                                      else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Name Anda",
                                      hintText: "Masukan nama anda",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    controller: namabendungController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Masukan nama bendung dengan benar";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Nama Bendung",
                                      hintText: "Masukan nama bendung",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: tanggalController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Tanggal harus diisi";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Tanggal (01/12/2021)",
                                      hintText: "Masukan tanggal hari ini",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: jamController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "jam harus diisi";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Jam (12:30)",
                                      hintText: "Masukan jam hari ini",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: limpasController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Limpas harus diisi";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Limpas (cm)",
                                      hintText: "Masukan limpas",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: debitController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Debit harus diisi";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Debit (lt/dt)",
                                      hintText: "Masukan debit",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    controller: cuacaController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "harus diisi";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Cuaca Hari Ini",
                                      hintText: "Masukan cuaca hari ini",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    controller: statusController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Status harus diisi";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Status",
                                      hintText: "Masukan status",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: salsupController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "Sal Sup harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Sal Sup (lt/dt)",
                                      hintText: "Masukan sal sup",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: curahhujanController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "Curah hujan harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Curah Hujan (mm)",
                                      hintText: "Masukan curah hujan",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: kiridibukaController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Pintu Kiri dibuka (cm)",
                                      hintText: "Masukan pintu kiri dibuka",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: bmakiriController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "bma harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "BMA Pintu Kiri (cm)",
                                      hintText: "Masukan BMA pintu kiri",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: debitdropkiriController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText:
                                          "Debit Drop Pintu Kiri (lt/dt)",
                                      hintText:
                                          "Masukan debit drop kiri dibuka",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: tengahdibukaController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Pintu Tengah dibuka (cm)",
                                      hintText: "Masukan pintu tengah dibuka",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: bmatengahController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "BMA Tengah (cm)",
                                      hintText: "Masukan BMA ini",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: debitdroptengahController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Debit Drop Tengah (lt/dt)",
                                      hintText: "Masukan debit drop",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: kanandibukaController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Pintu Kanan dibuka (cm)",
                                      hintText: "Masukan pintu kanan dibuka",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: bmakananController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "BMA Kanan (cm)",
                                      hintText: "Masukan bma kanan",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: debitdropkananController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText:
                                          "Debit Drop Pintu Kanan (lt/dt)",
                                      hintText: "Masukan debit drop",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: debitlosController,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "harus diisi";
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Debit Los (lt/dt)",
                                      hintText: "Masukan debit los",
                                      hintStyle: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        gapPadding: 10,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        gapPadding: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 24, bottom: 24),
                                  height: 45,
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: RaisedButton(
                                    onPressed: _submitForm,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    color: "0274BC".toColor(),
                                    child: Text(
                                      'Kirim Data',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
