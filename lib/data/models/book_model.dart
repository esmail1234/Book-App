class BookModel {
  final String id;
  final String title;
  final String authors;
  final String thumbnail;
  final String description;
  final String publishedDate;
  final String category;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnail,
    required this.description,
    required this.publishedDate,
    required this.category,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};

    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'No Title',
      authors: volumeInfo['authors'] != null
          ? (volumeInfo['authors'] as List).join(', ')
          : 'Unknown Author',
      thumbnail: volumeInfo['imageLinks'] != null
          ? volumeInfo['imageLinks']['thumbnail'] ?? ''
          : '',
      description: volumeInfo['description'] ?? 'No Description',
      publishedDate: volumeInfo['publishedDate'] ?? 'Unknown',
      category: volumeInfo['categories'] != null
          ? volumeInfo['categories'][0]
          : 'General',
    );
  }
}
