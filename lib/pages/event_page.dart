import 'package:flutter/material.dart';

class Event_Page extends StatefulWidget {
  @override
  _Event_PageState createState() => _Event_PageState();
}
class Event {
  final String time;
  final String task;  
  final String desc;
  final bool isFinish;

  const Event(this.time,this.task,this.desc,this.isFinish);

}
final List<Event> _eventList= [

  new Event("08.00", "Falan filan işleri","Personal", true),
  
  new Event("09.00", "Job interview","Personal", true),
  
  new Event("18.00", "zırt falan ","Business", false),
  
  new Event("19.00", "Not real personal","yes", false),
  
  
]; 

class IconDecoration extends Decoration{
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;

  IconDecoration({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  }) : this.iconSize = iconSize,
  this.lineWidth = lineWidth,
  this.firstData = firstData,
  this.lastData = lastData;
  
  @override
  BoxPainter createBoxPainter([onChanged]) {
    // TODO: implement createBoxPainter
    return IconLine(
      iconSize: iconSize,
      lineWidth: lineWidth,
      firstData: firstData,
      lastData: lastData
    );
  }

}
class IconLine extends BoxPainter{
  final Paint paintLine;

  final double iconSize;
  final bool firstData;
  final bool lastData;

  IconLine({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  }) : this.iconSize = iconSize,
   this.firstData = firstData,
  this.lastData = lastData,
  paintLine = Paint()
  ..color = Colors.red
  ..strokeCap= StrokeCap.round
  ..strokeWidth= lineWidth
  ..style =PaintingStyle.stroke;
 

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    final leftOffset = Offset((iconSize / 2)+24 ,offset.dy);
    final double iconSpace = iconSize/1.5;
    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx,0.0));
    final Offset centerTop = configuration.size.centerLeft(Offset(leftOffset.dx,leftOffset.dy-iconSpace));
    
    final Offset centerBottom=configuration.size.centerLeft(Offset(leftOffset.dx,leftOffset.dy+iconSpace));
     final Offset end = configuration.size.bottomLeft(Offset(leftOffset.dx,leftOffset.dy  *2));

      if(!firstData)canvas.drawLine(top, centerTop, paintLine);
      if(!lastData)canvas.drawLine(centerBottom, end, paintLine);

  }

}


class _Event_PageState extends State<Event_Page> {
  double iconSize = 20;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left:24.0,right: 24.0),
          child: Row(
            children: <Widget>[
              Container(
              decoration: IconDecoration(
                iconSize: iconSize,
                lineWidth: 1,
                firstData: index ==0 ?? true,
                lastData: index ==_eventList.length -1 ?? true,
              ),
              child :Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        color: Color(0x2000000),
                        blurRadius: 5)
                  ],
                ),
                child: Icon(
                  _eventList[index].isFinish ? Icons.fiber_manual_record: Icons.radio_button_unchecked  ,
                  size: iconSize,
                  color: Theme.of(context).accentColor,
                ),
              )),
              Container(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(_eventList[index].time),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x2000000),
                              blurRadius: 5,
                              offset: Offset(0, 3)),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_eventList[index].task),
                        SizedBox(
                          height: 10,
                        ),
                        Text(_eventList[index].desc)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
