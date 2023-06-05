import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jokes/bloc/jokes_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final JokesBloc _bloc = JokesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes BLoC sample"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocProvider(
                create: (context) => _bloc,
                child: BlocListener<JokesBloc, JokesState>(
                  listener: (context, state) {
                    if (state is JokesError) {
                      log("error");
                    }
                  },
                  child: BlocBuilder<JokesBloc, JokesState>(
                    builder: (context, state) {
                      if (state is JokesLoading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (state is JokesError) {
                        return const Center(child: Text("Error"));
                      } else if (state is JokesLoaded) {
                        return Center(
                          child: Text(state.jokesModel.joke),
                        );
                      } else {
                        return const Text("Text Jokes");
                      }
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _bloc.add(GetJokesData());
              },
              child: const Text("Click to get the jokes"),
            ),
          ],
        ),
      ),
    );
  }
}
