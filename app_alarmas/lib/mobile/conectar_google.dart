import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/mobile/cuenta_google.dart';
import 'package:myapp/mobile/home_alarms.dart';
import 'package:myapp/utils.dart';

class ConnectGoogleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Text(
              'TripTime',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
        backgroundColor: Color.fromRGBO(70, 145, 153, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeAlarms(
                          alarm1: false,
                          alarm2: false,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Conectar con Google',
                  style: SafeGoogleFont(
                    'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Elija su cuenta de Google',
              style: SafeGoogleFont(
                'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GoogleScreen(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(70, 145, 153, 1),
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromRGBO(70, 145, 153, 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: Color.fromRGBO(217, 217, 217, 1),
                            size: 45.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'correo@gmail.com',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(70, 145, 153, 1),
                  ),
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromRGBO(70, 145, 153, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          color: Color.fromRGBO(217, 217, 217, 1),
                          size: 45.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'correo2@gmail.com',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(40), // Ajusta el valor según desees
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Cuenta diferente',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
