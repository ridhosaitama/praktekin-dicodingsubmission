import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Pencarian',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NewSearchBar(),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Pencarian teratas',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('pencarian teratas lanjutan ditekan!'),
                          ),
                        );
                      },
                      icon: Icon(Icons.north_east_outlined),
                      tooltip: 'pergi ke daftar pencarian teratas',
                    ),
                  ],
                ),
                CustomScrollView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('pencarian ${index + 1} ditekan!'),
                                ),
                              );
                            },
                            child: Text(
                              'cari teratas ${index + 1}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                        childCount: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewSearchBar extends StatefulWidget {
  const NewSearchBar({super.key});

  @override
  State<StatefulWidget> createState() => _NewSearchBarWidgetState();
}

class _NewSearchBarWidgetState extends State<NewSearchBar> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          onSubmitted: (value) {
            setState(() {
              _searchText = value;
              controller.closeView(value);
            });
          },
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            Tooltip(
              message: 'tekan untuk mencari kata kunci',
              child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('pencarian "$_searchText" ditekan!'),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_rounded),
              ),
            )
          ],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'pencarian tersimpan ${index + 1}';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
                _searchText = item;
              });
            },
          );
        });
      },
    );
  }
}
