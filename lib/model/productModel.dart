class ProductModel {
  String avatar;
  num category_id;
  String currency;

  num discount;

  num id;

  num price;
  num price_final;
  num price_final_text;
  num in_stock;
  String title;
  String name;
  String discount_type;
  String description;

  ProductModel({
    this.avatar,
    this.category_id,
    this.currency,
    this.description,
    this.discount,
    this.discount_type,
    this.id,
    this.in_stock,
    this.name,
    this.price,
    this.price_final,
    this.price_final_text,
    this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'avatar': this.avatar,
      'category_id': this.category_id,
      'currency': this.currency,
      'description': this.description,
      'discount': this.discount,
      'discount_type': this.discount_type,
      'id': this.id,
      'in_stock': this.in_stock,
      'name': this.name,
      'price': this.price,
      'price_final': this.price_final,
      'price_final_text': this.price_final_text,
      'title': this.title,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      avatar: map['avatar'] as String,
      category_id: map['category_id'] as num,
      currency: map['currency'] as String,
      description: map['description'] as String,
      discount: map['discount'] as num,
      discount_type: map['discount_type'] as String,
      id: map['id'] as num,
      in_stock: map['in_stock'] as num,
      name: map['name'] as String,
      price: map['price'] as num,
      price_final: map['price_final'] as num,
      price_final_text: map['price_final_text'] as num,
      title: map['title'] as String,
    );
  }
}
