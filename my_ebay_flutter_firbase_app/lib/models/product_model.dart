import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String productId;
  String productName;
  double productPrice;
  int sizeCode;
  int colorCode;
  String imageUrl;
  Timestamp createdDate;

  ProductModel(
      {this.productId,
        this.productName,
        this.productPrice,
        this.sizeCode,
        this.colorCode,
        this.imageUrl,
        this.createdDate});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    sizeCode = json['sizeCode'];
    colorCode = json['colorCode'];
    imageUrl = json['imageUrl'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['sizeCode'] = this.sizeCode;
    data['colorCode'] = this.colorCode;
    data['imageUrl'] = this.imageUrl;
    data['createdDate'] = this.createdDate;
    return data;
  }
}