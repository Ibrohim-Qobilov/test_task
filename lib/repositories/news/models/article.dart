// ignore_for_file: public_member_api_docs, sort_constructors_first
class Article  {
  const Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  final bool readed;
  final String? description;

  Article copyWith({
    String? id,
    String? title,
    DateTime? publicationDate,
    String? imageUrl,
    bool? readed,
    String? description,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      publicationDate: publicationDate ?? this.publicationDate,
      imageUrl: imageUrl ?? this.imageUrl,
      readed: readed ?? this.readed,
      description: description ?? this.description,
    );
  }
}
