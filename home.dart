import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var result = "";

Widget btn(var t){
return ElevatedButton(onPressed: () {
  setState(() {
    result = result + t;
  });
}, child: Text(t));
}

clear()
{
  setState(() {
    result = "";
  });
}

output(){
  Parser p= Parser();
  Expression exp = p.parse(result);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

setState(() {
  result = eval.toString();
});


}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         
          children: [
            Text(result, style:  TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold),),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("7"),
               btn("8"),
                btn("9"),
                 btn("/"),

            ],
            
          ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("4"),
               btn("5"),
                btn("6"),
                 btn("*"),

            ],
           ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("1"),
               btn("2"),
                btn("3"),
                 btn("-"),

            ], ),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
               btn("0"),
               btn("+"),
               ElevatedButton(onPressed: clear , child: Text("clear")),
              ElevatedButton(onPressed: output, child: Text("="))
            ],)
        ],),
      ),
    );
  }
}

