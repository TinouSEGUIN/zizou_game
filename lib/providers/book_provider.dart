import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum ZoneSandClue{
  crabs,
  clownFish,
  baracudaFish,
  fungusFish,
  turtle,
  starFish,
  shark,
}
enum ZoneJungleClue{
snake,
flower,

}
enum ZoneMontainsClue{
  crabs,
  clownFish,
  baracudaFish,
  fungusFish,
  turtle,
  starFish,
  shark,
}


class BookProvider with ChangeNotifier {
  List<ZoneSandClue> zoneSandClue = [];
  List<ZoneJungleClue> zoneJungleClue = [];
  List<ZoneMontainsClue> zoneMontainsClue = [];
  
}