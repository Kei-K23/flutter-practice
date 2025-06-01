class Category {
  final String vector;
  final String name;
  bool isSelected;

  Category({
    required this.name,
    required this.vector,
    required this.isSelected,
  });

  static List<Category> getCategories() {
    return [
      Category(name: "All", vector: "assets/icons/all.svg", isSelected: true),
      Category(
        name: "Dental",
        vector: "assets/icons/dental.svg",
        isSelected: false,
      ),
      Category(
        name: "Heart",
        vector: "assets/icons/heart.svg",
        isSelected: false,
      ),
      Category(name: "Eye", vector: "assets/icons/eye.svg", isSelected: false),
      Category(
        name: "Brain",
        vector: "assets/icons/brain.svg",
        isSelected: false,
      ),
    ];
  }
}
