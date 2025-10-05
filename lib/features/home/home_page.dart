import 'package:devvibe_template/core/theme/bloc/theme_bloc.dart';
import 'package:devvibe_template/core/theme/bloc/theme_event.dart';
import 'package:devvibe_template/core/theme/bloc/theme_state.dart';
import 'package:devvibe_template/core/theme/domain/entity/app_theme_mode.dart';
import 'package:devvibe_template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devvibe_template/features/auth/presentation/bloc/auth_event.dart';
import 'package:devvibe_template/l10n/app_localizations.dart';
import 'package:devvibe_template/l10n/bloc/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.helloWorld),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Text(
              l10n.welcomeMessage,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.homeSubtitle,
              style: textTheme.bodyLarge?.copyWith(
                color: textTheme.bodyLarge?.color?.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 40),

            // Settings section
            Text(
              l10n.settings,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Theme card
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  final isDark = state.themeMode == AppThemeMode.dark;
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    leading: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: colorScheme.primary,
                      size: 28,
                    ),
                    title: Text(
                      l10n.darkTheme,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      isDark ? l10n.themeDarkEnabled : l10n.themeLightEnabled,
                      style: textTheme.bodySmall?.copyWith(
                        color: textTheme.bodySmall?.color?.withOpacity(0.6),
                      ),
                    ),
                    trailing: Switch(
                      value: isDark,
                      activeColor: colorScheme.primary,
                      onChanged: (val) {
                        context.read<ThemeBloc>().add(
                          ChangeTheme(
                            val ? AppThemeMode.dark : AppThemeMode.light,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Language card
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
              child: BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        leading: Icon(
                          Icons.language,
                          color: colorScheme.primary,
                          size: 28,
                        ),
                        title: Text(
                          l10n.language,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Locale>(
                              value: locale,
                              isExpanded: true,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              items: const [
                                DropdownMenuItem(
                                  value: Locale('en'),
                                  child: Row(
                                    children: [
                                      Text("🇬🇧", style: TextStyle(fontSize: 20)),
                                      SizedBox(width: 12),
                                      Text(
                                        "English",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: Locale('es'),
                                  child: Row(
                                    children: [
                                      Text("🇪🇸", style: TextStyle(fontSize: 20)),
                                      SizedBox(width: 12),
                                      Text(
                                        "Español",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              onChanged: (newLocale) {
                                if (newLocale != null) {
                                  context.read<LocaleCubit>().changeLocale(newLocale);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // Log out button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutEvent());
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red.shade700,
                ),
                label: Text(
                  l10n.signOut,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade700,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.red.shade700,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}