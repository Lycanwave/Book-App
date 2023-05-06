import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vocibo/bookData.dart';
import 'package:vocibo/provider/orderListProvider.dart';

class BookCartScreen extends StatefulWidget {
  const BookCartScreen({super.key});

  @override
  State<BookCartScreen> createState() => _BookCartScreenState();
}

class _BookCartScreenState extends State<BookCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: const [
        Icon(Icons.shop_sharp),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Consumer<OrderListProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Bag',
                        style: TextStyle(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text('(${value.cartItemLength.toString()})'),
                      )
                    ],
                  ),

                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cartList.length,
                        itemBuilder: (context, index) {
                          int temp = int.parse(value.cartList[index].key!);
                          return CartItems(
                            countItem: value.cartList[index].value.toString(),
                            imageUrl: bookData[temp - 1]['cover_image_url'],
                            price: bookData[temp - 1]['price_in_dollar'],
                            title: bookData[temp - 1]['title'],
                          );
                        }),
                  ),
                  //Text(value.listOfCartItem.length.toString()),
                  Text(
                    'Subtotal: ₹${(value.priceOfCartItem * 85).toStringAsPrecision(6)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .85,
                    child: Center(child: Text('Proceed to Checkout')),
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  String title;
  double price;
  String countItem;
  String imageUrl;
  CartItems({
    Key? key,
    required this.title,
    required this.price,
    required this.countItem,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.cyan,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.network(
                    imageUrl,
                    height: 110,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              //color: Colors.green,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.length >= 40 ? '${title.substring(0, 37)}...' : title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '₹${(price * 85).toStringAsPrecision(6)}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Qty: $countItem'),
                      Row(
                        children: const [
                          Icon(Icons.edit),
                          SizedBox(width: 10),
                          Icon(Icons.delete),
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
    );
  }
}
