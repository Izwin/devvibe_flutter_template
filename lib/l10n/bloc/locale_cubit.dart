import 'package:devvibe_template/l10n/domain/repository/locale_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  final LocaleRepository _repository;

  LocaleCubit(this._repository) : super(const Locale('en'));

  Future<void> loadLocale() async {
    final saved = await _repository.getSavedLocale();
    emit(saved);
  }

  Future<void> changeLocale(Locale locale) async {
    await _repository.saveLocale(locale);
    emit(locale);
  }
}
