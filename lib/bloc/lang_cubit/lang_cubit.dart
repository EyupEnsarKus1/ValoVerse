import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LangCubit extends Cubit<LangState> {
  final BuildContext context;

  LangCubit({required this.context})
      : super(LangState(locale: EasyLocalization.of(context)!.locale));

  setLang(Locale newLocale) {
    if (state.locale != newLocale) {
      EasyLocalization.of(context)!.setLocale(newLocale);
      emit(LangState(locale: newLocale));
      final engine = WidgetsFlutterBinding.ensureInitialized();
      engine.performReassemble();
    }
  }
}

class LangState {
  final Locale locale;

  LangState({required this.locale});
}
