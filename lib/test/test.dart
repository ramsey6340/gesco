import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gesco/constantes.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

import '../providers/log_up_current_page_provider.dart';
import '../widgets/bezier_painter.dart';


const kTileHeight = 50.0;

const completeColor = kPrimaryColor;
const inProgressColor =Color(0xff5e6172);
const todoColor = Color(0xffd1d2d7);

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {




  @override
  Widget build(BuildContext context) {
    final logUpCurrentPageProvider = Provider.of<LogUpCurrentPageProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Process Timeline'),
      ),
      body: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(
            space: 30.0,
            thickness: 5.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / logUpCurrentPageProvider.lengthLogUpPages,
          indicatorBuilder: (_, index) {
            var color;
            var child;
            if (index == logUpCurrentPageProvider.currentPageIndex) {
              color = inProgressColor;
              child = Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: Center(child: Text(logUpCurrentPageProvider.currentPageIndex.toString(),
                    style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
              );
            } else if (index < logUpCurrentPageProvider.currentPageIndex) {
              color = completeColor;
              child = Icon(
                Icons.check,
                color: Colors.white,
                size: 15.0,
              );
            } else {
              color = todoColor;
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
                logUpCurrentPageProvider.setStepColor(index - 1);
                final prevColor = logUpCurrentPageProvider.stepColor;
                logUpCurrentPageProvider.setStepColor(index);
                final color = logUpCurrentPageProvider.stepColor;
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
                logUpCurrentPageProvider.setStepColor(index);
                return SolidLineConnector(
                  color: logUpCurrentPageProvider.stepColor,
                );
              }
            } else {
              return null;
            }
          },
          itemCount: logUpCurrentPageProvider.lengthLogUpPages,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.chevronRight),
        onPressed: () {
          logUpCurrentPageProvider.nextLogUpPage();
        },
        backgroundColor: inProgressColor,
      ),
    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component


//final _stepLength = 5;