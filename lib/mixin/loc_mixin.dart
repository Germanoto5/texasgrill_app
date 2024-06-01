import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/loc.dart';

mixin LocMixin<T extends StatefulWidget> on State<T> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    locale = Localizations.localeOf(context);
    loc = AppLocalizations.of(context)!;
  }
}
