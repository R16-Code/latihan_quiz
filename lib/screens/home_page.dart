import 'package:flutter/material.dart';
import 'package:latihan_quiz/screens/login_page.dart';
import 'package:latihan_quiz/models/movie_data.dart';
import 'package:latihan_quiz/screens/detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String password;
  const HomePage({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00171F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00171F),
        elevation: 0,
        title: const Text(
          'Daftar Film',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false);
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            "Selamat Datang $username",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return _movieCard(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _movieCard(BuildContext context, int index) {
  final movie = movieList[index];

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return DetailPage(index: index);
        }),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF00A7E1).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00A7E1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              movie.imgUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "${movie.title} (${movie.year})",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Rating: ${movie.rating.toStringAsFixed(1)}",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}