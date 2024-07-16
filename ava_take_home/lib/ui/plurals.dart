import 'package:intl/intl.dart';

String yearsPlural(int years) => Intl.plural(
      years,
      zero: 'years',
      one: 'year',
      other: 'years',
    );

String monthsPlural(int months) => Intl.plural(
      months,
      zero: 'months',
      one: 'month',
      other: 'months',
    );
