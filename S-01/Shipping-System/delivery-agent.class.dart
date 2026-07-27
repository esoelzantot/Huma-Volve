import 'order.class.dart';

class DeliveryAgent {
  String _name;
  Order? _order;
  double _deliveryFee = 0.0;

  DeliveryAgent(this._name);

  String get name => this._name;

  Order? get order => this._order;

  double get deliveryFee => this._deliveryFee;

  void assignOrder(Order order) => this._order = order;
}
