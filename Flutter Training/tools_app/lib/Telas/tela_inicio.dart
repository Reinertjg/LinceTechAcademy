import 'package:flutter/material.dart';

class Telainicial extends StatelessWidget {
  const Telainicial({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 20, 70, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/lince_tech_academy.png', height: 300, width: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              // Conversor de Moedas
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Ink(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(19, 75, 176, 1),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 8),
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 1
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/moeda.png', height: 90, width: 90,),
                      Text(
                        'Conversor de moedas',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/conversorMoedas');
                },
              ),


              // Conversor de unidades
              InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  onTap: () {
                    Navigator.pushNamed(context, '/conversorUnidades');
                  },
                  child: Ink(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(19, 75, 176, 1),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5, 8),
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 1
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/regua.png', height: 90, width: 90,),
                        Text(
                          'Conversor de unidades',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

            ],
          ),
          const SizedBox(height: 35),

          // Calculadora
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child:
              Ink(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(19, 75, 176, 1),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 8),
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 1
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/calculadora2.png'),
                    Text(
                      'Calculadora',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            onTap: () {
              Navigator.pushNamed(context, '/calculadora');
            },
          ),
        ],
      ),
    );
  }
}
