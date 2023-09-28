import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/mobile/descargar_app_reloj.dart';
import 'package:myapp/mobile/home_alarms.dart';
import 'package:myapp/mobile/reloj.dart';
import 'package:myapp/utils.dart';

class DownloadGoogle extends StatefulWidget {
  @override
  State<DownloadGoogle> createState() => _DownloadGoogleState();
}

class _DownloadGoogleState extends State<DownloadGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TripTime',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(70, 145, 153, 1),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => DownloadAppWatch(),
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
                ],
              ),
              SizedBox(height: 200.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => WatchScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(19, 26, 18, 26),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff469199)),
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 260,
                      height: 87,
                      child: Image.asset(
                        'assets/mobile/images/image-7.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
