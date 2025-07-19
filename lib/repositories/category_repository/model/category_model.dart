class Category {
  Category({
    required this.isProfit,
    required this.money,
    required this.icon,
    required this.color,
    required this.date,
  });

  bool isProfit;
  double money;
  String icon;
  int color;
  String date;

  Map<String, dynamic> toJson() => {
    "isProfit": isProfit,
    "money": money,
    "icon": icon,
    "color": color,
    "date": date,
  };

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    isProfit: json["isProfit"],
    money: json["money"],
    icon: json["icon"],
    color: json["color"],
    date: json["date"],
  );
}
