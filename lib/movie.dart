class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;




  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}



const List<Movie> movies = [
  Movie(title: 'Inception', genre: 'Action, Sci-Fi', year: 2010, rating: 9.5, image: 'assets/posters/inception.jpg'),
  Movie(title: 'Interstellar', genre: 'Sci-Fi, Drama', year: 2014, rating: 6.7, image: 'assets/posters/interstellar.jpg'),
  Movie(title: 'The Dark Knight', genre: 'Action, Crime', year: 2008, rating: 9.2, image: 'assets/posters/dark_knight.jpg'),
  Movie(title: 'The Grand Budapest Hotel', genre: 'Comedy, Drama', year: 2014, rating: 7.6, image: 'assets/posters/grand_budapest.jpg'),
  Movie(title: 'Spiderman', genre: 'Action, Adventure', year: 2019, rating: 9.9, image: 'assets/posters/spider.jpg'),
  Movie(title: 'Safah', genre: 'Mystery, True Crime', year: 2017, rating: 8.1, image: 'assets/posters/safah.jpg'),
  Movie(title: 'The Shawshank Redemption', genre: 'Drama', year: 1994, rating: 4.3, image: 'assets/posters/shawshank.jpg'),
  Movie(title: 'Mad Max: Fury Road', genre: 'Action, Adventure', year: 2015, rating: 7.7, image: 'assets/posters/mad_max.jpg'),
];


