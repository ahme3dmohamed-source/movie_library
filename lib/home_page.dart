import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';
  bool isGridView = false;
  int discount = 25;

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      final query = searchText.toLowerCase().trim();
      return movie.title.toLowerCase().contains(query) ||
          movie.genre.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: isGridView ? 'Switch to list view' : 'Switch to grid view',
            onPressed: () => setState(() => isGridView = !isGridView),
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => setState(() => searchText = value),
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredMovies.isEmpty
                  ? const Center(child: Text('No movies found'))
                  : isGridView
                      ? Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 820),
                            child: GridView.builder(
                              itemCount: filteredMovies.length,
                              padding: const EdgeInsets.only(bottom: 12),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                childAspectRatio: 1.1,
                              ),
                              itemBuilder: (context, index) => MovieCard(
                                movie: filteredMovies[index],
                                discount: discount,
                                onDiscountTap: _decreaseDiscount,
                                compactPoster: true,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredMovies.length,
                          padding: const EdgeInsets.only(bottom: 12),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Center(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 300),
                                child: MovieCard(
                                  movie: filteredMovies[index],
                                  discount: discount,
                                  onDiscountTap: _decreaseDiscount,
                                  compactPoster: true,
                                ),
                              ),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  void _decreaseDiscount() {
    setState(() {
      if (discount > 0) discount--;
    });
  }
}
