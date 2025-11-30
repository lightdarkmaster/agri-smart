import 'package:agrismart/pages/cart.dart';
import 'package:flutter/material.dart';

class MarketplaceHome extends StatefulWidget {
  const MarketplaceHome({super.key});

  @override
  State<MarketplaceHome> createState() => _MarketplaceHomeState();
}

class _MarketplaceHomeState extends State<MarketplaceHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Vegetables',
      'icon': '🥬',
      'products': [
        {'name': 'Tomatoes', 'price': '₱45/kg', 'image': '🍅', 'rating': 4.5, 'reviews': 128, 'description': 'Fresh & juicy'},
        {'name': 'Carrots', 'price': '₱38/kg', 'image': '🥕', 'rating': 4.8, 'reviews': 95, 'description': 'Organic & crunchy'},
        {'name': 'Lettuce', 'price': '₱52/kg', 'image': '🥬', 'rating': 4.3, 'reviews': 67, 'description': 'Crisp & green'},
        {'name': 'Onions', 'price': '₱35/kg', 'image': '🧅', 'rating': 4.6, 'reviews': 112, 'description': 'Premium quality'},
        {'name': 'Cabbage', 'price': '₱42/kg', 'image': '🥗', 'rating': 4.4, 'reviews': 84, 'description': 'Farm fresh'},
      ]
    },
    {
      'name': 'Fruits',
      'icon': '🍎',
      'products': [
        {'name': 'Apples', 'price': '₱120/kg', 'image': '🍎', 'rating': 4.9, 'reviews': 203, 'description': 'Sweet & crispy'},
        {'name': 'Bananas', 'price': '₱65/kg', 'image': '🍌', 'rating': 4.7, 'reviews': 156, 'description': 'Ripe & delicious'},
        {'name': 'Mangoes', 'price': '₱95/kg', 'image': '🥭', 'rating': 5.0, 'reviews': 189, 'description': 'Sweet & tropical'},
        {'name': 'Oranges', 'price': '₱85/kg', 'image': '🍊', 'rating': 4.6, 'reviews': 142, 'description': 'Juicy & vitamin C'},
        {'name': 'Grapes', 'price': '₱150/kg', 'image': '🍇', 'rating': 4.8, 'reviews': 178, 'description': 'Seedless & fresh'},
      ]
    },
    {
      'name': 'Grains',
      'icon': '🌾',
      'products': [
        {'name': 'Rice', 'price': '₱50/kg', 'image': '🍚', 'rating': 4.7, 'reviews': 234, 'description': 'Premium jasmine'},
        {'name': 'Corn', 'price': '₱35/kg', 'image': '🌽', 'rating': 4.5, 'reviews': 98, 'description': 'Sweet & tender'},
        {'name': 'Wheat', 'price': '₱45/kg', 'image': '🌾', 'rating': 4.4, 'reviews': 76, 'description': 'Whole grain'},
        {'name': 'Oats', 'price': '₱65/kg', 'image': '🥣', 'rating': 4.6, 'reviews': 145, 'description': 'Healthy & fiber'},
        {'name': 'Barley', 'price': '₱55/kg', 'image': '🌾', 'rating': 4.3, 'reviews': 63, 'description': 'Nutritious grain'},
      ]
    },
    {
      'name': 'Livestock',
      'icon': '🐄',
      'products': [
        {'name': 'Chicken', 'price': '₱180/kg', 'image': '🐔', 'rating': 4.8, 'reviews': 267, 'description': 'Free-range fresh'},
        {'name': 'Eggs', 'price': '₱8/piece', 'image': '🥚', 'rating': 4.9, 'reviews': 312, 'description': 'Farm fresh daily'},
        {'name': 'Beef', 'price': '₱350/kg', 'image': '🥩', 'rating': 4.7, 'reviews': 189, 'description': 'Premium cuts'},
        {'name': 'Pork', 'price': '₱280/kg', 'image': '🥓', 'rating': 4.6, 'reviews': 223, 'description': 'Lean & tender'},
        {'name': 'Milk', 'price': '₱85/liter', 'image': '🥛', 'rating': 4.8, 'reviews': 198, 'description': 'Fresh & creamy'},
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2E7D32)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: const [
            SizedBox(width: 8),
            Text(
              'Agri-Smart',
              style: TextStyle(
                color: Color(0xFF2E7D32),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF2E7D32)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: const Color(0xFF2E7D32),
              indicatorWeight: 3,
              labelColor: const Color(0xFF2E7D32),
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              tabs: categories.map((category) {
                return Tab(
                  child: Row(
                    children: [
                      Text(
                        category['icon'],
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 6),
                      Text(category['name']),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                return CategoryView(
                  categoryName: category['name'],
                  products: category['products'],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> products;

  const CategoryView({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fresh $categoryName',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Directly from local farmers',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Popular Picks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CompactProductCard(product: products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Color(0xFFF1F8F4),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Text(
                product['image'],
                style: const TextStyle(fontSize: 56),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B5E20),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  product['description'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFA726), size: 13),
                    const SizedBox(width: 3),
                    Text(
                      product['rating'].toString(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '(${product['reviews']})',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['price'],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompactProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const CompactProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF1F8F4),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Text(
                  product['image'],
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B5E20),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  product['description'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFA726), size: 13),
                    const SizedBox(width: 4),
                    Text(
                      product['rating'].toString(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '(${product['reviews']})',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[500],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product['price'],
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}