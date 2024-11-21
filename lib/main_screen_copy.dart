import 'package:flutter/material.dart';
import 'package:praktekin/category_screen.dart';
import 'package:praktekin/listviewcontentbycategory_screen.dart';
import 'package:praktekin/model/categories.dart';
import 'package:praktekin/model/data_user.dart';
import 'package:praktekin/home_screen.dart';
import 'package:praktekin/search_screen.dart';
import 'package:praktekin/setting_screen.dart';


class MainScreenCopy extends StatefulWidget{
  final String appName;

  MainScreenCopy({super.key, required this.appName});
  @override
  State<MainScreenCopy> createState() => _MainScreenCopyState();
}

class _MainScreenCopyState extends State<MainScreenCopy> {
  ScrollController _scrollController = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    _scrollController.addListener(() { //scroll listener
      double showoffset = 10.0; //Back to top botton will show on scroll offset 10.0

      if(_scrollController.offset > showoffset){
        showbtn = true;
        setState(() {
          //update state
        });
      }else{
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appName,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24.0,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: showbtn?1.0:0.0,
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve:Curves.easeInOut
            );
          },
          child: Icon(Icons.arrow_upward),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            tooltip: 'pergi ke beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pencarian',
            tooltip: 'pergi ke pencarian',
          ),
          BottomNavigationBarItem(
            tooltip: 'pergi ke pengaturan',
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      ),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: _screens[_selectedIndex],

      //SafeArea(child:
      // SingleChildScrollView(
      //   controller: _scrollController,
      //     child: Container(
      //       margin: EdgeInsets.all(16),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           // User Greeting
      //           GreetingContainer(),
      //
      //           // Widget Carousel
      //           CarouselContainer(),
      //
      //           // Categories
      //           CategoryMenu(),
      //
      //           // Content
      //           ContentMenu(),
      //         ],
      //       ),
      //     ),
      //   )
      )
    );
    // );
  }
}

//
// class GreetingContainer extends StatelessWidget {
//   GreetingContainer({Key? key}) : super(key: key);
//   final DataUser user = data;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         Expanded(
//           flex: 7,
//           child: Container(
//             child: RichText(
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               text: TextSpan(children: [
//                 TextSpan(
//                   text: 'Hai, ',
//                   style: TextStyle(
//                     fontSize: 21,
//                   ),
//                 ),
//                 TextSpan(
//                   text: user.name.toUpperCase(),
//                   style: TextStyle(
//                     fontSize: 21,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: IconButton(
//             tooltip: 'ke pengaturan akun',
//             icon: const Icon(
//               Icons.account_circle_outlined,
//               color: Colors.white,
//             ),
//             onPressed: () {},
//           ),
//         )
//       ]),
//     );
//   }
// }
//
// class CarouselContainer extends StatelessWidget {
//   CarouselContainer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Card(
//         color: Theme.of(context).colorScheme.inversePrimary,
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//                 height: 200,
//                 child: Center(
//                   child: Text(
//                     'APCB',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryMenu extends StatelessWidget {
//   CategoryMenu({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       child: Column(children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Kategori',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return CategoryScreen();
//                 }));
//               },
//               child: Text(
//                 'see all',
//                 style: TextStyle(
//                   fontSize: 18,
//                   //color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Scrollbar(child:
//           SizedBox(
//             height: 40,
//             //margin: EdgeInsets.symmetric(vertical: 4),
//             child: CategoryListView(),
//           )
//         )
//       ]),
//     );
//   }
// }
//
// class CategoryListView extends StatelessWidget {
//   CategoryListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: categoryShowList.length,
//       itemBuilder: (context, index) {
//         final CategoryList category = categoryShowList[index];
//         return Container(
//           margin: EdgeInsets.only(right: 8.0),
//           child: OutlinedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return DetailCategoryScreen(category: category);
//                 }));
//               },
//               child: Text(
//                 category.name,
//                 style: TextStyle(fontSize: 14),
//               )),
//         );
//       },
//     );
//   }
// }
//
// class ContentMenu extends StatelessWidget {
//   ContentMenu({Key? key,}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: categoryShowList.length,
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) {
//         final CategoryList category = categoryShowList[index] ;
//         return Container(
//           margin: EdgeInsets.all(8),
//             child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Expanded(
//                         flex: 7,
//                         child: Text('Praktik Terbaik di ${category.name}',
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: IconButton(
//                           icon: const Icon(
//                             Icons.arrow_forward_rounded,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context){
//                               return DetailCategoryScreen(category: category);
//                             }));
//                             },
//                         ),
//                       )
//                     ],
//                   ),
//                   Scrollbar(
//                       thickness: 0,
//                     child : SizedBox(
//                         height: 150,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal, shrinkWrap: true,
//                         children: [
//                           if (category.content != null && index < category.content!.length)
//                             ...category.content!.map((item) => Card(
//                               child:
//                               SizedBox(width: 150,
//                                   child: Text(item)),
//                             )).toList()
//                           else
//                              SizedBox(
//                               child: const Text('tidak ada konten yg ditampilkan'), // Default message
//                             ),
//                         ]
//                       )
//                   )
//                   )
//                 ]
//             )
//         );
//       },
//     );
//   }
// }