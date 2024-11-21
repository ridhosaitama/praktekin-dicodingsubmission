import 'package:flutter/material.dart';

class TestScrolltoTop extends  StatefulWidget {
  @override
  State<TestScrolltoTop> createState() => _TestScrolltoTopState();
}

class _TestScrolltoTopState extends State<TestScrolltoTop> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  List<String> countries = ["USA", "United Kingdom", "China", "Russia", "Brazil",
    "India", "Pakistan", "Nepal", "Bangladesh", "Sri Lanka",
    "Japan", "South Korea", "Mongolia"];

  @override
  void initState() {
    scrollController.addListener(() { //scroll listener
      double showoffset = 10.0; //Back to top botton will show on scroll offset 10.0

      if(scrollController.offset > showoffset){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Scroll Back to Top Button"),
            backgroundColor: Colors.redAccent
        ),
        floatingActionButton: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),  //show/hide animation
          opacity: showbtn?1.0:0.0, //set obacity to 1 on visible, or hide
          child: FloatingActionButton(
            onPressed: () {
              scrollController.animateTo( //go to top of scroll
                  0,  //scroll offset to go
                  duration: Duration(milliseconds: 500), //duration of scroll
                  curve:Curves.fastOutSlowIn //scroll type
              );
            },
            child: Icon(Icons.arrow_upward),
            backgroundColor: Colors.redAccent,
          ),
        ),
        body: SingleChildScrollView(
            controller: scrollController, //set controller
            child:Container(
                child:Column(
                  children: countries.map((country){
                    return Card(
                        child:ListTile(
                            title: Text(country)
                        )
                    );
                  }).toList(),
                )
            )
        )
    );
  }
}