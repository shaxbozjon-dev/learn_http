
// "rating": {
// "rate": 3.9,
// "count": 120
// }
// },
class Model {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;


  Model( {required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,

  });

  factory Model.fromJson(Map<String, dynamic>json)=>
      Model(
          id:json["id"],
          title: json['title'],
          price: json['price'],
          description: json['description'],
          category: json['category'],
          image: json['image'],

      );
          
}
class Rating{
  final double rate;
  final int count;
  Rating({required this.count,required this.rate});
   factory Rating.fromJson(Map<String,dynamic>json)=>Rating(count: json["count"], rate:json["rate"]);
  
}