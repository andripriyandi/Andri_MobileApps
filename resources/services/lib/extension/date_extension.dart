import 'package:dependencies/intl/intl.dart';

extension DateExtension on String {
  String toDateWithDay() => DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
      .format(DateTime.parse(this))
      .toString();

  String toDateMonthDay() =>
      DateFormat('dd MMM', 'id_ID').format(DateTime.parse(this)).toString();
}
