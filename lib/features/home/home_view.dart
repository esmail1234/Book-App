import 'package:book_app/core/widgets/section_header.dart';
import 'package:flutter/material.dart';

class BookSection {
  final String title;
  final List<String> images;
  final bool isBanner;

  const BookSection({
    required this.title,
    required this.images,
    this.isBanner = false,
  });
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<BookSection> sections = [
    BookSection(
      title: 'Best Deals',
      images: ['assets/images/image8.png', 'assets/images/image9.png'],
      isBanner: true,
    ),
    BookSection(
      title: 'Top Books',
      images: [
        'assets/images/image1.png',
        'assets/images/image3.png',
        'assets/images/image4.png',
      ],
    ),
    BookSection(
      title: 'Latest Books',
      images: [
        'assets/images/image5.png',
        'assets/images/image6.png',
        'assets/images/image3.png',
      ],
    ),
    BookSection(
      title: 'Upcoming Books',
      images: [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image4.png',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Happy Reading!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            // All Sections
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final section = sections[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SectionHeader(title: section.title),
                        ),
                        const SizedBox(height: 10),
                        _BooksList(
                          images: section.images,
                          isBanner: section.isBanner,
                        ),
                      ],
                    ),
                  );
                },
                childCount: sections.length,
              ),
            ),

            // Bottom Spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _BooksList extends StatelessWidget {
  final List<String> images;
  final bool isBanner;

  const _BooksList({
    required this.images,
    this.isBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    final double height = isBanner ? 140 : 288;
    final double width = isBanner ? 280 : 180;

    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _BookCard(
          imagePath: images[index],
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const _BookCard({
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}