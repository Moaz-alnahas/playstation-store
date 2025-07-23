import 'package:playstation_store/core/model/order_model.dart';

class SessionModel {
  final DateTime startTime;
  final DateTime? endTime;
  final List<OrderModel> orders;

  SessionModel({
    required this.startTime,
    this.endTime,
    required this.orders,
  });

  Duration get duration =>
      endTime != null ? endTime!.difference(startTime) : Duration.zero;

  double calculateCost(double pricePerHourUSD, double exchangeRate) {
    final hours = duration.inMinutes / 60.0;
    return (hours * pricePerHourUSD * exchangeRate);
  }
}
