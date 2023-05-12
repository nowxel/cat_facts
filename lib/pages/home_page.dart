import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_facts/cubit/cat_fact_cubit.dart';
import 'package:cat_facts/cubit/cat_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatFactCubit, CatFactState>(builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            Center(
                child: state.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Column(
                        children: [
                          BlocBuilder<CatImageCubit, CatImageState>(
                              builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CachedNetworkImage(
                                imageUrl: state.image.toString(),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              state.cat.fact,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
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
                        context.read<CatImageCubit>().fetchRandomImage();
                      },
                      child: const Text("Another fact!"))),
            )
          ],
        ),
      );
    });
  }
}
