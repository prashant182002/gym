import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:google_fonts/google_fonts.dart';

class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Alarm Clock',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            width: 230,
            child: ListView(children: <Widget>[
        SizedBox(height: 30),
              Text(
                'Alarm',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height:40,
              ),
        Text(
            'Enter Time in 24 Hours',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
        ),
        SizedBox(
            height: 30,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(11)),
                child: Center(
                  child: TextField(
                    controller: hourController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(11)),
                child: Center(
                  child: TextField(
                    controller: minuteController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
        ),
        Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Create alarm',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                int hour;
                int minutes;
                hour = int.parse(hourController.text);
                minutes = int.parse(minuteController.text);

                // creating alarm after converting hour
                // and minute into integer
                FlutterAlarmClock.createAlarm(hour, minutes);
              },
            ),
        ),
        ElevatedButton(
            onPressed: () {
              // show alarm
              FlutterAlarmClock.showAlarms();
            },
            child: const Text(
              'Show Alarms',
              style: TextStyle(fontSize: 20.0),
            ),
        ),
        Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
                child: const Text(
                  'Create timer',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  int minutes;
                  minutes = int.parse(minuteController.text);

                  // create timer
                  FlutterAlarmClock.createTimer(minutes);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AboutDialog(
                          children: [
                            Center(
                              child: Text("Timer is set",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                            )
                          ],
                        );
                      });
                }),
        ),
        ElevatedButton(
            onPressed: () {
              // show timers
              FlutterAlarmClock.showTimers();
            },
            child: Text(
              "Show Timers",
              style: GoogleFonts.lobster(fontSize: 20),
            ),
        )
      ]),
          )),
    );
  }
}
