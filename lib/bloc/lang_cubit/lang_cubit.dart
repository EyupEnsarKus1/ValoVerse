import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../ui/constants/localization/localization_constants.dart';

class LangCubit extends Cubit<LangState> {
  final BuildContext context;

  LangCubit({required this.context})
      : super(LangState(locale: EasyLocalization.of(context)!.locale));

  void setEnglish() {
    if (state.locale != LocalizationConstants.enLocale) {
      final newLocale = LocalizationConstants.enLocale;
      EasyLocalization.of(context)!.setLocale(newLocale).then((value) {
        emit(LangState(locale: newLocale));
      });
    }
  }

  void setTurkish() {
    if (state.locale != LocalizationConstants.trLocale) {
      final newLocale = LocalizationConstants.trLocale;
      EasyLocalization.of(context)!.setLocale(newLocale).then((value) {
        emit(LangState(locale: newLocale));
      });
    }
  }
}

class LangState {
  final Locale locale;

  LangState({required this.locale});
}
