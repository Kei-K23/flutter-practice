import 'package:flutter/material.dart';
import 'package:flutter_application_1/modes/category.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Category> categories = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [header(), SizedBox(height: 20), category()],
      ),
    );
  }

  Container category() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (var category in categories) {
                      category.isSelected = false;
                    }
                    categories[index].isSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: categories[index].isSelected
                          ? const Color(0xff51A8FF)
                          : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: categories[index].isSelected
                              ? const Color(0xff51A8FF).withValues(alpha: .45)
                              : const Color(0xff050618).withValues(alpha: .05),
                          offset: const Offset(0, 4),
                          blurRadius: 25,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      categories[index].vector,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                      semanticsLabel: categories[index].name,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }

  Container header() {
    return Container(
      color: Colors.blue.shade200,
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hello, Gojo 👋🏻",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  fit: BoxFit.contain,
                  semanticsLabel: "Bell",
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          const Text(
            "Let find\nyour top doctor",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: const TextStyle(fontWeight: FontWeight.w300),
              prefixIcon: const Icon(Icons.search, size: 25),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
