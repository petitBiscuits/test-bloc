import 'package:bloc_pattern_example/core/bloc/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildrenPage extends StatelessWidget {
  const ChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Text('Children Page'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<GlobalBloc>(
                    context,
                  ).add(GlobalAddData(text: 'New data'));
                },
                child: const Text('Change global data'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
