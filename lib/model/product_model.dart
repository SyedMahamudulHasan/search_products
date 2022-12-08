class ProductsModel {
  String? status;
  Data? data;

  ProductsModel({this.status, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Products? products;

  Data({ this.products});

  Data.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ?  Products.fromJson(json['products'])
        : null;
  }

}

class Products {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  Products({this.count, this.next, this.previous, this.results});

  Products.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add( Results.fromJson(v));
      });
    }
  }
}

class Results {
  int? id;
  Brand? brand;
  String? image;
  Charge? charge;
  List<Images>? images;
  String? slug;
  String? productName;
  String? model;
  String? commissionType;
  String? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  int? maximumOrder;
  int? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  int? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;
  String? badge;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? language;
  String? seller;
  String? combo;
  String? createdBy;
  String? updatedBy;


  Results(
      {this.id,
      this.brand,
      this.image,
      this.charge,
      this.images,
      this.slug,
      this.productName,
      this.model,
      this.commissionType,
      this.amount,
      this.tag,
      this.description,
      this.note,
      this.embaddedVideoLink,
      this.maximumOrder,
      this.stock,
      this.isBackOrder,
      this.specification,
      this.warranty,
      this.preOrder,
      this.productReview,
      this.isSeller,
      this.isPhone,
      this.willShowEmi,
      this.badge,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.language,
      this.seller,
      this.combo,
      this.createdBy,
      this.updatedBy,});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'] != null ?  Brand.fromJson(json['brand']) : null;
    image = json['image'];
    charge =
        json['charge'] != null ?  Charge.fromJson(json['charge']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add( Images.fromJson(v));
      });
    }
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];
    badge = json['badge'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'];
    seller = json['seller'];
    combo = json['combo'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    }
  }

 


class Brand {
  String? name;
  String? image;
  String? headerImage;
  String? slug;

  Brand({this.name, this.image, this.headerImage, this.slug});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    headerImage = json['header_image'];
    slug = json['slug'];
  }
}

class Charge {
  double? bookingPrice;
  double? currentCharge;
  String? discountCharge;
  double? sellingPrice;
  double? profit;
  bool? isEvent;
  String? eventId;
  bool? highlight;
  String? highlightId;
  bool? groupping;
  String? grouppingId;
  String? campaignSectionId;
  bool? campaignSection;
  String? message;

  Charge(
      {this.bookingPrice,
      this.currentCharge,
      this.discountCharge,
      this.sellingPrice,
      this.profit,
      this.isEvent,
      this.eventId,
      this.highlight,
      this.highlightId,
      this.groupping,
      this.grouppingId,
      this.campaignSectionId,
      this.campaignSection,
      this.message});

  Charge.fromJson(Map<String, dynamic> json) {
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];
    discountCharge = json['discount_charge'];
    sellingPrice = json['selling_price'];
    profit = json['profit'];
    isEvent = json['is_event'];
    eventId = json['event_id'];
    highlight = json['highlight'];
    highlightId = json['highlight_id'];
    groupping = json['groupping'];
    grouppingId = json['groupping_id'];
    campaignSectionId = json['campaign_section_id'];
    campaignSection = json['campaign_section'];
    message = json['message'];
  }
}

class Images {
  int? id;
  String? image;
  bool? isPrimary;
  int? product;

  Images({this.id, this.image, this.isPrimary, this.product});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }
}
