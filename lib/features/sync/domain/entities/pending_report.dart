import 'package:equatable/equatable.dart';

class PendingReport extends Equatable {
  final String id;
  final String type;
  final String title;
  final DateTime savedAt;

  const PendingReport({
    required this.id,
    required this.type,
    required this.title,
    required this.savedAt,
  });

  @override
  List<Object?> get props => [id, type, title, savedAt];
}
