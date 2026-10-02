import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hydration Insights'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(Icons.water_drop_rounded, size: 64, color: AppTheme.primary),
                  const SizedBox(height: 8),
                  const Text('92%', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  const Text('Weekly Target Adherence', style: TextStyle(color: AppTheme.textSecondary)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const CircleAvatar(backgroundColor: AppTheme.primary, child: Icon(Icons.star, color: Colors.black)),
              title: const Text('Hydro Master Badge'),
              subtitle: const Text('Achieved 7 consecutive days meeting daily goal!'),
            ),
          ),
        ],
      ),
    );
  }
}
