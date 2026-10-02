import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class GoalsTab extends StatefulWidget {
  const GoalsTab({super.key});

  @override
  State<GoalsTab> createState() => _GoalsTabState();
}

class _GoalsTabState extends State<GoalsTab> {
  double _dailyGoal = 2500;
  bool _reminders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hydration Targets'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Daily Water Target', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('${_dailyGoal.round()} ml / day', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  Slider(
                    value: _dailyGoal,
                    min: 1500,
                    max: 4000,
                    divisions: 25,
                    activeColor: AppTheme.primary,
                    onChanged: (v) => setState(() => _dailyGoal = v),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: SwitchListTile(
              title: const Text('Smart Drink Reminders'),
              subtitle: const Text('Alert every 90 minutes during daytime'),
              value: _reminders,
              activeColor: AppTheme.primary,
              onChanged: (v) => setState(() => _reminders = v),
            ),
          ),
        ],
      ),
    );
  }
}
