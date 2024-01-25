import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/day_wise_expense_model.dart';

class StatsPage extends StatefulWidget {
  List<DayWiseExpenseModel> mData = [];

  StatsPage({super.key, required this.mData});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  List<BarChartGroupData> chartData = [];

  @override
  void initState() {
    super.initState();

    for(int i=0; i<widget.mData.length; i++){
      chartData.add(BarChartGroupData(x: i,

      barRods: [
        BarChartRodData(toY: double.parse(widget.mData[i].amt),color: Colors.grey[700],borderRadius: BorderRadius.circular(5),width: 25,  )
      ]
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: BarChart(

                BarChartData(
                  // extraLinesData: ,
                  barGroups: chartData,
                  maxY: 10000,
                  minY: 0,

                  gridData: FlGridData(show: false,),
                  titlesData: FlTitlesData(
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
                swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
            ),
          ],
        ),
      ),
    );
  }
}
