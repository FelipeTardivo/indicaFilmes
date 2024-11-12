import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indica_filmes/widgets/filmes_slider.dart';

import 'widgets/tendencias_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
            //Container(height: 300, width: 300, color: Colors.amber,)],
            // A linha acima é apenas para visualizar o espaço que será ocupado
          ),
        ),
      ),
    );
  }
}



