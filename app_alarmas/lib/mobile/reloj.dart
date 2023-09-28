import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/mobile/create_edit_alarm_screen.dart';
import 'package:myapp/mobile/home_alarms.dart';
import 'package:myapp/utils.dart';

class WatchScreen extends StatefulWidget {
  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  List<bool> isSelected = [true, false, false];

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
                  'Conectar reloj',
                  style: SafeGoogleFont(
                    'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Color.fromRGBO(70, 145, 153, 1),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Crear alarma en el reloj',
              style: SafeGoogleFont(
                'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Fondo gris
                  borderRadius:
                      BorderRadius.circular(40.0), // Bordes redondeados
                ),
                child: ToggleButtons(
                  borderColor: Colors.grey[300], // Borde gris
                  selectedBorderColor: Color.fromRGBO(70, 145, 153, 1),
                  selectedColor: Colors.black,
                  splashColor: Color.fromRGBO(70, 145, 153, 1),
                  color: Colors.black,
                  fillColor: Color.fromRGBO(70, 145, 153, 1),
                  borderRadius: BorderRadius.circular(40.0),
                  children: [
                    ToggleButton('Salida'),
                    ToggleButton('Llegada'),
                    ToggleButton('Ambas'),
                  ],
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      // Cambia la selección actual
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        isSelected[buttonIndex] = buttonIndex == index;
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
              padding: EdgeInsets.fromLTRB(25, 29, 25, 22),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff469199),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 65, 15),
                    child: Text(
                      'Mi Galaxy Watch',
                      style: SafeGoogleFont(
                        'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.1725,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    padding: EdgeInsets.fromLTRB(75, 4, 74, 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff010101),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 96,
                        height: 88,
                        child: Image.asset(
                          'assets/mobile/images/imagen-de-whatsapp-2023-09-16-a-las-1728-1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(63, 0, 64, 0),
                    width: double.infinity,
                    height: 31,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          'Eliminar',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.1725,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
