import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:indica_filmes/constants.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length, // Coloque aqui o valor de 10 se vc quiser limitar a quantidade de filmes, caso contrário vai buscar todos os filmes
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          );
        },
      ),
    );
  }
}
