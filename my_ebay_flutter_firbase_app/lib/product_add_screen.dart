import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'database_service.dart';
import 'globals.dart';
import 'models/product_model.dart';
import 'my_widgets/textfield_number_widget.dart';
import 'my_widgets/textfield_widget.dart';

class ProductAddScreen extends StatefulWidget {
  ProductAddScreen({Key key, this.isUpdate, this.mProductModel}) : super(key: key);
  final bool isUpdate;
  final ProductModel mProductModel;

  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  int _selectedSize = 1;
  int _selectedColor = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.isUpdate && widget.mProductModel != null) {
      _productNameController = TextEditingController(text: widget.mProductModel.productName);
      _productPriceController = TextEditingController(text: widget.mProductModel.productPrice.toString());
      _selectedColor = widget.mProductModel.colorCode;
      _selectedSize = widget.mProductModel.sizeCode;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.isUpdate ? "Product Details Update" : 'Product Registration'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            TextFieldWidget(
              hintText: 'Product Name',
              obscureText: false,
              prefixIconData: Icons.person_outline,
              textEditingController: _productNameController,
              autofocus: false,
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
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                'Size',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _selectedSize = 0),
                    child: Container(
                      width: 80,
                      height: 30,
//                      color: _value == 0 ? Colors.deepPurpleAccent : Colors.grey,
                      child: Center(
                          child: Text(
                        'Small',
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                        color: _selectedSize == 0 ? Colors.deepPurpleAccent : Colors.grey[400],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => setState(() => _selectedSize = 1),
                    child: Container(
                      width: 80,
                      height: 30,
                      child: Center(
                          child: Text(
                        'Medium',
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                        color: _selectedSize == 1 ? Colors.deepPurpleAccent : Colors.grey[400],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => setState(() => _selectedSize = 2),
                    child: Container(
                      width: 80,
                      height: 30,
                      child: Center(
                          child: Text(
                            'Large',
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                        color: _selectedSize == 2 ? Colors.deepPurpleAccent : Colors.grey[400],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                'Colour',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _selectedColor = 0),
                    child: Container(
                      width: 50,
                      height: 30,
                      child: Center(
                          child: Text(
                            'RED',
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                        color: _selectedColor == 0 ? Colors.red : Colors.grey[400],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => setState(() => _selectedColor = 1),
                    child: Container(
                      width: 50,
                      height: 30,
                      child: Center(
                          child: Text(
                            'BLUE',
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                        color: _selectedColor == 1 ? Colors.blue : Colors.grey[400],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => setState(() => _selectedColor = 2),
                    child: Container(
                      width: 50,
                      height: 30,
                      child: Center(
                          child: Text(
                            'GREEN',
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                        color: _selectedColor == 2 ? Colors.green : Colors.grey[400],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => setState(() => _selectedColor = 3),
                    child: Container(
                      width: 50,
                      height: 30,
//                      color: _value == 0 ? Colors.deepPurpleAccent : Colors.grey,
                      child: Center(
                          child: Text(
                            'BLACK',
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                        color: _selectedColor == 3 ? Colors.black : Colors.grey[400],
                        border: Border.all(
                          color: Colors.deepPurpleAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            widget.isUpdate ? RaisedButton.icon(
              onPressed: () {

                if(_productNameController.text != "" && _productPriceController.text != ""){

                  ProductModel updatedProductModel = widget.mProductModel;
                  updatedProductModel.productName = _productNameController.text;
                  updatedProductModel.productPrice = double.parse(_productPriceController.text);
                  updatedProductModel.sizeCode = _selectedSize;
                  updatedProductModel.colorCode = _selectedColor;
                  _updateProductModel(updatedProductModel);

                } else {
                  Globals().displaySnackBar(_scaffoldKey, 'Please fill all the details', 2);
                }

              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(top: 14.0, bottom: 14.0, left: 30, right: 30),
              color: Colors.deepPurpleAccent,
              icon: Icon(
                Icons.update,
                color: Colors.white,
              ),
              label: Text(
                'Update Product',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ) :RaisedButton.icon(
              onPressed: () {
                if(_productNameController.text != "" && _productPriceController.text != "" ){

                  ProductModel mProductModel = ProductModel();
                  mProductModel.productName = _productNameController.text;
                  mProductModel.productPrice = double.parse(_productPriceController.text);
                  mProductModel.sizeCode = _selectedSize;
                  mProductModel.colorCode = _selectedColor;
                  mProductModel.createdDate = Timestamp.now();

                  _createNewProduct(mProductModel);
                } else {
                  Globals().displaySnackBar(_scaffoldKey, 'Please fill all the details', 2);
                }

              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(top: 14.0, bottom: 14.0, left: 30, right: 30),
              color: Colors.deepPurpleAccent,
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                'Save Product',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            // todo Date Picker
          ],
        ),
      ),
    );
  }

  void _createNewProduct(ProductModel productModel) async {

    if (await DatabaseService().createNewProduct(productModel)) {
      Navigator.of(context).pop();
    }
  }

  void _updateProductModel(ProductModel productModel) async {

    await DatabaseService().updateProductModel(productModel);
    Navigator.of(context).pop();
  }


}
