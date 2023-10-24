


class Contact {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  Contact({required this.id, required this.firstName, required this.lastName, required this.phoneNumber});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
  }
}
