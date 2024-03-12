class Food {
  String name;
  String imagePath;
  String recipes;
  String howto;
  String linkclip;




  Food({required this.name, required this.imagePath, required this.recipes, required this.howto, required this.linkclip});

  String get _name => name;
  String get _imagePathe => imagePath;

}