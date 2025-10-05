import 'package:devvibe_template/core/theme/domain/entity/app_theme_mode.dart';

abstract class ThemeRepository {
  Future<AppThemeMode> getThemeMode();
  Future<void> setThemeMode(AppThemeMode themeMode);
}