
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int location=0;
  int check = 0;
  List <String> questions = [
    "In January Earth is closest to the Sun.",
    "Electrons are larger than molecules.",
    "Spiders have six legs.",
  ];

  List<bool> answers = [true,false,false];
  List<Widget> scoreKeeper  = [];
  void checkavailability()
  {
    if(location < questions.length-1)
    {

      setState(() {
        location = location+1;
      });
    }
    else
    {
      Fluttertoast.showToast(
          msg: "You have Completed the Quiz.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }
void Reset()
  {
    setState(() {
      location=0;
      scoreKeeper.clear();
      check=0;
    });
}
void checkanswer(bool userPicked)
{

    setState(() {


     if(location < questions.length && check!= 1)
       {
         if( answers[location]== userPicked)
         {
           scoreKeeper.add(Icon(
             Icons.check,
             color: Colors.green,
           ));
         } else {
           scoreKeeper.add(Icon(
             Icons.close,
             color: Colors.red,
           ));
         }
         if(location==2){
           check=1;
         }
       }


    });


}
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: FlatButton(
            color: Colors.red,
            onPressed: Reset,
            child: Text("Reset",style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),)

          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[location],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkanswer(true);
                checkavailability();
                },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {

                checkanswer(false);
                checkavailability();
               },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
            /*Icon(Icons.check,color: Colors.green,),
            Icon(Icons.close,color: Colors.red,),*/

        )
      ],
    );
  }
}

