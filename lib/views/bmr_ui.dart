import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bmrUI extends StatefulWidget {
  const bmrUI({Key? key}) : super(key: key);

  @override
  State<bmrUI> createState() => _bmrUIState();
}

class _bmrUIState extends State<bmrUI> {
  int sexGroup = 2;
  String result = '0';

  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  TextEditingController weight_ctrl = TextEditingController();
  TextEditingController height_ctrl = TextEditingController();
  TextEditingController year_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'BMR App',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/bmr.png',
                height: 200.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FaIcon(FontAwesomeIcons.venusMars),
                    Radio(
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          sexGroup = int.parse(value.toString());
                        });
                      },
                      value: 1,
                      groupValue: sexGroup,
                    ),
                    Text(
                      'ชาย',
                    ),
                    Radio(
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          sexGroup = int.parse(value.toString());
                        });
                      },
                      value: 2,
                      groupValue: sexGroup,
                    ),
                    Text(
                      'หญืง',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      child: FaIcon(FontAwesomeIcons.weightScale),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: height_ctrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0.00',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'กิโลกรัม',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50.0,
                      child: FaIcon(FontAwesomeIcons.rulerVertical),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: weight_ctrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0.00',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'เซนติเมตร',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 0.0,
                      child: FaIcon(FontAwesomeIcons.clockRotateLeft),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: year_ctrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'ปี',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (weight_ctrl.text.isEmpty) {
                        showWarningDialog(
                            context, 'น้ำหนักห้ามว่าง และห้ามเป็น 0');
                        return;
                      } else if (height_ctrl.text.isEmpty) {
                        showWarningDialog(
                            context, 'ส่วนสูงห้ามว่าง และห้ามเป็น 0');
                      } else if (year_ctrl.text.isEmpty) {
                        showWarningDialog(
                            context, 'อายุห้ามว่าง และห้ามเป็น 0');
                      } else {
                        double mbr = 0;
                        double weight = double.parse(weight_ctrl.text);
                        double height = double.parse(height_ctrl.text);
                        double age = double.parse(year_ctrl.text);
                        if (sexGroup == 1) {
                          //ชาย BMR = 66 + (13.7 x น้ าหนัก kg.) + (5 x ส่วนสูง cm.) - (6.8 x อายุ ปี)
                          mbr =
                              66 + (13.7 * weight) + (5 * height) - (6.8 * age);
                          setState(() {
                            result = mbr.toStringAsFixed(2);
                          });
                        } else if (sexGroup == 2) {
                          //เพศหญิง BMR = 655 + (19.6 x น้ าหนัก kg.) + (1.8 x ส่วนสูง cm.) - (4.7 x อายุ ปี)
                          mbr = 655 +
                              (19.6 * weight) +
                              (1.8 * height) -
                              (4.7 * age);
                          setState(() {
                            result = mbr.toStringAsFixed(2);
                          });
                        }
                      }
                    },
                    child: Text('คำนวณ'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                      150,
                      10,
                    )),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weight_ctrl.text = '';
                        height_ctrl.text = '';
                        year_ctrl.text = '';
                        result = '';
                        sexGroup = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                      150,
                      10,
                    )),
                    child: Text(
                      'ยกเลิก',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 2.0,
                width: MediaQuery.of(context).size.width - 80.0,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '--',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '--',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
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
