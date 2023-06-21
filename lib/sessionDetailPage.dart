import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

class SessionDetailPage extends StatefulWidget{
  @override
  State<SessionDetailPage> createState() => _SessionDetailPageState();
}

class _SessionDetailPageState extends State<SessionDetailPage> {
  late List<Data> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
        enablePinching: true,
        enableDoubleTapZooming: true,
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.red,
        selectionRectBorderWidth: 2,
        selectionRectColor: Colors.grey,
        enablePanning: true,
        zoomMode: ZoomMode.x,
        enableMouseWheelZooming: true,
        maximumZoomLevel: 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('WeCaRE'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Color(0xFF7B7B7B)),
            onPressed: (){Navigator.pop(context);},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){},
            )
          ],
          backgroundColor: Color(0xFFF9F9F9),
          foregroundColor: Color(0xFF7B7B7B),
          scrolledUnderElevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Session Information", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Color(0xFF4D4D4D))),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("15 June 2023 | 10AM - 11AM", style: TextStyle(fontSize: 15, fontFamily: 'OpenSans',color: Color(0xFF7B7B7B))),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width:110,
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                          fontFamily: 'ProximaNova'
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Avg Heart Rate", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "92", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "bpm", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                        ]
                      )
                    ),
                  ),
                  Container(
                    width:110,
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                          fontFamily: 'ProximaNova'
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Avg Oxygen", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "91", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "%", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                        ]
                      )
                    ),
                  ),
                  Container(
                     width:110,
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                          fontFamily: 'ProximaNova'
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Avg Blood Pressure", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "170", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "mmHg", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                        ]
                      )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width:175,
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                          fontFamily: 'ProximaNova'
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Avg Cadence", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "71", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "rpm", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                        ]
                      )
                    ),
                  ),
                  Container(
                    width:175,
                    alignment: Alignment.topCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                          fontFamily: 'ProximaNova'
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Avg Resistance", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "6", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                          TextSpan(text: "\n"),
                          TextSpan(text: "units", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                        ]
                      )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: SfCartesianChart(
                  title: ChartTitle(text: 'Heart Rate (BPM)'),
                  legend: Legend(isVisible: false),
                  // margin: EdgeInsets.all(15),
                  // backgroundColor: Colors.blue,
                  plotAreaBorderColor: Color((0xFF56AEFF)),
                  plotAreaBackgroundColor: Colors.white,
                  tooltipBehavior: _tooltipBehavior,
                  zoomPanBehavior: _zoomPanBehavior,
                  series: <ChartSeries>[
                    LineSeries<Data, DateTime>(
                      dataSource: _chartData,
                      xValueMapper: (Data data, _) => data.time,
                      yValueMapper: (Data data, _) => data.value,
                      markerSettings: MarkerSettings(isVisible: true),
                      dataLabelSettings: DataLabelSettings(isVisible: true, textStyle: TextStyle(color: Color(0xFF7B7B7B), fontSize: 12, fontFamily: 'OpenSans', fontWeight: FontWeight.w600)),
                      enableTooltip: true,
                      color: Color(0xFF56AEFF)
                    )
                  ],
                  primaryXAxis: DateTimeAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interactiveTooltip: InteractiveTooltip(enable: false),
                    rangePadding: ChartRangePadding.round,
                    majorGridLines: MajorGridLines(width:0),
                  ),
                  primaryYAxis: NumericAxis(
                    interactiveTooltip: InteractiveTooltip(enable: false),
                    visibleMinimum: 60,
                    visibleMaximum: 110,
                    majorGridLines: MajorGridLines(width:0),
                    interval: 10
                  )
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(20.0),
                height: 205,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontFamily: 'ProximaNova'
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Therapist's Notes", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.w600, fontSize: 18)),
                      TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                      TextSpan(text: "Great progress! I am additionally recommending that you do some casual walking exercises every morning. If you are able to, please do a simple walking workout every morning when you wake up, for 10-15 minutes. We might increase the duration, or lessen it, depending on the progress of your next therapy session.",  style: TextStyle(fontFamily: 'OpenSans', fontSize: 15)),
                    ]
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<Data> getChartData() {
    final List<Data> chartData = [
      Data(time: DateTime(2023, 6, 8, 14, 30, 0), value:88),
      Data(time: DateTime(2023, 6, 8, 14, 33, 0), value:89),
      Data(time: DateTime(2023, 6, 8, 14, 38, 0), value:94),
      Data(time: DateTime(2023, 6, 8, 14, 49, 0), value:93),
      Data(time: DateTime(2023, 6, 8, 14, 56, 0), value:96),
      Data(time: DateTime(2023, 6, 8, 15, 1, 0), value:99),
      Data(time: DateTime(2023, 6, 8, 15, 14, 0), value:90),
      Data(time: DateTime(2023, 6, 8, 15, 28, 0), value:88),
      Data(time: DateTime(2023, 6, 8, 15, 40, 0), value:87),
    ];
    return chartData;
  }
}

class Data{
  final DateTime time;
  double value;
  Data({required this.time,required this.value});
}