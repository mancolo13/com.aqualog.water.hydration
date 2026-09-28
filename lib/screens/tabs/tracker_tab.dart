import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/storage_service.dart';

class TrackerTab extends StatefulWidget {
  const TrackerTab({super.key});

  @override
  State<TrackerTab> createState() => _TrackerTabState();
}

class _TrackerTabState extends State<TrackerTab> {
  int _currentMl = 1250;
  static const int _goalMl = 2500;

  void _addWater(int ml) {
    setState(() => _currentMl += ml);
    StorageService.setInt('water_ml', _currentMl);
  }

  void _reset() {
    setState(() => _currentMl = 0);
    StorageService.setInt('water_ml', 0);
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentMl / _goalMl).clamp(0.0, 1.0);
    return Scaffold(
      appBar: AppBar(title: const Text('AquaLog Hydration'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 16,
                      backgroundColor: AppTheme.card,
                      color: AppTheme.primary,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('$_currentMl ml', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Goal: $_goalMl ml', style: const TextStyle(color: AppTheme.textSecondary)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Wrap(
                spacing: 12,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _addWater(250),
                    icon: const Icon(Icons.local_drink),
                    label: const Text('+250 ml'),
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: AppTheme.background),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _addWater(500),
                    icon: const Icon(Icons.water_drop),
                    label: const Text('+500 ml'),
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.secondary, foregroundColor: AppTheme.background),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(onPressed: _reset, child: const Text('Reset Daily Log', style: TextStyle(color: AppTheme.textSecondary))),
            ],
          ),
        ),
      ),
    );
  }
}
