import 'package:flutter/material.dart';
import 'package:latihan_quiz/models/movie_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  Future<void> _launchWikipedia(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak bisa membuka $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = movieList[index];

    return Scaffold(
      backgroundColor: const Color(0xFF00171F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00171F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "${movie.title} (${movie.year})",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                movie.imgUrl,
                width: 250,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Sinopsis:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              movie.synopsis,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 12),

            const Text(
              "Genre:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              movie.genre,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 12),

            const Text(
              "Sutradara:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              movie.director,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 12),

            const Text(
              "Daftar Cast:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              movie.casts.join(", "),
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 12),

            const Text(
              "Rating:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              movie.rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 12),

            const Text(
              "Wikipedia:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: () => _launchWikipedia(movie.movieUrl),
              child: Text(
                movie.movieUrl,
                style: const TextStyle(
                  color: Color(0xFF00A7E1),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
