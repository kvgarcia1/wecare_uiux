import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(20.0),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Align(      
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF7B7B7B),
                        fontFamily: 'ProximaNova'
                      ),
                      children: <TextSpan>[
                        TextSpan(text: "Rehabilitation Progress", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF56AEFF), fontSize: 18, fontFamily: 'OpenSans')),
                        TextSpan(text: "\n", style: TextStyle(fontSize:5)),
                        TextSpan(text: "12 of 15",  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                      ]
                    )
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                      xValueMapper: (Data data, _) => data.date,
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
                    majorGridLines: MajorGridLines(width:0)
                  )
                )
              ),
              SizedBox(
                height: 250,
                child: SfCartesianChart(
                  title: ChartTitle(text: 'Oxygen (%)'),
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
                      xValueMapper: (Data data, _) => data.date,
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
                    majorGridLines: MajorGridLines(width:0)
                  )
                )
              ),
              SizedBox(
                height: 250,
                child: SfCartesianChart(
                  title: ChartTitle(text: 'Blood Pressure (MMHG)'),
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
                      xValueMapper: (Data data, _) => data.date,
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
                    majorGridLines: MajorGridLines(width:0)
                  )
                )
              ),
              SizedBox(
                height: 250,
                child: SfCartesianChart(
                  title: ChartTitle(text: 'Cadence (RPM)'),
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
                      xValueMapper: (Data data, _) => data.date,
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
                    majorGridLines: MajorGridLines(width:0)
                  )
                )
              ),
              SizedBox(
                height: 250,
                child: SfCartesianChart(
                  title: ChartTitle(text: 'Resistance (units)'),
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
                      xValueMapper: (Data data, _) => data.date,
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
                    majorGridLines: MajorGridLines(width:0)
                  )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Data> getChartData() {
    final List<Data> chartData = [
      Data(date:DateTime(2023, 3, 10), value:88),
      Data(date:DateTime(2023, 3, 15), value:97),
      Data(date:DateTime(2023, 3, 23), value:92),
      Data(date:DateTime(2023, 3, 27), value:78),
      Data(date:DateTime(2023, 4, 3), value:85),
      Data(date:DateTime(2023, 4, 10), value:90)
    ];
    return chartData;
  }
}

class Data{
  final DateTime date;
  double value;
  Data({required this.date,required this.value});
}