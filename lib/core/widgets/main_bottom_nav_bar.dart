import 'package:book_app/features/account/account_page.dart';
import 'package:book_app/features/cart/cart_page.dart';
import 'package:book_app/features/category/categories_page.dart';
import 'package:book_app/features/home/home_view.dart';
import 'package:book_app/core/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavItem {
  final IconData icon;
  final String label;

  NavItem({required this.icon, required this.label});
}

class ModernBottomNavBar extends GetView<NavController> {
  const ModernBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeView(),
      const CategoriesPage(),
      const CartPage(),
      const AccountPage(),
    ];

    final List<NavItem> navItems = [
      NavItem(icon: Icons.home_rounded, label: 'Home'),
      NavItem(icon: Icons.category_rounded, label: 'Categories'),
      NavItem(icon: Icons.shopping_bag_rounded, label: 'Cart'),
      NavItem(icon: Icons.person_rounded, label: 'Account'),
    ];

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white, // الخلفية بيضاء
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navItems.length, (index) {
            final item = navItems[index];
            return Obx(() {
              final isSelected = controller.selectedIndex.value == index;

              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // المؤشر الصغير تحت الأيقونة
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 4,
                        width: isSelected ? 24 : 0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Icon(
                        item.icon,
                        size: isSelected ? 28 : 24,
                        color: isSelected ? Colors.black : Colors.grey.shade500,
                      ),
                      const SizedBox(height: 2),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          fontSize: isSelected ? 12 : 11,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? Colors.black : Colors.grey.shade500,
                        ),
                        child: Text(item.label),
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}
