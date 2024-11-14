import 'package:flutter/material.dart';
import 'package:indica_filmes/constants.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length, // Coloque aqui o valor de 10 se vc quiser limitar a quantidade de filmes, caso contrário vai buscar todos os filmes
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 200,
                width: 150,
                child: Image.network(
                  '${Constants.imagePath}${snapshot.data![index].posterPath}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
