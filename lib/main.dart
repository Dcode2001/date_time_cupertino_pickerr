import 'package:flutter/material.dart';

void main()
{
      runApp(MaterialApp(home: demo(),));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {

  String curDate = "";
  String curTime = "";

  @override
  void initState() {
    super.initState();

    curDate = DateTime.now().toString();
    curTime = TimeOfDay.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DatePicker , TimePicker , CupertinoPicker"),),

       body: Scaffold(
          appBar: AppBar(
            title: Text("Date_Picker & Time_Picker"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                      )
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            curDate = value.toString();
                          });
                        }
                      });
                    },
                    child: Text("${curDate}")),
                SizedBox(height: 25),
                ElevatedButton(
                    onPressed: () {
                      showTimePicker(
                          initialEntryMode: TimePickerEntryMode.input,
                          context: context,
                          initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            curTime = value.toString();
                          });
                        }
                      });
                    },
                    child: Text("${curTime}")),
                SizedBox(height: 25),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          builder: (context) {
                            return SimpleDialog(children: [
                              Container(
                                height: 160,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (value) {
                                    SystemSound.play(SystemSoundType.click);  // Tap Karvathi Sound aave iphone ni jem
                                    print(value);
                                  },
                                ),
                              ),
                            ]);
                          },
                          context: context);
                    },
                    child: Text("Curpiteno Time"))
              ],
            ),
          ),
        );
    );
  }
}
