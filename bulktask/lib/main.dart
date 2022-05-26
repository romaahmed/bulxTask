import 'package:bulktask/bloc/homeBloc.dart';
import 'package:bulktask/global/constants.dart';
import 'package:bulktask/global/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(),
      child: ScreenUtilInit(
        designSize: Size(750, 1334), // iPhone 6
        allowFontScaling: false,
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: ImageWidget(
          url: 'assets/images/logo.png',
        ),
        elevation: 0,
      ),
      body: Container(
        child: BlocBuilder<HomeBloc, int>(
            builder: (BuildContext context, int state) {
          return Container(
            margin: EdgeInsets.all(16),
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Constants.mainColor,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ImageWidget(
                    url: 'assets/images/arrow.png',
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ImageWidget(
                    url: 'assets/images/star.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ImageWidget(
                      url: 'assets/images/heart.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16),
                  child: Text(
                    "Your total saving",
                    style: TextStyle(
                      color: Constants.textColor,
                      fontSize: 13,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 16),
                      child: ImageWidget(
                        url: 'assets/images/savingsIcon.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 16),
                      child: Text(
                        "$state",
                        style: TextStyle(
                          color: Constants.BoldColor,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 27, bottom: 21, right: 24),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: 200.w,
                      height: 88.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Constants.BtnColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 10, bottom: 9),
                        child: Text(
                          "Tell a friend",
                          style: TextStyle(
                              fontSize: 13, color: Constants.BoldColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
