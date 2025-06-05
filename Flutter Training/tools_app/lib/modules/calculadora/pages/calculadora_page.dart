import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Calculadora',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 20, 70, 1),
      ),
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        // Container Branco
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.width * 1.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Display da Calculadora
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Wrap(
                spacing: 6,
                runSpacing: 8,
                children: [
                  buildTecla('AC', width: 165),
                  buildTecla('%'),
                  buildTecla('÷'),
                  buildTecla('7'),
                  buildTecla('8'),
                  buildTecla('9'),
                  buildTecla('×'),
                  buildTecla('4'),
                  buildTecla('5'),
                  buildTecla('6'),
                  buildTecla('-'),
                  buildTecla('1'),
                  buildTecla('2'),
                  buildTecla('3'),
                  buildTecla('+'),
                  buildTecla('0', width: 165),
                  buildTecla('.'),
                  buildTecla('='),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTecla(String label, {double width = 80}) {
    return Container(
      width: width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color.fromRGBO(19, 75, 176, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child:
      Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


