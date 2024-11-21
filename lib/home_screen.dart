import 'package:flutter/material.dart';
import 'package:praktekin/account_screen.dart';
import 'package:praktekin/category_screen.dart';
import 'package:praktekin/detailcontent_screen.dart';
import 'package:praktekin/listviewcontentbycategory_screen.dart';
import 'package:praktekin/model/categories.dart';
import 'package:praktekin/model/content.dart';
import 'package:praktekin/model/data_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Greeting
          GreetingContainer(),

          // Widget Carousel
          CarouselContainer(),

          // Categories
          CategoryMenu(),

          // Content
          // ContentMenu(),
          const CustomScrollView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverContentMenu(),
            ],
          ),
        ],
      ),
    );
  }
}

class GreetingContainer extends StatelessWidget {
  GreetingContainer({Key? key}) : super(key: key);
  final DataUser user = data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 7,
          child: Text.rich(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            TextSpan(children: [
              TextSpan(
                text: 'Hai, ',
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              TextSpan(
                text: user.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            tooltip: 'ke pengaturan akun',
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AccountScreen();
              }));
            },
          ),
        )
      ]),
    );
  }
}

class CarouselContainer extends StatelessWidget {
  CarouselContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    'APCB',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CategoryMenu extends StatelessWidget {
  CategoryMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kategori',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CategoryScreen();
                }));
              },
              child: Text(
                'see all',
                style: TextStyle(
                  fontSize: 18,
                  //color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Scrollbar(
            child: SizedBox(
          height: 40,
          //margin: EdgeInsets.symmetric(vertical: 4),
          child: CategoryListView(),
        ))
      ]),
    );
  }
}

class CategoryListView extends StatelessWidget {
  CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categoryShowList.length,
      itemBuilder: (context, index) {
        final CategoryList category = categoryShowList[index];
        return Container(
          margin: EdgeInsets.only(right: 8.0),
          child: OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailCategoryScreen(category: category);
                }));
              },
              child: Text(
                category.name,
                style: TextStyle(fontSize: 14),
              )),
        );
      },
    );
  }
}

// class ContentMenu extends StatelessWidget {
//   ContentMenu({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: categoryShowList.length,
//       scrollDirection: Axis.vertical,
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) {
//         final CategoryList category = categoryShowList[index];
//         return Container(
//           margin: EdgeInsets.all(8),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     flex: 7,
//                     child: Text(
//                       'Praktik Terbaik di ${category.name}',
//                       overflow: TextOverflow.ellipsis,
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: IconButton(
//                       tooltip: 'ke ${category.name}',
//                       icon: const Icon(
//                         Icons.arrow_forward_rounded,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return DetailCategoryScreen(category: category);
//                         }));
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               Scrollbar(
//                 thickness: 0,
//                 child: SizedBox(
//                   height: 150,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     children: [
//                       if (category.content != null &&
//                           index < category.content!.length)
//                         ...category.content!
//                             .map((item) => Card(
//                                   child:
//                                       SizedBox(width: 150, child: Text(item)),
//                                 ))
//                             .toList()
//                       else
//                         SizedBox(
//                           child: const Text(
//                               'tidak ada konten yg ditampilkan'), // Default message
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class SliverContentMenu extends StatelessWidget {
  const SliverContentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final CategoryList categoryList = categoryShowList[index];
          //final Content contentList = contentListView[index];
          final List<Content> filteredContent = contentListView
              .where((content) => content.category == categoryList.name)
              .toList();
          return Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        'Praktik Terbaik di ${categoryList.name}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        tooltip: 'ke konten ${categoryList.name}',
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailCategoryScreen(category: categoryList);
                          }));
                        },
                      ),
                    ),
                  ],
                ),
                Scrollbar(
                  thickness: 0,
                  child: SizedBox(
                    height: filteredContent.isEmpty ? 100 : 260,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredContent.isEmpty ? 1 : filteredContent.length,
                      itemBuilder: (context, idx) {
                        if (filteredContent.isEmpty) {
                          return const Center(
                            child: Text('tidak ada konten yg ditampilkan'),
                          );
                        }
                        final contentItem = filteredContent[idx];
                        return Card(
                          child: SizedBox(
                            width: 150,
                            child: InkWell(
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image Content
                                  Image.asset(contentItem.image),
                                  // Content Desc
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(contentItem.title, maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
                                            Text(contentItem.author, maxLines: 1, style: TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.remove_red_eye, size: 12,), Text(' ${contentItem.viewCount.toString()}', style: TextStyle(fontSize: 12),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.thumb_up, size: 12,), Text(' ${contentItem.likeCount.toString()}', style: TextStyle(fontSize: 12),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // child: ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   shrinkWrap: true,
                    //   children: [
                    //     if (category.content != null && index < category.content!.length index < categoryList.content!.length)
                    //       ...categoryList.content!
                    //           .map((item) => Card(
                    //                 child:
                    //                     SizedBox(width: 150, child: Text(item)),
                    //               ))
                    //           .toList()
                    //     else
                    //       SizedBox(
                    //         child: const Text(
                    //             'tidak ada konten yg ditampilkan'), // Default message
                    //       ),
                    //   ],
                    // ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: categoryShowList.length,
      ),
    );
  }
}

Color getColorByBrightness(BuildContext context){
  return Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
}