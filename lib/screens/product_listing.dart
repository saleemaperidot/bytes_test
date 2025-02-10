import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:providerskel/provider/product_provider.dart';
import 'package:providerskel/screens/products_list.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({super.key});

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    ProductProvider().getProducts(null);

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      ProductProvider().loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ProductProvider().getProducts(null);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("ITEMS"),
      ),
      body: SafeArea(
          child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: double.infinity,
              color: Color.fromRGBO(255, 235, 59, 1),
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemCount: value.category.length + 1,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 5,
                            );
                          },
                          itemBuilder: (context, index) {
                            //category[index];
                            return InkWell(
                              onTap: () {
                                if (index == 0) {
                                  ProductProvider().getProducts(null);
                                } else {
                                  ProductProvider().getSpecificProducts(
                                      value.category[index - 1].id!);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      //radius: 20,
                                      child: ClipRRect(
                                        clipBehavior: Clip.hardEdge,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: index == 0
                                            ? SizedBox()
                                            : Image(
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.fill,
                                                image: NetworkImage(value
                                                    .category[index - 1]
                                                    .image!)),
                                      ),
                                    ),
                                    index == 0
                                        ? Text("All")
                                        : Text(value.category[index - 1].title!)
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              )),
          Expanded(child: Consumer<ProductProvider>(
            builder: (context, value, child) {
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification.metrics.pixels >=
                      scrollNotification.metrics.maxScrollExtent - 100) {
                    Provider.of<ProductProvider>(context, listen: false)
                        .loadMore();
                  }
                  return false;
                },
                child: GridView.count(
                  padding: const EdgeInsets.all(3),
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: 0.8,
                  children: List.generate(
                    value.product.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Product_screen(
                              product: value.product[index],
                            ),
                          ));
                        },
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.36,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      image: NetworkImage(
                                          value.product[index].image![0].url!)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("500g"),
                                  Text("Energy roaster")
                                ],
                              ),
                              Text(value.product[index].title!),
                              Text(value.product[index].statusText!),
                              Text(value.product[index].discountPrice!
                                  .toString())
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}
