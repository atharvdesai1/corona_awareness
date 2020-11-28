import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart'as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:aware/monitor//model.dart';
class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Analysis'),
        centerTitle: true,
      ),
   //   body: /*LineChartWidget()*/ /*SimpleTimeSeriesChart.withSampleData()*/,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,250,0,0),
        child: Center(
          child: Column(
            children:<Widget>[
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Body Temperature',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                onPressed: (){

                },
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  '%SpO2',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SimpleTimeSeriesChart.withSampleData()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
  //  print(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Temperature Graph'),
      ),
      body:charts.TimeSeriesChart(
          seriesList,
          animate: animate,
          dateTimeFactory: const charts.LocalDateTimeFactory(),
        ),

    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
     final DateTime now = DateTime.now();
     final DateFormat formatter = DateFormat('yyyy-MM-dd');
     final String formatted = formatter.format(now);
   // print(DateTime(2017,9,19));
    final data = [
       TimeSeriesSales(now, 5),
       TimeSeriesSales(now, 25),
       TimeSeriesSales(now, 100),
       TimeSeriesSales(now, 75),
    ];

    return [
        charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
/*
class LineChartWidget extends StatelessWidget {
  MetricStore store = MetricStore();
  convertTime(val){
    var date = DateTime.fromMillisecondsSinceEpoch(val);
    return date.toString();
  }
  @override
  Widget build(BuildContext context) {
    List<MetricRow> rows = store.fetch(0);
    print(rows[0].metric.temperature);
    //print(rows.map((e) => e.timeInMillis));
    if(rows==null){
      rows = List<MetricRow>();
    }
    List<double> myArray = [5,6,7,8];

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20,0,0),
      child: Center(
        child: Column(
          children:<Widget> [
            LineChart(
              LineChartData(
              //   minX: 0,
              //   maxX: 30,
               //  minY: 0,
               //  maxY: 6,
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                        showTitle: true,
                        titleText: 'Body Temperature(°C)',
                        textStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black87),
                        margin:0
                    ),
                    bottomTitle: AxisTitle(
                        showTitle: true,
                        margin: 0,
                        titleText: 'Time',
                        textStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black87),
                        textAlign: TextAlign.center)),
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff75729e),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    margin: 8,
                    reservedSize: 30,
                  ),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff75729e),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    getTitles: (val){
                      return convertTime(val.toInt());
                    },
                    margin: 8,
                    reservedSize: 30,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    // spots: [
                    //   FlSpot(0,3),
                    //   FlSpot(2.6,2),
                    //   FlSpot(4.9,5),
                    //   FlSpot(6.8,2.5),
                    //   FlSpot(8,4),
                    //   FlSpot(9.5,3),
                    //   FlSpot(11,4),
                    // ],
                    spots: List<FlSpot>.generate(rows.length,(i) => FlSpot(rows[i].timeInMillis.toDouble(),rows[i].metric.temperature.toDouble())),
                    isCurved: false,
                    barWidth: 5,
                    //dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
            SizedBox(height:60,),
            LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                        showTitle: true,
                        titleText: '%SpO2',
                        textStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black87),
                        margin:0
                    ),
                    bottomTitle: AxisTitle(
                        showTitle: true,
                        margin: 0,
                        titleText: 'Time',
                        textStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black87),
                        textAlign: TextAlign.center)),
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff75729e),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    margin: 8,
                    reservedSize: 30,
                  ),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                      color: Color(0xff75729e),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    margin: 8,
                    reservedSize: 30,
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0,3),
                      FlSpot(2.6,2),
                      FlSpot(4.9,5),
                      FlSpot(6.8,2.5),
                      FlSpot(8,4),
                      FlSpot(9.5,3),
                      FlSpot(11,4),
                    ],

                    isCurved: false,
                    barWidth: 5,
                    //dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
