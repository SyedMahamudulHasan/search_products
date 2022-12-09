import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:search_products/controller/data_controller.dart';
import 'package:search_products/model/product_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _searchController;
  ProductsModel? products;

  _getProducts(String product) async {
    products = await Provider.of<DataController>(context, listen: false)
        .getProducts(productName: product);
    print(products!.data!.products!.results!.length);
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 16, vertical: size.height * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search field
              Container(
                height: size.height * 0.08,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Center(
                  child: TextFormField(
                    controller: _searchController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Color(0xffA7A7A7),
                      ),
                    ),
                    onChanged: (productPattern) {
                      _getProducts(productPattern);
                    },
                  ),
                ),
              ),
              //products
              SizedBox(
                height: size.height * 0.80,
                child: GridView.builder(
                  itemCount: products != null
                      ? products!.data!.products!.results!.length
                      : 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    if (products != null) {
                      return productCardWidget(
                          size, products!.data!.products!.results![index]);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container productCardWidget(Size size, Results results) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: size.height*0.25,
      width: size.width * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image(image: NetworkImage(results.image!), alignment: Alignment.center, height: size.height*0.09, fit: BoxFit.fill,)),
          //product name and type
          DefaultTextStyle(
            style: TextStyle(
              fontFamily: "poppins",
              color: const Color(0xff323232),
              fontWeight: FontWeight.w500,
              fontSize: size.width * 0.03,
            ),
            child: Text(
                  results.productName!,
                ),
          ),
          //poduct price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              priceTextWidget(size: size, color: const Color(0xffda2079),price: results.charge!.currentCharge!),
              
              Text(
                results.charge!.discountCharge!.toString(),
                style: TextStyle(
                    color: const Color(0xffda2079),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough,
                    fontSize: size.width * 0.035),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              priceTextWidget(size: size, color: const Color(0xffda2079), price: results.charge!.sellingPrice!),
              Text(
                '৳ 20.00',
                style: TextStyle(
                    color: const Color(0xffda2079),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough,
                    fontSize: size.width * 0.035),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget priceTextWidget({size, color = const Color(0xffda2079), price}) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
            text: 'sell ',
            style: TextStyle(
              fontSize: size.width * 0.03,
              fontFamily: "baloo da2",
              fontWeight: FontWeight.w400,
            )),
        TextSpan(
          text: price.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: size.width * 0.04,
            color: color,
          ),
        ),
      ],
    ));
  }
}
