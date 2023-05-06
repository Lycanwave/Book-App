import 'package:flutter/material.dart';
import 'package:vocibo/bookData.dart';
import 'package:vocibo/screens/bookCartScreen.dart';
import 'package:vocibo/screens/item_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> temp = bookData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: Container(
            //height: 40,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: TextFormField(
              //style: TextStyle(height: 1),
              textAlign: TextAlign.left,
              onChanged: (value) {
                //setState(() {});
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Search', suffixIcon: Icon(Icons.search)
                  //hintTextDirection: TextDirection.values[20],
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(28.0),
                  // )
                  ),
              cursorColor: Colors.black,
            ),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookCartScreen()));
              },
              child: Icon(Icons.shop_sharp)),
        ],
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: temp.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 3
                  : 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: (1 / 1.5),
        ),
        itemBuilder: (BuildContext context, int index) {
          if (searchController.text.isEmpty) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsScreen(
                        item: temp[index],
                        id: temp[index]['id'],
                        title: temp[index]['title'],
                        price: temp[index]['price_in_dollar'],
                        image: temp[index]['cover_image_url'],
                        description:
                            "In the epic conclusion to the 5 worlds series, the final battle looms In the epic conclusion of 5 Words series, thefinal battle looms... Read more"),
                  ),
                );
              },
              child: ItemsContainer(
                title: temp[index]['title'],
                image: temp[index]['cover_image_url'],
              ),
            );
          } else if (bookData[index]['title']
              .toString()
              .toLowerCase()
              .contains(searchController.text.toLowerCase())) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsScreen(
                        item: temp[index],
                        id: temp[index]['id'],
                        title: temp[index]['title'],
                        price: temp[index]['price_in_dollar'],
                        image: temp[index]['cover_image_url'],
                        description:
                            "sdvbhdfbvjhbfvjhdsfbvjhdfsbvjhbfvjhdfbvjhdfbvjhdf"),
                  ),
                );
              },
              child: ItemsContainer(
                title: temp[index]['title'],
                image: temp[index]['cover_image_url'],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class ItemsContainer extends StatelessWidget {
  String title;
  String image;
  ItemsContainer({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 5, right: 5, top: 2),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            //border: Border.all(),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                  width: 140,
                  fit: BoxFit.fill,
                  height: 140,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                title.length >= 40 ? title.substring(0, 17) + '...' : title,
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
            SizedBox(height: 10),
            Text('Mark Siegel')
          ],
        ),
      ),
    );
  }
}
