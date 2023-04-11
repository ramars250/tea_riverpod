class CustomizedData {
  List<CustomerList>? customerList;

  CustomizedData({this.customerList});

  CustomizedData.fromJson(Map<String, dynamic> json) {
    if (json['customer_list'] != null && json['customer_list'].isNotEmpty) {
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
    iceCubes = json['ice_cubes'] != null ? List<String>.from(json['ice_cubes']) : [];
    sewwtness = json['sewwtness']!= null ? List<String>.from(json['sewwtness']) : [];
    if (json['feed'] != null) {
      feed = <Feed>[];
      json['feed'].forEach((v) {
        feed!.add(Feed.fromJson(v));
      });
    } else {
      feed = null;
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
//   List<CustomerList> customerList;
//
//   CustomizedData({this.customerList});
//
//   factory CustomizedData.fromJson(Map<String, dynamic> json) => CustomizedData(
//         customerList: List<CustomerList>.from(
//             json['customer_list'].map((x) => CustomizedData.fromJson(x))),
//       );
// }
//
// class CustomerList {
//   List<String> iceCubes;
//   List<String> sewwtness;
//   List<Feed> feed;
//
//   CustomerList({this.iceCubes, this.sewwtness, this.feed});
//
//   factory CustomerList.fromJson(Map<String, dynamic> json) => CustomerList(
//         iceCubes: json['ice_cubes'] == null
//             ? null
//             : List<String>.from(json['ice_cubes'].map((x) => x)),
//         sewwtness: json['sewwtness'] == null
//             ? null
//             : List<String>.from(json['sewwtness'].map((x) => x)),
//         feed: json['feed'] == null
//             ? null
//             : List<Feed>.from(json['feed'].map((x) => Feed.fromJson(x))),
//       );
// }
//
// class Feed {
//   String? title;
//   int? price;
//
//   Feed({this.title, this.price});
//
//   factory Feed.fromJson(Map<String, dynamic> json) => Feed(
//         title: json['title'],
//         price: json['price'],
//       );
// }