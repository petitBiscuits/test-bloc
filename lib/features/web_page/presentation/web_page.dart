import 'package:bloc_pattern_example/core/bloc/global_bloc.dart';
import 'package:bloc_pattern_example/features/web_page/data/repository/web_repo.dart';
import 'package:bloc_pattern_example/features/web_page/bloc/web_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WebRepo(),
      child: BlocProvider(
        create: (context) => WebBloc(webRepo: context.read<WebRepo>()),
        child: BlocBuilder<WebBloc, WebState>(
          builder: (context, state) {
            if (state is WebInitial) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<WebBloc>().add(FetchWebData());
                  },
                  child: Text('Fetch Data'),
                ),
              );
            } else if (state is WebLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WebLoaded) {
              return Center(child: Column(
                children: [
                  Text(state.response),
                  SizedBox.fromSize(size: Size.fromHeight(20)),
                  Text('Global Data:'),
                  BlocBuilder<GlobalBloc, GlobalState>(
                    builder:   (context, state) {
                      print("state : $state");

                      if (state is GlobalLoaded) {
                        return Text('Global Data: ${state.user_name}');
                      } else {
                        return Text('Empty');
                      }
                  }),
                ],
              ));
            } else if (state is WebError) {
              return Center(child: Text(state.response));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
