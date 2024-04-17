import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AlertDetails extends StatefulWidget {
  const AlertDetails({super.key, required this.alert});
  final Map<String, dynamic> alert;

  @override
  State<AlertDetails> createState() => _AlertDetailsState();
}

class _AlertDetailsState extends State<AlertDetails> {
  @override
  Widget build(BuildContext context) {
    //reference the alert passed.
    var alert = widget.alert;
    return Scaffold(
      appBar: AppBar(
        title: Text(alert['title']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyChart(title: alert['title']),
            ],
          ),
        )),
    );
  }
}





class MyChart extends StatefulWidget {

  final String title;

  const MyChart({super.key, required this.title});


  @override
  State<StatefulWidget> createState() => _Chart();
}

class _Chart extends State {
  int touchedIndex = 0;

  //TODO:: data from api will be here
  final Map<String, double> dataMap = {
    "Male": 4800, 
    "Female": 5200,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          const Text(
            '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: PieChart(
              PieChartData(
                // pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                //   setState(() {
                //     if (pieTouchResponse.touchInput is FlLongPressEnd ||
                //         pieTouchResponse.touchInput is FlPanEnd) {
                //       touchedIndex = -1;
                //     } else {
                //       touchedIndex = pieTouchResponse.touchedSectionIndex;
                //     }
                //   });
                // }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return dataMap.entries.map((entry) {
      final isTouched = dataMap.keys.toList().indexOf(entry.key) == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      final double widgetSize = isTouched ? 55 : 40;

      return PieChartSectionData(
        color: entry.key == "Male" ? Colors.blue : Colors.pink,
        value: entry.value,
        title: '${entry.value}',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
        badgeWidget: _Badge(
          entry.key == "Male" ? 'assets/male.png' : 'assets/female.png',
          size: widgetSize,
          borderColor: entry.key == "Male" ? Colors.blue : Colors.pink,
        ),
        badgePositionPercentageOffset: .98,
      );
    }).toList();
  }
}

class _Badge extends StatelessWidget {
  final String assetName;
  final double size;
  final Color borderColor;

  const _Badge(
    this.assetName, {
required this.size, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
        image: DecorationImage(image: AssetImage(assetName), fit: BoxFit.fill),
      ),
    );
  }
}
