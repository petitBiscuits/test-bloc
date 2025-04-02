import 'package:bloc_pattern_example/features/children/bloc/children_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChildrenDetail extends StatelessWidget {
  const ChildrenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Children Detail'),
      ),
      body: Builder(builder: (context) {
        final child = context.select((ChildrenBloc bloc) => bloc.state.selectedChild);
        if (child == null) {
          return const Text('No child selected');
        }else{
          return Column(
            children: [
              Text('Details for ${child.name}'),
              FilledButton(onPressed: () {
                GoRouter.of(context).push('/children/details/edit-child');
              }, child: Text("Edit")),
            ],
          );
        }
      },)
    );
  }
}
