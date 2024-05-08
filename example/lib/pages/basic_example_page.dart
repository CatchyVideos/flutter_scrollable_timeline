import 'package:flutter/material.dart';
import 'package:scrollable_timeline/scrollable_timeline.dart';
import '../tickers/broadcast_ticker.dart';


class BasicExamplePage extends StatefulWidget {
  @override
  _BasicExamplePageState createState() => _BasicExamplePageState();
}

class _BasicExamplePageState extends State<BasicExamplePage> {
  double? selectedTimeFromTopLine;
  double? selectedTimeFromBottomline;
  final broadcastticker = BroadcastTicker(0.0, 100.0, tstep: 0.1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ScrollableTimelineSharedDragging(
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ScrollableTimeline.withThumbnails(
                              lengthSecs: 100,
                              stepSecs: 1,
                              thumbnailProvider: ExampleThumbnailProvider(),
                              height: 120,
                              rulerOutsidePadding: 10,
                              timeStream: broadcastticker.stream, //ticker.tick(ticks: 1000
                              showCursor: true,
                              backgroundColor: Colors.lightBlue.shade50,
                              activeItemTextColor: Colors.blue.shade800,
                              itemTextColor: Colors.blue.shade300,
                              onDragEnd: (double t) {
                                print(
                                    "*FLT* drag detected for ScrollableTimelineF to target time $t");
                                broadcastticker.curt = t.roundToDouble();
                                setState(() {
                                  selectedTimeFromTopLine = t;
                                });
                              }),
                          Text(selectedTimeFromTopLine.toString()),
                          Divider(),
                          ScrollableTimeline(
                              lengthSecs: 100,
                              stepSecs: 2,
                              height: 120,
                              rulerOutsidePadding: 10,
                              timeStream: broadcastticker.stream, ////ticker2.tick(ticks: 1000
                              showCursor: true,
                              showMinutes: false,
                              backgroundColor: Colors.lightBlue.shade50,
                              activeItemTextColor: Colors.blue.shade800,
                              itemTextColor: Colors.blue.shade300,
                              onDragEnd: (double t) {
                                print(
                                    "*FLT* drag detected for ScrollableTimelineF to target time $t");
                                broadcastticker.curt = t.roundToDouble();
                                setState(() {
                                  selectedTimeFromBottomline = t;
                                });
                              }),
                          Text(selectedTimeFromBottomline.toString()),
                        ]
                    )
                )
            )
        )
    );
  }
}

class ExampleThumbnailProvider implements ThumbnailProvider {
  final assets = ["assets/icon_flutter.png", "assets/icon_flutter_solid.png", "assets/icon_flutter_dk-blue.png", "assets/icon_flutter_wht.png"];

  @override
  Image thumbnail(int seconds) {
    return Image(image: AssetImage(assets[seconds % assets.length]), fit: BoxFit.contain,);
  }

}