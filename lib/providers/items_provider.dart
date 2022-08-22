import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class ItemProvider with ChangeNotifier {
  late bool _asFoundedCoupeCoupe;
  late bool _asFoundedRope;
  late bool _asFoundedFire;

  ItemProvider() {
    _asFoundedCoupeCoupe = false;
    _asFoundedRope = false;
    _asFoundedFire = false;
  }

  void setCoupeCoupe(bool founded) {
    if (_asFoundedCoupeCoupe == false) {
      _asFoundedCoupeCoupe = true;
      notifyListeners();
    }
  }

  void setFoundedRope(bool founded) {
    if (_asFoundedRope == false) {
      _asFoundedRope = true;
      notifyListeners();
    }
  }

  void setFoundedFire(bool founded) {
    if (_asFoundedFire == false) {
      _asFoundedFire = true;
      notifyListeners();
    }
  }
  void toggleCoupeCoupe() {
    _asFoundedCoupeCoupe = !_asFoundedCoupeCoupe;
      notifyListeners();
    
  }

  void toggleFoundedRope() {
    _asFoundedRope = !_asFoundedRope;
      notifyListeners();
    
  }

  void toggleFoundedFire() {
    _asFoundedFire = !_asFoundedFire;
      notifyListeners();
    
  }

  get FoudedCoupeCoupe {
    return _asFoundedCoupeCoupe;
  }

  get FoudedRope {
    return _asFoundedRope;
  }

  get FoudedFire {
    return _asFoundedFire;
  }

  void reset() {
    _asFoundedCoupeCoupe = false;
    _asFoundedRope = false;
    _asFoundedFire = false;
  }
}
