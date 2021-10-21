import 'package:challenge_quiz/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge_quiz/questions.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       backgroundColor: Color(0Xffede9df),
      body: CustomWidget(),
    );
  }
}

class CustomWidget extends StatefulWidget {
  //const CustomWidget({Key? key}) : super(key: key);
  // int? Qno;
  // String? category;
  // int? str_val;
  // String? C_ans;
  // String? Inc_ans;
  // CustomWidget (this.Qno, this.category,this.str_val,this.C_ans,this.Inc_ans);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {


  //
  // late double _initial;
  // Widget _indicator(){
  //   return LinearProgressIndicator(
  //     value:_initial,
  //   );
  // }
  bool? checkAnswer;
  double statusBarValue = 0.00;
  int score = 0;
  double difficulty = 0;
  int _questionIndex =0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      //_scoreTracker = [];
      endOfQuiz = false;
    });
  }
  void _difficulty(){
setState(() {
  difficulty=questions[questions.length][difficulty];
});
  }

  @override

  Widget build(BuildContext context) {
    return Stack(
      children:[
        SafeArea(
          child: Center(
            child: PageView.builder(
                itemCount: questions.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 110,horizontal: 30),
                    child: Container(alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment:  MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // _indicator(),
                          Text("Question ${index+1} out of ${questions.length.toString()} ",style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 20,
                          ),
                          ),
                          Text(questions[index]['category'],style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 14,
                            color: Color(0xff969190),
                          ),
                          ),
                          RatingBar.builder(
                            initialRating: questions[index][difficulty]=='hard'? 3 : questions[index][difficulty]=='medium'? 2 : 1,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemSize: 25,
                            itemCount: 5,

                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              _difficulty();
                            },
                          ),


                          //
                          SizedBox(
                            height: 30,
                          ),
                          Text(questions[index]['question'],style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15.0,
                          ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      autofocus: true,

                                      onPressed: (){
                                        setState(() {
                                          statusBarValue += 0.05;
                                          score = statusBarValue.toInt();
                                          checkAnswer = true;
                                        });
                                      }, child:Text(questions[index]['correct_answer']),

                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0)
                                          )
                                        //  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          checkAnswer = false;
                                        });
                                      }, child:Text(questions[index]['incorrect_answers'][0]),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          //   shadowColor: Colors.deepPurpleAccent,
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0)
                                          )
                                        //  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      ),
                                    ),
                                  ),

                                  // ),
                                ],
                              ),SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          checkAnswer = false;
                                        });
                                      },child:Text(questions[index]['incorrect_answers'][1]),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0)
                                          )
                                        //  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      ),

                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          checkAnswer = false;
                                        });
                                      }, child:Text(questions[index]['incorrect_answers'][2]),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0)
                                          )
                                        //  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                                              Container(
                                                margin:EdgeInsets.only(top: 30),
                                                height: 30,
                                                child: ElevatedButton(onPressed: (){


                                                }, child:Text('Next Question'),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors.white,
                                                      onPrimary: Colors.black,
                                                      elevation: 10,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8.0)
                                                      )
                                                    //  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                                  ),
                                                ),
                                              ) ],
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(top:30.0),
                            child: Column(
                              children: [
                                Row(
                                    children: [
                                      Text('Score ${statusBarValue * 100}%',textAlign: TextAlign.right,),
                                      SizedBox(width: 100,),
                                      Text('Max Score 100%'),
                                    ]
                                ),

                                // Container(
                                //   width: double.infinity,
                                //   height: 40,
                                //   decoration: BoxDecoration(
                                //
                                //       borderRadius: BorderRadius.circular(10),
                                //       border: Border.all(color: Colors.black,width: 2,)
                                //   ),
                                //   margin: EdgeInsets.only(top: 5),
                                //   child: Stack(
                                //     children: [
                                //       LayoutBuilder(builder: (context,contxt){
                                //        return Container(
                                //           width: double.infinity,
                                //       //  child: ,
                                //         );
                                //       }
                                //       ),
                                //       Positioned.fill(child:
                                //       Padding(
                                //         padding: EdgeInsets.symmetric(horizontal: 20),
                                //         child: Row(
                                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             Container(
                                //               color: statusBarValue <= 0.5 ? Colors.black : Colors.green,
                                //               child:Text(
                                //                 'Progress bar',style: TextStyle(
                                //                 color: Colors.white
                                //               ),
                                //               ) ,
                                //             )
                                //
                                //           ],
                                //         ),
                                //       ),
                                //       ),
                                //
                                //
                                //
                                //     ],
                                //   ),
                                   LinearProgressIndicator(
                                    backgroundColor: Colors.grey,
                                    color: statusBarValue <= 0.5 ? Colors.black : Colors.green,
                                    minHeight: 40,

                                    value: statusBarValue,

                                  ),


                              ],
                            ),
                          ),
                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                  );
                }
            ),

          ),
        ),
      ]


    );
  }

}

