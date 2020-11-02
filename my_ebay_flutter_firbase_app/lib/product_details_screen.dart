import 'package:flutter/material.dart';

import 'globals.dart';
import 'models/product_model.dart';
import 'my_widgets/textfield_number_widget.dart';
import 'my_widgets/textfield_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key key, this.memberModel}) : super(key: key);
  final ProductModel memberModel;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _productNameController;
  TextEditingController _productPriceController = TextEditingController();
  TextEditingController _productSizeCodeController = TextEditingController();
  //
  // List<charts.Series> seriesList;
  bool animate;

  @override
  void initState() {
    super.initState();

    _productNameController = TextEditingController(text: '${widget.memberModel.productName}');
    _productPriceController = TextEditingController(text: 'Rs: ${widget.memberModel.productPrice}');
    _productSizeCodeController = TextEditingController(text: '${widget.memberModel.sizeCode}');
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Product Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/2,
              child: Image.network('https://images-na.ssl-images-amazon.com/images/I/311UE71HI0L._SX425_.jpg'),
            ),

            SizedBox(
              height: 8,
            ),
            TextFieldWidget(
              hintText: 'Product Name',
              obscureText: false,
              prefixIconData: Icons.library_books,
              textEditingController: _productNameController,
              autofocus: false,
              enable: false,
            ),
            SizedBox(
              height: 8,
            ),
            TextFieldNumberWidget(
              hintText: 'Price',
              obscureText: false,
              prefixIconData: Icons.monetization_on_outlined,
              textEditingController: _productPriceController,
              autofocus: false,
              enable: false,
            ),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Color: '),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Globals().getColorCode(widget.memberModel.colorCode),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Size: '),
                    Text(Globals().getSizeCode(widget.memberModel.sizeCode),
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            
          ],
        ),
      ),
    );
  }
}


