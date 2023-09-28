import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/mobile/home_alarms.dart';
import 'package:myapp/utils.dart';

class CreateEditAlarmScreen extends StatefulWidget {
  const CreateEditAlarmScreen({
    super.key,
  });

  @override
  State<CreateEditAlarmScreen> createState() => _CreateEditAlarmScreenState();
}

class _CreateEditAlarmScreenState extends State<CreateEditAlarmScreen> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    bool alarm1 = true;
    bool alarm2 = true;
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
                  'Crear alarma',
                  style: SafeGoogleFont(
                    'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Establecer trayecto',
              style: SafeGoogleFont(
                'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            TripCard(
              backgroundColor: Color.fromRGBO(70, 145, 153, 1),
              textColor: Colors.white,
              isExit: true,
              alarmName: 'Alarma 1',
              alarmTime: '8:25 a.m.',
              visible: alarm1,
            ),
            SizedBox(height: 20),
            Text(
              'Tipo de alarma',
              style: SafeGoogleFont(
                'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Tiempo de antelación',
                  style: SafeGoogleFont(
                    'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      '5 minutos ->',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(4, 23, 30, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: isSelected[0] || isSelected[2],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hora alarma de salida',
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      color: Color.fromRGBO(70, 145, 153, 1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time_outlined,
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  size: 45.0),
                              SizedBox(width: 10.0),
                              Text(
                                '8:25 a.m.',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Roboto',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            Visibility(
              visible: isSelected[1] || isSelected[2],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hora alarma de llegada',
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      color: Color.fromRGBO(70, 145, 153, 1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time_outlined,
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  size: 45.0),
                              SizedBox(width: 10.0),
                              Text(
                                '9:10 a.m.',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Roboto',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(40), // Ajusta el valor según desees
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomeAlarms(alarm1: isSelected[0] || isSelected[2], alarm2: isSelected[1] || isSelected[2],),
                  ),
                );
              },
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Guardar',
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

class ToggleButton extends StatelessWidget {
  final String text;

  ToggleButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 20,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final bool isExit;
  final String alarmName;
  final String alarmTime;
  final bool visible;

  const TripCard({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.isExit,
    required this.alarmName,
    required this.alarmTime,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    final bool isVisible = this.visible;
    return Visibility(
      visible: isVisible,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x599cabc2)),
                  color: Color(0x599cabc2),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/mobile/images/rectangle-bg-wKd.png',
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, color: Colors.black, size: 20.0),
                    Center(
                      child: Text(
                        'Editar trayecto',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Punto de partida:',
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 23, 30, 1),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.white, size: 20.0),
                            SizedBox(width: 2.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  '1 #18a-12',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(4, 23, 30, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Punto de llegada:',
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 23, 30, 1),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.white, size: 20.0),
                            SizedBox(width: 2.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  'Av. Calle 53',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(4, 23, 30, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hora de salida:',
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 23, 30, 1),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined,
                                color: Colors.white, size: 20.0),
                            SizedBox(width: 5.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  '8:30 a.m.',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(4, 23, 30, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hora de llegada:',
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(4, 23, 30, 1),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined,
                                color: Colors.white, size: 20.0),
                            SizedBox(width: 5.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  '9:15 a.m.',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(4, 23, 30, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
