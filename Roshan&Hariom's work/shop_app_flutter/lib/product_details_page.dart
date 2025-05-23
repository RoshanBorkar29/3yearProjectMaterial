import 'package:flutter/material.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:provider/provider.dart';
//import 'package:shop_app_flutter/global_varaiable.dart';

class ProductDetailsPage extends StatefulWidget {
 final Map<String,Object> product;//to get access of the product

  const ProductDetailsPage({super.key,
  required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
 int selectedSize=0;
 void onTap(){
  if(selectedSize!=0){
Provider.of<CartProvider>(context,listen:false).addProduct(    {
    'id':widget.product['id'],
    'title':widget.product['title'],
    'price':widget.product['price'],
    'imagesUrl':widget.product['imagesUrl'],
    'company':widget.product['company'],
    'size':selectedSize,
  },
  );
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product added Successfully!'),),
    );
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please select a Size!'),),
    );
  }
 
      
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Details'),),
        body:Column(children:[
          Text(widget.product['title'] as String,style: Theme.of(context).textTheme.titleLarge,),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(widget.product['imagesUrl'] as String),
        ),
        const Spacer(flex:2),
        Container(
          height:250,
          decoration:BoxDecoration(
            color:const Color.fromRGBO(245, 247, 249, 1),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              Text(
                '\$${widget.product['price']}',
                style:Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height:50,
                child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount:(widget.product['sizes']as List<int>).length,
                itemBuilder:(Context,index){
                  final size=(widget.product['sizes'] as List<int>)[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:GestureDetector(
                      onTap:(){
                        setState((){
                          selectedSize=size;
                        });
                      },
                  
                    child:Chip(label:Text(size.toString()),
                    backgroundColor: selectedSize==size?Theme.of(context).colorScheme.primary:null,
                    ),
                      ),
                  );
                },
                ),
              ),
              const SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed:onTap,
                  style:ElevatedButton.styleFrom(
                    backgroundColor:Theme.of(context).colorScheme.primary,
                  minimumSize:const Size(double.infinity,50),
                  ),
                  child:const Text('Add to cart',style:TextStyle(color:Colors.black,
                  fontSize:18),),),
              ),
            ],
          ),
        )
        ],
        )
    );
  }
}