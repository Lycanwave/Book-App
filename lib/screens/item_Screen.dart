import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocibo/provider/orderListProvider.dart';

class ItemsScreen extends StatefulWidget {
  dynamic item;
  String id;
  String title;
  double price;
  String image;
  String description;
  ItemsScreen(
      {super.key,
      required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.item,
      required this.description});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    //print('build');
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: const [
        Icon(Icons.shop_sharp),
      ]),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                      height: 320,
                      width: 225,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mark Siegal',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Text(widget.description,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                const SizedBox(height: 10),
                Text(
                    '₹${(widget.price * 85).toDouble().toStringAsPrecision(6)}',
                    style: TextStyle(fontSize: 25)),
                const SizedBox(height: 10),
                Consumer<OrderListProvider>(
                  builder: (context, value, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(25)),
                      child: !value.listOfCartItem.containsKey(widget.id)
                          ? GestureDetector(
                              onTap: () {
                                value.addItemToOrderList(widget.item);
                              },
                              child: const Center(
                                  child: Text(
                                'Add To Bag',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            )
                          : Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      value
                                          .removeItemFromOrderList(widget.item);
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                        '${value.listOfCartItem[widget.id]}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 25)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      value.addItemToOrderList(widget.item);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
