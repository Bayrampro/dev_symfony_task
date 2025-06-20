import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/number_info_bloc.dart';
import '../bloc/number_info_event.dart';
import '../bloc/number_info_state.dart';
import '../widgets/gradient_background.dart';
import '../widgets/number_type_dropdown.dart';
import '../widgets/number_input_field.dart';
import '../widgets/number_fact_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  String _selectedType = 'trivia';
  final List<String> _types = ['trivia', 'math', 'date'];
  AnimationController? _animController;
  Animation<double>? _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showResultDialog(String text, VoidCallback onSave) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: Text(text, style: Theme.of(context).textTheme.titleLarge),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              onSave();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
            label: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Информация о числах',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primary.withOpacity(0.8),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                context.go('/saved');
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NumberTypeDropdown(
                value: _selectedType,
                types: _types,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedType = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              NumberInputField(controller: _controller),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        context.read<NumberInfoBloc>().add(
                          GetNumberInfoEvent(
                            input: _controller.text,
                            type: _selectedType,
                          ),
                        );
                      },
                      child: const Text(
                        'Показать факт',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        context.read<NumberInfoBloc>().add(
                          GetRandomNumberInfoEvent(type: _selectedType),
                        );
                      },
                      child: const Text(
                        'Случайный факт',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: BlocConsumer<NumberInfoBloc, NumberInfoState>(
                  listener: (context, state) {
                    if (state is NumberInfoLoaded) {
                      _animController?.forward(from: 0);
                      _showResultDialog(
                        state.info.text,
                        () => context.read<NumberInfoBloc>().add(
                          SaveNumberInfoEvent(state.info),
                        ),
                      );
                    } else if (state is NumberInfoError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    if (state is NumberInfoLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is NumberInfoInitial) {
                      return Center(
                        child: Text(
                          'Введите число и выберите тип факта',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Colors.black54),
                        ),
                      );
                    } else if (state is NumberInfoLoaded) {
                      return FadeTransition(
                        opacity: _fadeAnim!,
                        child: NumberFactCard(
                          text: state.info.text,
                          type: _selectedType,
                        ),
                      );
                    } else if (state is NumberInfoError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(color: Colors.red),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
