import 'package:flutter/material.dart';
import 'package:praktekin/detailcontent_screen.dart';
import 'package:praktekin/model/categories.dart';
import 'package:praktekin/model/content.dart';

class DetailCategoryScreen extends StatelessWidget {
  DetailCategoryScreen({Key? key, required this.category}) : super(key: key);
  final CategoryList category;

  // final Content content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        slivers: [
          CategoryContentList(
            categoryName: category.name,
            contentListView: contentListView,
          ),
        ],
      ),
    );
  }
}

class CategoryContentList extends StatelessWidget {
  final List<Content> contentListView;
  final String categoryName;

  const CategoryContentList({
    Key? key,
    required this.contentListView,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Content> filteredContent = contentListView
        .where((content) => content.category == categoryName)
        .toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (filteredContent.isEmpty) {
            return const Center(
              child: Text('tidak ada konten yg ditampilkan'),
            );
          }
          final contentItem = filteredContent[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailContentScreen(
                      content: contentItem,
                    );
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      contentItem.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contentItem.title,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            contentItem.author,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14, overflow: TextOverflow.ellipsis),
                          ),
                          // Text(contentItem.description, maxLines: 1, style: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.remove_red_eye),
                                  Text(
                                    ' ${contentItem.viewCount.toString()}',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.thumb_up),
                                  Text(
                                    ' ${contentItem.likeCount.toString()}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: filteredContent.isEmpty ? 1 : filteredContent.length,
      ),
    );
  }
}
