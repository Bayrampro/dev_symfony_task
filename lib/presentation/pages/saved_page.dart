import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/number_info_bloc.dart';
import '../bloc/number_info_event.dart';
import '../bloc/number_info_state.dart';
import '../widgets/gradient_background.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Сохранённые факты', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          label: const Text('Назад', style: TextStyle(color: Colors.white)),
          onPressed: () => context.go('/'),
        ),
        body: BlocBuilder<NumberInfoBloc, NumberInfoState>(
          builder: (context, state) {
            if (state is NumberInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SavedNumberInfoLoaded) {
              if (state.saved.isEmpty) {
                return Center(child: Text('Нет сохранённых фактов', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54)));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: state.saved.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final info = state.saved[index];
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).colorScheme.surface.withOpacity(0.92),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                      title: Text(info.text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Число: ${info.number}, Тип: ${info.type}', style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      trailing: info.savedAt != null
                          ? Text(
                              '${info.savedAt!.day.toString().padLeft(2, '0')}.${info.savedAt!.month.toString().padLeft(2, '0')}.${info.savedAt!.year}',
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
                            )
                          : null,
                    ),
                  );
                },
              );
            } else if (state is NumberInfoError) {
              return Center(child: Text(state.message, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red)));
            }
            // По умолчанию загружаем сохранённые факты
            context.read<NumberInfoBloc>().add(LoadSavedNumberInfoEvent());
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
} 