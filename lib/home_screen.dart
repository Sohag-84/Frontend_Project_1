import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_by_flutter/color_stirings.dart';

import 'question.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Uri _url = Uri.parse('https://www.timewell.io/');

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  answerQuestion() {
    setState(() {
      if (Question.isFinished()) {
        // Alert(
        //     context: context,
        //     title: "Finished",
        //     desc: "You\'ve reached the end of the question")
        //     .show();
        Fluttertoast.showToast(msg: "List Finished");
      } else {
        Question.nextQuestion();
      }
    });
  }

   _exitDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: SizedBox(
              height: 300.h,
              width: 500,
              child: Column(
                children: [
                   Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.clear))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0.w, right: 8.w, top: 3.h, bottom: 2.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.dialog_heading_text,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 6.sp,
                                  color: Colour.text_color),
                            ),
                            Text(
                              Strings.dialog_desc_text,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 4.sp,
                                  color: Colors.blueGrey,
                                  letterSpacing: 1),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 150.h,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colour.text_color,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: const Center(
                                child: Text(
                                  Strings.dialog_button_text,
                                  style: TextStyle(color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Image.asset("images/logo.png",width: 100,height: 150,fit: BoxFit.fill,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.bg_color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/logo.png",
                    height: 100.h,
                  ),
                  InkWell(
                    onTap: _launchUrl,
                    child: Container(
                      width: 150,
                      height: 40,
                      child: const Center(
                          child: Text(
                        Strings.recod_button_text,
                        style: TextStyle(
                            color: Colour.first_text_button_color,
                            fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Colour.first_text_button_color)),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    Strings.question_heading_text,
                    style: TextStyle(color: Colour.text_color, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 500,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            Question.getQuestion(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 35,
                                color: Colour.text_color,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      Question.copyTextButton();
                      Fluttertoast.showToast(msg: "Copied Successfully");
                      _exitDialog(context);
                    },
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colour.text_color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.copy,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          const Center(
                              child: Text(
                            "Copy this question",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      answerQuestion();
                    },
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colour.text_color)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.air,
                            color: Colour.text_color,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          const Center(
                              child: Text(
                            "Try another one",
                            style: TextStyle(
                                color: Colour.text_color,
                                fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
