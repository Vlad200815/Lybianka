part of 'is_seen_cubit.dart';

class IsSeenState extends Equatable {
  const IsSeenState({required this.route});

  final String route;

  @override
  List<Object> get props => [route];
}
