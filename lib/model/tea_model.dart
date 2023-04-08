class TeaList {
  List<TeaData>? teaData;

  TeaList({this.teaData});

  TeaList.fromJson(Map<String, dynamic> json) {
    if (json['tea_data'] != null) {
      teaData = <TeaData>[];
      json['tea_data'].forEach((v) {
        teaData!.add(TeaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teaData != null) {
      data['tea_data'] = teaData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeaData {
  String? kindTitle;
  List<Items>? items;

  TeaData({this.kindTitle, this.items});

  TeaData.fromJson(Map<String, dynamic> json) {
    kindTitle = json['kind_title'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind_title'] = kindTitle;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? itemTitle;
  List<String>? size;
  int? bPrice;
  int? coldPrice;
  int? hotPrice;

  Items(
      {this.itemTitle, this.size, this.bPrice, this.coldPrice, this.hotPrice});

  Items.fromJson(Map<String, dynamic> json) {
    itemTitle = json['item_title'];
    size = json['size'].cast<String>();
    bPrice = json['b_price'];
    coldPrice = json['cold_price'];
    hotPrice = json['hot_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_title'] = itemTitle;
    data['size'] = size;
    data['b_price'] = bPrice;
    data['cold_price'] = coldPrice;
    data['hot_price'] = hotPrice;
    return data;
  }
}
