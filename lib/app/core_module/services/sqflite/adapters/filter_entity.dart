import 'package:equatable/equatable.dart';

class FilterEntity extends Equatable {
  final String name;
  final dynamic value;
  final FilterType type;

  const FilterEntity({
    required this.name,
    required this.value,
    required this.type,
  });

  @override
  List<Object?> get props => [name, value, type];
}

enum FilterType { equal, containing }
