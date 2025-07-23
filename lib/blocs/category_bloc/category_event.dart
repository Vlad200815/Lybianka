part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class OnSaveCategoryEvent extends CategoryEvent {
  const OnSaveCategoryEvent({
    required this.id,
    required this.isProfit,
    required this.money,
    required this.description,
    required this.icon,
    required this.color,
    required this.date,
  });

  final String id;
  final bool isProfit;
  final double money;
  final String description;
  final String icon;
  final int color;
  final String date;

  @override
  List<Object> get props => [
    id,
    isProfit,
    money,
    icon,
    color,
    date,
    description,
  ];
}

class OnGetCategoryEvent extends CategoryEvent {}

class OnRemoveCategoryEvent extends CategoryEvent {
  final String id;

  const OnRemoveCategoryEvent({required this.id});

  @override
  List<Object> get props => [id];
}
