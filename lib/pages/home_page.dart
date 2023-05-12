import 'package:cat_facts/cubit/cat_fact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatFactCubit, CatFactState>(builder: (context, state) {
      final cubit = context.read<CatFactCubit>();
      return Scaffold(
        body: Stack(
          children: [
            Center(
                child: state.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: cubit.image == null
                                ? Container()
                                : Image.memory(cubit.image!, height: 500),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0),
                            child: Text(
                              state.cat.fact,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 88),
                        ],
                      )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const StadiumBorder()),
                      onPressed: () {
                        context.read<CatFactCubit>().fetchRandomFact();
                      },
                      child: const Text("Another fact!"))),
            )
          ],
        ),
      );
    });
  }
}
