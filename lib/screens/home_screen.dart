import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indica_filmes/api/api.dart';
import 'package:indica_filmes/models/movie.dart';
import 'package:indica_filmes/widgets/movies_slider.dart';
import '../widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
late Future<List<Movie>> trendingMovies;


void initState() {
  trendingMovies = Api().getTrendingMovies();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //TODO: fazer um logo para o app e linkar
        title: Image.asset(
          'assets/flutflix.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tendências',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32),
              const TendenciasSlider(),
              const SizedBox(height: 32),
              Text(
                'Em alta',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              const FilmeSlider(),
              const SizedBox(height: 32),
              Text(
                'Chegando em breve',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              const FilmeSlider(),
            ],
          ),
        ),
      ),
    );
  }
}



