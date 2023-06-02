import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LengthPage extends StatefulWidget {
  const LengthPage({Key? key}) : super(key: key);

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  String a = '0';
  String b = '0';
  String selectTop = 'Миллиметр';
  String selectBottom = 'Сантиметр';
  List values=['Миллиметр','Сантиметр','Метр','Километр'];

  buttonPressNumber(String text){

    if(a=='0'&&text!='00') {
      a=text;
    }
    else if(a!='0') {
      a+=text;
    }
    calculate();
  }
  clear(){
    if (a.length==1) {
      a='0';
    }
    else{
      a=a.substring(0,a.length-1);
    }
    calculate();
  }
  clearAll(){
    a='0';
    b='0';
  }
  buttonPressDot(){
    if(!a.contains('.')){
      a+='.';
    }
  }

  calculate(){
    //'Миллиметр','Сантиметр','Метр','Километр'
    double num1;

    num1=double.parse(a);
    switch (selectTop)
    {
      case 'Миллиметр':
        switch(selectBottom)
        {
          case 'Миллиметр':
            b=a;
            break;
          case 'Сантиметр':
            b=(num1/10).toString();
            break;
          case 'Метр':
            b=(num1/1000).toString();
            break;
          case 'Километр':
            b=(num1/1000000).toString();
            break;
        }
        break;

      case 'Сантиметр':
        switch(selectBottom)
        {
          case 'Миллиметр':
            b=(num1*10).toString();
            break;
          case 'Сантиметр':
            b=a;
            break;
          case 'Метр':
            b=(num1/100).toString();
            break;
          case 'Километр':
            b=(num1/100000).toString();
            break;
        }
        break;

      case 'Метр':
        switch(selectBottom)
        {
          case 'Миллиметр':
            b=(num1*1000).toString();
            break;
          case 'Сантиметр':
            b=(num1*100).toString();
            break;
          case 'Метр':
            b=a;
            break;
          case 'Километр':
            b=(num1/1000).toString();
            break;
        }
        break;

      case 'Километр':
        switch(selectBottom)
        {
          case 'Миллиметр':
            b=(num1*1000000).toString();
            break;
          case 'Сантиметр':
            b=(num1*100000).toString();
            break;
          case 'Метр':
            b=(num1*1000).toString();
            break;
          case 'Километр':
            b=a;
            break;
        }
        break;

    }
    if (b.endsWith('.0')){
      b=b.replaceAll('.0', '');
    }
  }
  selectSwap(){
    String swap = selectTop;
    selectTop = selectBottom;
    selectBottom = swap;
    calculate();

  }
  @override
  Widget build(BuildContext context) {
    final blueButton = ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 24,fontWeight: FontWeight.w900)),
        backgroundColor: MaterialStateProperty.all(const Color(0xFF52C9DC)),
        foregroundColor: MaterialStateProperty.all(Colors.white70),

        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.1)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
        ))
    );
    final whiteButton = ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: MaterialStateProperty.all(const Color(0xFF1E2435)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.1)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
        ))
    );
    final blueBigButton = ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: MaterialStateProperty.all(const Color(0xFF52C9DC)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.23)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
        ))
    );
    final switchButton = ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18,)),
        foregroundColor: MaterialStateProperty.all(Colors.white70),
        padding: MaterialStateProperty.all(EdgeInsets.only(right:MediaQuery.of(context).size.width*0.01)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)
        ))
    );
    return Scaffold(
        backgroundColor: const Color(0xFF1A1B28),
        appBar: AppBar(
          backgroundColor: const Color(0xFF52C9DC),
          title: const Text('Длина'),
        ),
        body: SafeArea(
          child:
          Column(
            children: [
              Expanded(
                  flex: 10,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.96,
                        height: MediaQuery.of(context).size.height*0.13,
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2435),
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.05),
                        ),
                        alignment: Alignment.centerLeft,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              style:switchButton,
                              onPressed: () {showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                    backgroundColor: const Color(0xFF1A1B28),
                                    title: const Text(style: TextStyle(color: Colors.white),'Выберите единицы'),
                                    content: SizedBox(
                                      height: MediaQuery.of(context).size.height*0.8,
                                      width: MediaQuery.of(context).size.width*0.8,
                                      child: ListView.builder(
                                        itemCount: values.length,
                                        itemBuilder: (BuildContext context, int index){
                                          return ElevatedButton(
                                              style: ElevatedButton.styleFrom(

                                                  shape: const BeveledRectangleBorder(
                                                      borderRadius :BorderRadius.zero),
                                                  padding: const EdgeInsets.all(16),
                                                  backgroundColor: const Color(0xFF1E2435)),
                                              onPressed: () {
                                                setState(() {
                                                  selectTop=values[index];
                                                  calculate();
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(values[index]));
                                        },
                                      ),
                                    )
                                );
                              });},
                              child: Text('$selectTop  >'),
                            ),
                            Text(style: const TextStyle(color: Colors.white,fontSize:20),a),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.96,
                        height: MediaQuery.of(context).size.height*0.13,
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2435),
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.05),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              style:switchButton,
                              onPressed: () {showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                    backgroundColor: const Color(0xFF1A1B28),
                                    title: const Text(style: TextStyle(color: Colors.white),'Выберите единицы'),
                                    content: SizedBox(
                                      height: MediaQuery.of(context).size.height*0.8,
                                      width: MediaQuery.of(context).size.width*0.8,
                                      child: ListView.builder(
                                        itemCount: values.length,
                                        itemBuilder: (BuildContext context, int index){
                                          return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: const BeveledRectangleBorder(
                                                      borderRadius :BorderRadius.zero),
                                                  padding: const EdgeInsets.all(16),
                                                  backgroundColor: const Color(0xFF1E2435)),
                                              onPressed: () {
                                                setState(() {
                                                  selectBottom=values[index];
                                                  calculate();
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(values[index]));
                                        },
                                      ),
                                    )
                                );
                              });},
                              child: Text('$selectBottom  >'),
                            ),
                            Text(style: const TextStyle(color: Colors.white,fontSize:20),b),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                  flex: 15,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('7');});},style: whiteButton, child: const Text('7'),),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('4');});},style: whiteButton, child: const Text('4'),),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('1');});},style: whiteButton, child: const Text('1'),),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('00');});},style: whiteButton, child: const Text('00'),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('8');});},style: whiteButton, child: const Text('8')),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('5');});},style: whiteButton, child: const Text('5')),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('2');});},style: whiteButton, child: const Text('2')),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('0');});},style: whiteButton, child: const Text('0'))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('9');});},style: whiteButton, child: const Text('9')),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('6');});},style: whiteButton, child: const Text('6')),
                          ElevatedButton(onPressed: (){setState(() {buttonPressNumber('3');});},style: whiteButton, child: const Text('3')),
                          ElevatedButton(onPressed: (){setState(() {buttonPressDot();});},style: whiteButton, child: const Text('.')),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){setState(() {clearAll();});},style: blueButton, child: const Text('AC')),
                          ElevatedButton(onPressed: (){setState(() {clear();});},style: blueButton, child: const Text('C')),
                          ElevatedButton(onPressed: (){setState(() {selectSwap();});},style: blueBigButton, child: const FaIcon(FontAwesomeIcons.rightLeft)),
                        ],
                      ),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}
