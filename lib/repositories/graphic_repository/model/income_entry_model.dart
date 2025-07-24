import 'package:equatable/equatable.dart';

class IncomeEntry extends Equatable {
  final DateTime date;
  final double amount;

  const IncomeEntry({required this.date, required this.amount});

  Map<String, dynamic> toJson() {
    return {"date": date.toIso8601String(), "amount": amount};
  }

  factory IncomeEntry.fromJson(Map<String, dynamic> json) {
    return IncomeEntry(
      date: DateTime.parse(json["date"]),
      amount: json["amount"],
    );
  }

  @override
  List<Object?> get props => [date, amount];
}
