import 'package:clipboard/clipboard.dart';

class Question{
  static int _questionNumber = 0;

  static final List questionBank = [
    "Dhaka is the capital of Bangladesh",
    "Bangladesh is our homeland",
    "Kishoreganj is the district of Dhaka division",
  ];

  static String getQuestion(){
    return questionBank[_questionNumber];
  }

  static nextQuestion(){
    if(_questionNumber < questionBank.length-1){
      _questionNumber++;
    }
  }
  static bool isFinished(){
    if(_questionNumber >= questionBank.length-1){
      return true;
    }else{
      return false;
    }
  }


   static copyTextButton(){
    FlutterClipboard.copy(questionBank[_questionNumber]).then(( value ) => print("copied: ${questionBank[_questionNumber]}"));
  }
}

