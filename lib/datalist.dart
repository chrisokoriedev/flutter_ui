class Products {
  final String title;
  final String imgDir;
  final int price;

  Products({
    required this.title,
    required this.imgDir,
    required this.price,
  });
}

List<Products> productsDetail = [
  Products(title: 'Macbook pro M1', imgDir: 'assets/mac.jpg', price: 2000),
  Products(title: 'Skytech Shadow ', imgDir: 'assets/pc.png', price: 1500),
  Products(title: 'Hp Pavilion Aero 13', imgDir: 'assets/hp.jpg', price: 2000),
  Products(title: 'Dell Xps 2021', imgDir: 'assets/dell-xps.jpg', price: 2000),
  Products(title: 'Macbook pro M1', imgDir: 'assets/mac.jpg', price: 2000),
  Products(title: 'Macbook pro M1', imgDir: 'assets/mac.jpg', price: 2000),
];
