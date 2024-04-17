import 'package:flutter/material.dart';

class Stat {
  final int id;
  final String type;
  final int sent;
  final int given;
  final int remaining;
  final int needed;

  Stat({
    required this.id,
    required this.type,
    required this.sent,
    required this.given,
    required this.remaining,
    required this.needed,
  });
}

class Supply {
  final int id;
  final String reliefSupplied;
  final List<Stat> stats;

  Supply({
    required this.id,
    required this.reliefSupplied,
    required this.stats,
  });
}

class Area {
  final int id;
  final String areaName;
  final List<Supply> supplies;

  Area({
    required this.id,
    required this.areaName,
    required this.supplies,
  });
}

class District {
  final int id;
  final String districtName;
  final List<Area> areas;

  District({
    required this.id,
    required this.districtName,
    required this.areas,
  });
}

class TrackReliefSupplies extends StatefulWidget {
  const TrackReliefSupplies({super.key});

  @override
  State<TrackReliefSupplies> createState() => _TrackReliefSuppliesState();
}

class _TrackReliefSuppliesState extends State<TrackReliefSupplies> {
  // Create a list of districts with their respective areas and supplies
  final List<District> districts = [
    District(
      id: 1,
      districtName: "Zomba",
      areas: [
        Area(
          id: 1,
          areaName: "Chinamwali",
          supplies: [
            Supply(
              id: 1,
              reliefSupplied: "Food",
              stats: [
                Stat(
                  id: 1,
                  type: "Maize",
                  sent: 200,
                  given: 150,
                  remaining: 50,
                  needed: 0,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    District(
      id: 2,
      districtName: "Blantyre",
      areas: [
        Area(
          id: 1,
          areaName: "Ndirande",
          supplies: [
            Supply(
              id: 1,
              reliefSupplied: "Food",
              stats: [
                Stat(
                  id: 1,
                  type: "Maize",
                  sent: 100,
                  given: 100,
                  remaining: 0,
                  needed: 0,
                ),
              ],
            ),
          ],
        ),
        Area(
          id: 2,
          areaName: "Ndirande",
          supplies: [
            Supply(
              id: 2,
              reliefSupplied: "Beddings",
              stats: [
                Stat(
                  id: 1,
                  type: "Blankets",
                  sent: 50,
                  given: 50,
                  remaining: 0,
                  needed: 0,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B4A54),
        title: Text(
          "Select Area to Track Relief Supplies",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: districts.map((district) {
              return ExpansionTile(
                title: Text(district.districtName),
                children: district.areas.map((area) {
                  return ListTile(
                    title: Text(area.areaName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: area.supplies.map((supply) {
                        return Text(
                          "${supply.reliefSupplied} - ${supply.stats.map((stat) {
                            return "${stat.type}: Sent ${stat.sent}, Given ${stat.given}, Remaining ${stat.remaining}, Needed ${stat.needed}";
                          }).join(', ')}",
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TrackReliefSupplies()));
}
