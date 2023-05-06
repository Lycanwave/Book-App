import 'package:flutter/cupertino.dart';
import 'package:vocibo/models/bookModel.dart';

class OrderListProvider with ChangeNotifier {
  // List<Bag> _orderList = [];
  Map<String, int> _orderList = {};
  double _priceOfCartItem = 0;
  int _cartItemLength = 0;
  List<Cart> _cartList = [];

  Map<String, int> get listOfCartItem => _orderList;
  double get priceOfCartItem => _priceOfCartItem;
  int get cartItemLength => _cartItemLength;
  List<Cart> get cartList => _cartList;

  void addItemToOrderList(value) {
    try {
      if (!_orderList.containsKey(value['id'])) {
        _orderList[value['id']] = 1;
      } else {
        int? temp = _orderList[value['id']];
        _orderList[value['id']] = temp! + 1;
      }

      _priceOfCartItem += value['price_in_dollar'];
      _cartItemLength++;
      CartItem();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  void removeItemFromOrderList(value) {
    try {
      _orderList[value['id']] = _orderList[value['id']]! - 1;
      _priceOfCartItem -= value['price_in_dollar'];
      _cartItemLength--;

      if (_orderList[value['id']] == 0) {
        _orderList.remove(value.id);
      }
      CartItem();
      //print(_orderList.containsKey(value['id']));
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  void CartItem() {
    List<Cart> temp = [];

    _orderList.forEach((key, value) {
      temp.add(Cart(key: key, value: value));
    });
    _cartList = temp;
    notifyListeners();
  }
}

class Cart {
  String? key;
  int? value;

  Cart({this.key, this.value});
}
