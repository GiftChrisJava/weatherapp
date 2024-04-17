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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.alert['title']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:4.0, top:15, right:4),
          child: MyChart(),
        ),
      ),
    );
  }
}

class MyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 5500,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipPadding: const EdgeInsets.all(0),
                tooltipMargin: 8,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    rod.fromY.round().toString(),
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                ),
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: barGroups(),
          ),
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Male';
        break;
      case 1:
        text = 'Female';
        break;
      default:
        return Container();
    }
    return Text(text, style: style);
  }

  List<BarChartGroupData> barGroups() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: 4800, color: Colors.blue)],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [BarChartRodData(toY: 5200, color: Colors.pink)],
        showingTooltipIndicators: [0],
      ),
    ];
  }
}







// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class AlertDetails extends StatefulWidget {
//   const AlertDetails({super.key, required this.alert});
//   final Map<String, dynamic> alert;

//   @override
//   State<AlertDetails> createState() => _AlertDetailsState();
// }

// class _AlertDetailsState extends State<AlertDetails> {
//   @override
//   Widget build(BuildContext context) {
//     //reference the alert passed.
//     var alert = widget.alert;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(alert['title']),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//           child: Padding(
//         padding: EdgeInsets.all(4.0),
//         child: MyChart(title: alert['title']),
//       )),
//     );
//   }
// }



// class MyChart extends StatefulWidget {
//   final String title;

//   const MyChart({super.key, required this.title});

//   @override
//   State<StatefulWidget> createState() => _Chart();
// }

// class _Chart extends State<MyChart> {
//   int touchedIndex = 0;

//   final Map<String, double> dataMap = {
//     "Male": 4800,
//     "Female": 5200,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container( // Added Container to provide size constraints
//         height: 300, // Example fixed height, adjust as needed
//         child: Column(
//           children: <Widget>[
//             const SizedBox(
//               height: 18,
//             ),
//             Text(
//               widget.title, // Use the widget.title
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             Expanded(
//               child: PieChart(
//                 PieChartData(
//                   borderData: FlBorderData(
//                     show: false,
//                   ),
//                   sectionsSpace: 0,
//                   centerSpaceRadius: 40,
//                   sections: showingSections(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
  
//     List<PieChartSectionData> showingSections() {
//     return dataMap.entries.map((entry) {
//       final isTouched =
//           dataMap.keys.toList().indexOf(entry.key) == touchedIndex;
//       final double fontSize = isTouched ? 25 : 16;
//       final double radius = isTouched ? 60 : 50;
//       final double widgetSize = isTouched ? 55 : 40;

//       return PieChartSectionData(
//         color: entry.key == "Male" ? Colors.blue : Colors.pink,
//         value: entry.value,
//         title: '${entry.value}',
//         radius: radius,
//         titleStyle: TextStyle(
//             fontSize: fontSize,
//             fontWeight: FontWeight.bold,
//             color: const Color(0xffffffff)),
//         badgeWidget: _Badge(
//           entry.key == "Male" ? 'assets/male.png' : 'assets/female.png',
//           size: widgetSize,
//           borderColor: entry.key == "Male" ? Colors.blue : Colors.pink,
//         ),
//         badgePositionPercentageOffset: .98,
//       );
//     }).toList();
//   }

// }


// // class MyChart extends StatefulWidget {
// //   final String title;

// //   const MyChart({super.key, required this.title});

// //   @override
// //   State<StatefulWidget> createState() => _Chart();
// // }

// // class _Chart extends State {
// //   int touchedIndex = 0;

// //   //TODO:: data from api will be here
// //   final Map<String, double> dataMap = {
// //     "Male": 4800,
// //     "Female": 5200,
// //   };

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: <Widget>[
// //         const SizedBox(
// //           height: 18,
// //         ),
// //         const Text(
// //           '',
// //           style: TextStyle(
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         const SizedBox(
// //           height: 32,
// //         ),
// //         Expanded(
// //           child: PieChart(
// //             PieChartData(
             
// //               borderData: FlBorderData(
// //                 show: false,
// //               ),
// //               sectionsSpace: 0,
// //               centerSpaceRadius: 40,
// //               sections: showingSections(),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   List<PieChartSectionData> showingSections() {
// //     return dataMap.entries.map((entry) {
// //       final isTouched =
// //           dataMap.keys.toList().indexOf(entry.key) == touchedIndex;
// //       final double fontSize = isTouched ? 25 : 16;
// //       final double radius = isTouched ? 60 : 50;
// //       final double widgetSize = isTouched ? 55 : 40;

// //       return PieChartSectionData(
// //         color: entry.key == "Male" ? Colors.blue : Colors.pink,
// //         value: entry.value,
// //         title: '${entry.value}',
// //         radius: radius,
// //         titleStyle: TextStyle(
// //             fontSize: fontSize,
// //             fontWeight: FontWeight.bold,
// //             color: const Color(0xffffffff)),
// //         badgeWidget: _Badge(
// //           entry.key == "Male" ? 'assets/male.png' : 'assets/female.png',
// //           size: widgetSize,
// //           borderColor: entry.key == "Male" ? Colors.blue : Colors.pink,
// //         ),
// //         badgePositionPercentageOffset: .98,
// //       );
// //     }).toList();
// //   }
// // }

// // class _Badge extends StatelessWidget {
// //   final String assetName;
// //   final double size;
// //   final Color borderColor;

// //   const _Badge(this.assetName, {required this.size, required this.borderColor});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: size,
// //       height: size,
// //       decoration: BoxDecoration(
// //         shape: BoxShape.circle,
// //         border: Border.all(color: borderColor, width: 2),
// //         image: DecorationImage(image: AssetImage(assetName), fit: BoxFit.fill),
// //       ),
// //     );
// //   }
// // }
