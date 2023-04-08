class CustomizedData {
  List<CustomerList>? customerList;

  CustomizedData({this.customerList});

  CustomizedData.fromJson(Map<String, dynamic> json) {
    if (json['customer_list'] != null) {
      customerList = <CustomerList>[];
      json['customer_list'].forEach((v) {
        customerList!.add(CustomerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerList != null) {
      data['customer_list'] =
          customerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerList {
  List<String>? iceCubes;
  List<String>? sewwtness;
  List<Feed>? feed;

  CustomerList({this.iceCubes, this.sewwtness, this.feed});

  CustomerList.fromJson(Map<String, dynamic> json) {
    iceCubes = json['ice_cubes'].cast<String>();
    sewwtness = json['sewwtness'].cast<String>();
    if (json['feed'] != null) {
      feed = <Feed>[];
      json['feed'].forEach((v) {
        feed!.add(Feed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ice_cubes'] = iceCubes;
    data['sewwtness'] = sewwtness;
    if (feed != null) {
      data['feed'] = feed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feed {
  String? title;
  int? price;

  Feed({this.title, this.price});

  Feed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    return data;
  }
}
// class CustomizedData {
//   List<CustomerList>? customerList;
//
//   CustomizedData({this.customerList});
//
//   CustomizedData.fromJson(Map<String, dynamic> json) {
//     if (json['customer_list'] != null) {
//       customerList = <CustomerList>[];
//       json['customer_list'].forEach((v) {
//         customerList!.add(CustomerList.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (customerList != null) {
//       data['customer_list'] =
//           customerList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class CustomerList {
//   List<String>? iceCubes;
//   List<String>? sewwtness;
//   List<Feed>? feed;
//
//   CustomerList({this.iceCubes, this.sewwtness, this.feed});
//
//   CustomerList.fromJson(Map<String, dynamic> json) {
//     iceCubes = json['ice_cubes'].cast<String>();
//     sewwtness = json['sewwtness'].cast<String>();
//     if (json['feed'] != null) {
//       feed = <Feed>[];
//       json['feed'].forEach((v) {
//         feed!.add(Feed.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['ice_cubes'] = iceCubes;
//     data['sewwtness'] = sewwtness;
//     if (feed != null) {
//       data['feed'] = feed!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Feed {
//   String? title;
//   int? price;
//
//   Feed({this.title, this.price});
//
//   Feed.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     price = json['price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = title;
//     data['price'] = price;
//     return data;
//   }
// }