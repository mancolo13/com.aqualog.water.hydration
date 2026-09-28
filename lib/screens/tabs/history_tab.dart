import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  final List<Map<String, String>> days = const [
    {"day": "Yesterday", "intake": "2,400 ml", "status": "96%"},
    {"day": "2 days ago", "intake": "2,600 ml", "status": "104% (Goal Met!)"},
    {"day": "3 days ago", "intake": "2,200 ml", "status": "88%"},
    {"day": "4 days ago", "intake": "2,500 ml", "status": "100% (Goal Met!)"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hydration History'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: days.length,
        itemBuilder: (ctx, i) {
          final item = days[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const Icon(Icons.water_drop_outlined, color: AppTheme.primary),
              title: Text(item['day']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['status']!),
              trailing: Text(item['intake']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}
