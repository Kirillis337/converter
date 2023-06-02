import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button =ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.5, MediaQuery.of(context).size.height*0.2)),
    );
    return Scaffold(
      backgroundColor: const Color(0xFF1A1B28),
      appBar: AppBar(
        backgroundColor: const Color(0xFF52C9DC),
        title: const Text('lab 2 - Converter'),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: (){Navigator.pushNamed(context, '/temperature');},
                        style: button,
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                              FaIcon(FontAwesomeIcons.temperatureFull),
                              Text('Температура')
                            ]
                        )

                    ),
                    TextButton(
                        onPressed: (){Navigator.pushNamed(context, '/speed');},
                        style: button,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const[
                              FaIcon(FontAwesomeIcons.gaugeHigh),
                              Text('Скорость')
                            ]
                        )

                    ),
                    TextButton(
                        onPressed: (){Navigator.pushNamed(context, '/length');},
                        style: button,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                              FaIcon(FontAwesomeIcons.ruler),
                              Text('Длина')
                            ]
                        )

                    ),
                  ],
                ),

                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      TextButton(
                          onPressed: (){Navigator.pushNamed(context, '/area');},
                          style: button,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                                FaIcon(FontAwesomeIcons.square),
                                Text('Площадь')
                              ]
                          )

                      ),
                      TextButton(
                          onPressed: (){Navigator.pushNamed(context, '/mass');},
                          style: button,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                                FaIcon(FontAwesomeIcons.weightHanging),
                                Text('Масса')
                              ]
                          )

                      ),

                    ]
                )
          ],
        ),

    ),

    );
  }
}
