import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_ebay_flutter_firbase_app/globals.dart';
import 'package:my_ebay_flutter_firbase_app/models/product_model.dart';
import 'package:my_ebay_flutter_firbase_app/product_details_screen.dart';

import 'database_service.dart';
import 'product_add_screen.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({Key key,}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool isAddMemberEnable = false;

  Stream<List<ProductModel>> settingMemberList;
  Stream<QuerySnapshot> productsList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productsList = DatabaseService().getMembersList();

    return Scaffold(
      appBar: AppBar(
        title: Text('E-Com App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
//          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            StreamBuilder(
              stream: productsList,
              builder: (context, snapshot) {

                if (!snapshot.hasData) return Center(child: Text('Loading...'));

                if (snapshot.data.documents.length == 0) return Center(child: Text('Empty Product List'));

                return Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext newContext, int index) {
                      DocumentSnapshot documentSnapShot = snapshot.data.documents[index];
                      ProductModel memberModel = ProductModel.fromJson(documentSnapShot.data());
                      return Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0, bottom: 4.0),
                        child: Slidable(
                          key: ValueKey(index),
                          actionPane: SlidableDrawerActionPane(),
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  offset: Offset(
                                    3.0, // Move to right 10  horizontally
                                    3.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen(
                                          memberModel: memberModel,
                                        )));
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/311UE71HI0L._SX425_.jpg'),
                              ),
                              title: Row(
                                children: <Widget>[
                                  Text(memberModel.productName),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Color: '),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Globals().getColorCode(memberModel.colorCode),
                                      ),
                                    ],
                                  ),
                                  Text('Rs: ${memberModel.productPrice}'),

                                ],
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ), // ;

                          secondaryActions: [
                            Container(
                              decoration:
                              new BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                              child: IconSlideAction(
                                caption: 'Update',
                                color: Colors.transparent,
                                icon: Icons.edit,
                                closeOnTap: false,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductAddScreen(
                                              isUpdate: true,
                                              mProductModel: memberModel,
                                            )),
                                  );
                                },
                              ),
                            ),
                            Container(
                              decoration:
                              new BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(15)),
                              child: IconSlideAction(
                                caption: 'Delete',
                                color: Colors.transparent,
                                icon: Icons.delete,
                                closeOnTap: false,
                                onTap: () {
                                  showDeleteConfirmAlertDialog(context, memberModel);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            // todo Date Picker
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductAddScreen(
                      isUpdate: false,
                      mProductModel: null,
                    )),
          );
        },
        icon: Icon(Icons.add),
        label: Text('PRODUCT'),
      ),
    );
  }

  showDeleteConfirmAlertDialog(BuildContext newContext, ProductModel productModel) {
    // set up the buttons
    Widget acceptButton = MaterialButton(
      onPressed: () {
        DatabaseService().deleteProduct(productModel).then((value) {
          Navigator.pop(newContext);
        });
      },
      child: Text("YES"),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

    Widget declineButton = MaterialButton(
      onPressed: () {
        Navigator.pop(newContext);
      },
      child: Text("NO"),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      color: Colors.redAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(children: [
        Icon(
          Icons.warning,
          color: Colors.redAccent,
        ),
        Text(" DELETE"),
      ]),
      content: Text("Do you really want to delete this Product ?"),
      actions: [
        acceptButton,
        SizedBox(
          width: 10,
        ),
        declineButton,
      ],
    );

    // show the dialog
    showDialog(
      context: newContext,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
