import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/mobile/create_edit_alarm_screen.dart';
import 'package:myapp/mobile/descargar_app_reloj.dart';
import 'package:myapp/utils.dart';

class HomeAlarms extends StatefulWidget {
  final bool alarm1;
  final bool alarm2;

  const HomeAlarms({super.key, required this.alarm1, required this.alarm2});

  @override
  State<HomeAlarms> createState() => _HomeAlarmsState();
}

class _HomeAlarmsState extends State<HomeAlarms> {

  @override
  Widget build(BuildContext context) {
    bool alarm1 = widget.alarm1;
    bool alarm2 = widget.alarm2;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'TripTime',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => DownloadAppWatch(),
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Conectar reloj',
                    style: GoogleFonts.roboto(
                      color: Color.fromRGBO(4, 23, 30, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            InkWell(
              onTap: () {},
              child: Container(
                width: 36,
                height: 36,
                child: Image.asset(
                  'assets/mobile/images/vector-hvf.png',
                  width: 36,
                  height: 36,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(70, 145, 153, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Visibility(
          visible: alarm1 || alarm2,
          replacement: Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'No tienes alarmas',
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 300.0),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => CreateEditAlarmScreen(),
                          ),
                        );
                      },
                      child: Center(
                        child: Icon(
                          Icons.add_circle_outlined,
                          color: Color(0xff469199),
                          size: 60.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lista de alarmas',
                style: SafeGoogleFont(
                  'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              AlarmCard(
                backgroundColor: Color.fromRGBO(70, 145, 153, 1),
                textColor: Colors.white,
                isExit: true, 
                alarmName: 'Alarma 1', 
                alarmTime: '8:25 a.m.', 
                visible: alarm1,
              ),
              SizedBox(height: 20.0),
              AlarmCard(
                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                textColor: Color.fromRGBO(4, 23, 30, 1),
                isExit: false,
                alarmName: 'Alarma 2', 
                alarmTime: '9:10 a.m.',
                visible: alarm2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlarmCard extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final bool isExit;
  final String alarmName;
  final String alarmTime;
  final bool visible;

  const AlarmCard({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.isExit, 
    required this.alarmName, 
    required this.alarmTime, required this.visible,
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
              Row(
                children: [
                  Text(
                    alarmName,
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Spacer(),
                  Switch(value: false, onChanged: ((value) {})),
                ],
              ),
              SizedBox(height: 20.0),
              Stack(
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
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 8.5, 0),
                          width: 17,
                          height: 17,
                          child: Image.asset(
                            'assets/mobile/images/vector.png',
                            width: 17,
                            height: 17,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Ver taryecto',
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
                  Padding(
                    padding: const EdgeInsets.only(left: 245, top: 70),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2.0),
                      ),
                      child: Icon(
                        Icons.share,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Text(
                    'Tipo de alarma:',
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromRGBO(4, 23, 30, 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        isExit ? 'Salida' : 'Llegada',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Tipo de antelación:',
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromRGBO(4, 23, 30, 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        '5 minutos antes',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Hora estimada de llegada:',
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromRGBO(4, 23, 30, 1),
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.0),
              Container(
                color: Color.fromRGBO(4, 23, 30, 1),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 20.0),
                  child: Text(
                    alarmTime,
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Roboto',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: isExit ? Color.fromRGBO(217, 217, 217, 1) : Color.fromRGBO(70, 145, 153, 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color:  isExit ? Color.fromRGBO(4, 23, 30, 1) : Colors.white,
                            size: 18.0,
                          ),
                          Text(
                            'Editar',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:  isExit ? Color.fromRGBO(4, 23, 30, 1) : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeAlarms(alarm1: false, alarm2: false,),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color.fromRGBO(4, 23, 30, 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            Text(
                              'Elimar',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
