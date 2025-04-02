import 'package:bloc_pattern_example/features/children/bloc/children_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildrenDetailEdit extends StatelessWidget {
  const ChildrenDetailEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Edit Child'),
      ),
      body: Builder(builder: (context) {
        final child = context.select((ChildrenBloc bloc) => bloc.state.selectedChild);
        if (child == null) {
          return const Text('No child selected');
        }else{
          return Text('Edit ${child.name}');
        }
      },)
    );
  }
}
