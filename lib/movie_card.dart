import 'package:flutter/material.dart';
import 'movie.dart';



class MovieCard extends StatelessWidget
 {
  final Movie movie;
  final int discount;
  final VoidCallback onDiscountTap;
  final bool compactPoster;



  const MovieCard
  ({
    super.key,
    required this.movie,
    required this.discount,
    required this.onDiscountTap,
    this.compactPoster = false,
  }
  );



  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (compactPoster)
            SizedBox(
              height: 190,
              child: Stack(
                fit: StackFit.expand,
                children: _posterStackChildren(colors),
              ),
            )
          else
            AspectRatio(
              aspectRatio: 2 / 2.7,
              child: Stack(
                fit: StackFit.expand,
                children: _posterStackChildren(colors),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  movie.genre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: colors.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _posterStackChildren(ColorScheme colors) => [
        Image.asset(movie.image, fit: BoxFit.cover),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, size: 15, color: Colors.white),
                const SizedBox(width: 3),
                Text(
                  movie.rating.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            onPressed: () {},
            tooltip: 'Bookmark',
            icon: const Icon(Icons.bookmark_border, color: Colors.white, size: 27),
            style: IconButton.styleFrom(backgroundColor: Colors.black45),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              '${movie.year}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Material(
            color: colors.primary,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: onDiscountTap,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                child: Text(
                  '$discount%',
                  style: TextStyle(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ];
}
