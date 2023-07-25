class Contact {
  int id;
  String name;
  String phoneNumber;
  String email;
  Contact(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      this.email = ''});
}
