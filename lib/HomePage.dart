import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Theme.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeController themeController = Get.find();

  DateTime selectedDate = DateTime(2024, 10, 28);

  bool isPowerActive = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: themeController.isDarkMode.value ? darkBG : lightBG,
      appBar: _appBar(context),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _backButton(context),
              const SizedBox(width: 12),
              Text(
                'MoeCellNicco',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          _ProductImage(context),
          _UReading(context),
          SizedBox(height: 20),
          _powerSnooze(context),
          SizedBox(height: 20),
          _line(),
           SizedBox(height: 20),
          _energy(context),
        ],
      ),
    ));
  }

  Widget _energy(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Energy',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontSize: 18,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2019),
                lastDate: DateTime(2029),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: Container(
              height: 38,
              width: 130,
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value ? darkBG4 : lightBG4,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.calendar_month),
                  SizedBox(width: 5),
                  Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}'),
                ],
              ),
            ),
          ),







        ],

      ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Text(
                'Consumption',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 15,
                      letterSpacing: 1.1
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '0',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 90),

            ],
          ),
    ]));
  }

  Widget _line(){
    return Container(
      height: 1,
      width: 350,
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value ?darkBG2: lightBG2,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Widget _powerSnooze(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isPowerActive = !isPowerActive;
              });
            },
            child: Container(
              height: 60,
              width: 175,
              decoration: BoxDecoration(
                color: isPowerActive
                    ? Colors.green
                    : (themeController.isDarkMode.value ? darkBG3 : lightBG3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                CupertinoIcons.power,
                color: themeController.isDarkMode.value ? lightBG : darkBG,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                // Handle the selected time
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected time: ${picked.format(context)}')),
                );
              }
            },
            child: Container(
              height: 60,
              width: 175,
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value ? darkBG4 : lightBG4,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                CupertinoIcons.clock,
                color: themeController.isDarkMode.value ? lightBG : darkBG,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Going Back'),
              content: Text('Are you sure you want to go back?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.of(context).pop();
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 32,
        width: 54,
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value ? lightBG : darkBG,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Icon(
          CupertinoIcons.back,
          color: themeController.isDarkMode.value ? darkBG : lightBG,
        ),
      ),
    );
  }

  List<Widget> _shareButton(BuildContext context) {
    return [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value ? lightBG : darkBG,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.share,
                color: themeController.isDarkMode.value ? darkBG : lightBG,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Share'),
                      content: Text('https://www.figma.com/design/XFjac6iYU9NPwowy0Ub1l5/Stromleser?node-id=3-26&node-type=instance&t=KrVisCBeMOrZUWAp-0'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Share'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: themeController.isDarkMode.value ? darkBG : lightBG,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Copy Link'),
                      content: Text('Link copied to clipboard!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ];
  }

  Widget _UReading(BuildContext context){
    return Container(
      height: 80,
      width: 360,
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value ?darkBG2: lightBG2,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Ausgang',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              '--',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ProductImage(BuildContext context){
    return Container(
      height: 255,
      width: 255,
      child: Image.asset('images/productt.png'),
    );
  }


  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: themeController.isDarkMode.value ? darkBG : lightBG,
      leading: GestureDetector(
        onTap: themeController.toggleTheme,
        child: Icon(
          themeController.isDarkMode.value ? Icons.sunny : Icons.nightlight_round,
          size: 20,
          color: themeController.isDarkMode.value ? lightBG : darkBG,
        ),
      ),
      actions: _shareButton(context),
    );
  }
}

