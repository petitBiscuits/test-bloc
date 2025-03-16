import 'package:bloc_pattern_example/data/repository/web_repo.dart';
import 'package:bloc_pattern_example/features/web_page/bloc/web_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Page'),
      ),
      body: RepositoryProvider(
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
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WebLoaded) {
                return Center(
                  child: Text(state.response),
                );
              } else if (state is WebError) {
                return Center(
                  child: Text(state.response),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
