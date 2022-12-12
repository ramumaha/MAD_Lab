class Planets {
  late final int id;
  late final String name;
  late final int phone_number;


  Planets({
    required this.id,
    required this.name,
    required this.phone_number,

  });

  Planets.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        name = result["name"],
        phone_number = result["phone_number"];
  Map<String,Object> toMap() {
    return {
      'id': id,
      'name': name,
      'phone_number': phone_number
    };
  }
}