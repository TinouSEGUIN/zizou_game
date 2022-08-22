import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


enum ZoneSandClue {
  crabs('Crabs'),
  clownFish('Clown Fish'),
  baracudaFish('Baracuda Fish'),
  fungusFish('Fungus Fish'),
  turtle('Turtle'),
  starFish('Star Fish'),
  shark('Shark');

  const ZoneSandClue(this.message);
  final String message;
}

enum ZoneJungleClue {
  snake('Snake'),
  flower('Flower'),
  coloredBird('Colored Bird'),
  mango('Mango'),
  coconuts('Coconuts'),
  banana('Banana');

  const ZoneJungleClue(this.message);
  final String message;
}

enum ZoneMontainsClue {
  eagle('Eagle'),
  bushFlowered('Bush Flowered'),
  volcanoSoil('Volcano Soil'),
  chalkySoil('Chalky Soil'),
  lynx('Lynx');

  const ZoneMontainsClue(this.message);
  final String message;
}



class BookProvider with ChangeNotifier {
  List<ZoneSandClue> zoneSandClue = [];
  List<ZoneJungleClue> zoneJungleClue = [];
  List<ZoneMontainsClue> zoneMontainsClue = [];

  Iterable<ZoneSandClue> neededSandClue = [];
  Iterable<ZoneJungleClue> neededJungleClue = [];
  Iterable<ZoneMontainsClue> neededMontainsClue = [];

  BookProvider();

  void addToSandClue(ZoneSandClue clue) {
    if (!zoneSandClue.contains(clue)) {
      zoneSandClue.add(clue);
      notifyListeners();
      print(zoneSandClue.toString());
    }
  }

  void addToJungleClue(ZoneJungleClue clue) {
    if (!zoneJungleClue.contains(clue)) {
      zoneJungleClue.add(clue);
      notifyListeners();
      print(zoneJungleClue.toString());
    }
  }

  void addToMontainsClue(ZoneMontainsClue clue) {
    if (!zoneMontainsClue.contains(clue)) {
      zoneMontainsClue.add(clue);
      notifyListeners();
      print(zoneMontainsClue.toString());
    }
  }

  void setNeededClueFromMap(int mapId) {
    // TODO set the clue from the map loaded
    //For Now let just init them at random value

    neededSandClue = [
      ZoneSandClue.crabs,
      ZoneSandClue.clownFish,
      ZoneSandClue.shark,
    ];
    neededJungleClue = [
      ZoneJungleClue.flower,
      ZoneJungleClue.banana,
      ZoneJungleClue.coloredBird,
    ];
    neededMontainsClue = [
      ZoneMontainsClue.eagle,
      ZoneMontainsClue.chalkySoil,
    ];
  }

  bool checkSandClue() {
    return zoneSandClue.every((clue) => neededSandClue.contains(clue));
  }
  bool checkJungleClue() {
    return zoneJungleClue.every((clue) => neededJungleClue.contains(clue));
  }
  bool checkMontainsClue() {
    return zoneMontainsClue.every((clue) => neededMontainsClue.contains(clue));
  }

  bool checkEndGame(){
    return checkSandClue() && checkJungleClue() && checkMontainsClue() ;
  }
  void reset(int map){
    setNeededClueFromMap(map);
  }
}
