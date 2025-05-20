import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_varaiable.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  
  final List<String> filters=const ['All','Adidas','Bata','Nike'];
  late String selectedStr;
  @override
  void initState() {
    super.initState();
    selectedStr=filters[0];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children:[
          Row(
            children: [
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(
              'shoes\nCollection',
              style:Theme.of(context).textTheme.titleLarge,
            ),
  ),
          Expanded(child: TextField(
            decoration: InputDecoration(hintText:'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1),
              ),
              borderRadius: BorderRadius.horizontal(left:Radius.circular(50),right:Radius.circular(50)),
            ),
            ),
          ),
          ),
          
            ],
          ),
        SizedBox(
          height:120,
          child: ListView.builder(itemCount:filters.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:  (context,index){
              final filter=filters[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  onTap:(){
                    setState(() {
                         selectedStr=filter;
                    });//change the chip/buttton filters
                 
                  },
                  child: Chip(
                    backgroundColor:selectedStr==filter?const Color.fromRGBO(254, 206, 1, 1):Color.fromRGBO(245,247,249,250),
                    label:Text(filter),
                  labelStyle: const TextStyle(fontSize:16),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  ),
                ),
              );
            },
            ),
        ),
      Expanded(
          child: ListView.builder(itemCount:products.length,
          itemBuilder: (context,index){
            final product=products[index];
            return GestureDetector(
              onTap:(){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context){
                    return ProductDetailsPage(product: product);
                  },
                  ),
                );
              },
          
           child: ProductCard(
            title:product['title'] as String,
            price:product['price'] as double,
            image:product['imagesUrl'] as String,
            backgroundColor:index.isEven ?const Color.fromRGBO(216, 240, 253, 1):
             const Color.fromRGBO(245,247,249,1),),  
            );
          },
          
          ),
        ),
        ],
      ),
      
    );
  }
}