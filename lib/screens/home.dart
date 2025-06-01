import 'package:flutter/material.dart';
import 'package:flutter_application_1/modes/category.dart';
import 'package:flutter_application_1/modes/doctor.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Category> categories = Category.getCategories();
  final List<Doctor> doctors = Doctor.getDoctors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerSection(),
          SizedBox(height: 20),
          categorySection(),
          Expanded(child: doctorSection()),
        ],
      ),
    );
  }

  Container categorySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 80,
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
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: categories[index].isSelected
                          ? Colors.blue.shade200
                          : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: categories[index].isSelected
                              ? Colors.blue.shade200.withValues(alpha: .9)
                              : Colors.black.withValues(alpha: .1),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
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

  Container headerSection() {
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

  Widget doctorSection() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: doctors[index].imageBox,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(doctors[index].image),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctors[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            doctors[index].specialties.first,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 5),
                          Text(doctors[index].score.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemCount: doctors.length,
    );
  }
}
