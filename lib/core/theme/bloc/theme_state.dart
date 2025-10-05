import 'package:devvibe_template/core/theme/domain/entity/app_theme_mode.dart';
import 'package:equatable/equatable.dart';

class ThemeState extends Equatable{
  final AppThemeMode? themeMode;

  const ThemeState._({this.themeMode});

  factory ThemeState.initial() => ThemeState._(themeMode: AppThemeMode.system);



  ThemeState copyWith({AppThemeMode? themeMode}) {
    return ThemeState._(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [themeMode];
}