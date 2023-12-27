import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spacer/flutter_spacer.dart';
import 'package:gesco/constantes.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

import '../../../providers/log_up_current_page_provider.dart';
import '../../../widgets/bezier_painter.dart';

class LogUpScreen extends StatefulWidget {
  static const routeName = 'log_up_screen';
  const LogUpScreen({super.key});

  @override
  State<LogUpScreen> createState() => _LogUpScreenState();
}

class _LogUpScreenState extends State<LogUpScreen> {

  /*int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return kInProgressColor;
    } else if (index < _processIndex) {
      return kCompleteColor;
    } else {
      return kTodoColor;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    //final logUpCurrentPageProvider = Provider.of<LogUpCurrentPageProvider>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/bg4.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Consumer(builder: (context, LogUpCurrentPageProvider logUpCurrentPageProvider, child) {
          return Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: MediaQuery.sizeOf(context).height * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(0.1),),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 50,
                    child: Timeline.tileBuilder(
                      theme: TimelineThemeData(
                        direction: Axis.horizontal,
                        connectorTheme: ConnectorThemeData(
                          space: 10.0,
                          thickness: 5.0,
                        ),
                      ),
                      builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        itemExtentBuilder: (_, __) => (MediaQuery.of(context).size.width*0.5) / logUpCurrentPageProvider.lengthLogUpPages,
                        indicatorBuilder: (_, index) {
                          var color;
                          var child;
                          if (index == logUpCurrentPageProvider.currentPageIndex) {
                            color = kInProgressColor;
                            child = Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: Center(child: Text(logUpCurrentPageProvider.currentPageIndex.toString(),
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                            );
                          } else if (index < logUpCurrentPageProvider.currentPageIndex) {
                            color = kCompleteColor;
                            child = Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15.0,
                            );
                          } else {
                            color = kTodoColor;
                          }

                          if (index <= logUpCurrentPageProvider.currentPageIndex) {
                            return Stack(
                              children: [
                                CustomPaint(
                                  size: Size(30.0, 30.0),
                                  painter: BezierPainter(
                                    color: color,
                                    drawStart: index > 0,
                                    drawEnd: index < logUpCurrentPageProvider.currentPageIndex,
                                  ),
                                ),
                                DotIndicator(
                                  size: 30.0,
                                  color: color,
                                  child: child,
                                ),
                              ],
                            );
                          } else {
                            return Stack(
                              children: [
                                CustomPaint(
                                  size: Size(15.0, 15.0),
                                  painter: BezierPainter(
                                    color: color,
                                    drawEnd: index < logUpCurrentPageProvider.lengthLogUpPages - 1,
                                  ),
                                ),
                                OutlinedDotIndicator(
                                  borderWidth: 4.0,
                                  color: color,
                                ),
                              ],
                            );
                          }
                        },
                        connectorBuilder: (_, index, type) {
                          if (index > 0) {
                            if (index == logUpCurrentPageProvider.currentPageIndex) {
                              int currentIndex = logUpCurrentPageProvider.currentPageIndex;
                              final prevColor = ((index - 1)==currentIndex)?kInProgressColor:((index - 1)<currentIndex)?kCompleteColor:kTodoColor;
                              final color = (index==currentIndex)?kInProgressColor:(index<currentIndex)?kCompleteColor:kTodoColor;
                              List<Color> gradientColors;
                              if (type == ConnectorType.start) {
                                gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                              } else {
                                gradientColors = [
                                  prevColor,
                                  Color.lerp(prevColor, color, 0.5)!
                                ];
                              }
                              return DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                ),
                              );
                            } else {
                              int currentIndex = logUpCurrentPageProvider.currentPageIndex;
                              return SolidLineConnector(
                                color: (index==currentIndex)?kInProgressColor:(index<currentIndex)?kCompleteColor:kTodoColor,
                              );
                            }
                          } else {
                            return null;
                          }
                        },
                        itemCount: logUpCurrentPageProvider.lengthLogUpPages,
                      ),
                    ),
                  ),
                  Text(kCreateProfileTextsList[logUpCurrentPageProvider.currentPageIndex][0],
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  Text(kCreateProfileTextsList[logUpCurrentPageProvider.currentPageIndex][1],),
                  (logUpCurrentPageProvider.currentPageIndex==1)?0.hs:kDefaultPaddingLogUpPage,
                  Expanded(child: logUpCurrentPageProvider.currentPage)
                ]
              ),
            ),
          );
        }),
      ),
    );
  }
}
