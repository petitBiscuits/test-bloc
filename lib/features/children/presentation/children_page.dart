import 'package:bloc_pattern_example/features/children/bloc/children_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChildrenPage extends StatelessWidget {
  const ChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Children'),
      ),
      body: Builder(
        builder: (context) {
          final children = context.select((ChildrenBloc bloc) => bloc.state.children);
          return ListView.builder(
            itemCount: children.length,
            itemBuilder: (context, index) {
              final child = children[index];
              return ListTile(
                title: Text(child.name),
                onTap: () {
                  context.read<ChildrenBloc>().add(ChildrenSelectChild(child: child));
                  GoRouter.of(context).push('/children/details');
                },
              );
            },
          );
        }
      ),
    );
  }
}
