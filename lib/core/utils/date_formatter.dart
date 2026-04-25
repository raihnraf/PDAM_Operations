import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }

  static String formatDateWithTime(DateTime date) {
    return DateFormat('dd MMM yyyy, HH:mm', 'id_ID').format(date);
  }

  static String formatRelative(DateTime savedAt) {
    final now = DateTime.now();
    final diff = now.difference(savedAt);

    if (diff.inDays == 0) {
      final hour = savedAt.hour.toString().padLeft(2, '0');
      final minute = savedAt.minute.toString().padLeft(2, '0');
      return 'Hari ini, $hour:$minute';
    } else if (diff.inDays == 1) {
      final hour = savedAt.hour.toString().padLeft(2, '0');
      final minute = savedAt.minute.toString().padLeft(2, '0');
      return 'Kemarin, $hour:$minute';
    } else {
      return formatDateWithTime(savedAt);
    }
  }
}
