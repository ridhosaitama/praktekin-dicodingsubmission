import 'package:flutter/material.dart';
import 'package:praktekin/listviewcontentbycategory_screen.dart';
import 'package:praktekin/model/categories.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategori',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CategoryGridView(),
        ),
      ),
    );
  }
}

class CategoryGridView extends StatelessWidget {
  CategoryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final CategoryList category = categoryShowList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailCategoryScreen(category: category);
            }));
          },
          child: Card(
            color: Colors.white.withOpacity(0.1),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Image.asset(category.image, fit: BoxFit.cover),
                  ),
                  Flexible(
                    flex: 1,
                    child:
                    Container(margin: EdgeInsets.all(8),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      category.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    ),
                  ),
                  // Text(category.description),
                ]),
          ),
        );
      },
      itemCount: categoryShowList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
    );
  }
}
