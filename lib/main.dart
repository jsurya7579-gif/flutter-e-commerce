
import 'package:flutter/material.dart';

void main() {
  runApp(const WatchStoreApp());
}

// ======================================================
// APP
// ======================================================

class WatchStoreApp extends StatelessWidget {
  const WatchStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// ======================================================
// WATCH MODEL
// ======================================================

class Watch {
  final String name;
  final double price;
  final String image;

  Watch({
    required this.name,
    required this.price,
    required this.image,
  });
}

// ======================================================
// WATCH DATA - 15 WATCHES
// Uses five free-to-use Unsplash photos repeatedly. Images require an internet connection.
// ======================================================

final List<Watch> watches = [
  Watch(
    name: "Classic White",
    price: 2499,
    image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Premium Brown",
    price: 3499,
    image: "https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Stainless Steel watch",
    price: 4999,
    image: "https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Golden Luxury",
    price: 2999,
    image: "https://images.unsplash.com/photo-1539874754764-5a96559165b0?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Brown Leather",
    price: 2799,
    image: "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Modern Black",
    price: 3999,
    image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Black Classic",
    price: 3199,
    image: "https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Simple Leather Watch",
    price: 4299,
    image: "https://images.unsplash.com/photo-1523170335258-f5ed11844a49?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Minimal Watch",
    price: 1999,
    image: "https://images.unsplash.com/photo-1539874754764-5a96559165b0?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Luxury Gold",
    price: 5999,
    image: "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Smart Sport watch",
    price: 2499,
    image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Smart Watch",
    price: 2899,
    image: "https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Steel Watch",
    price: 3799,
    image: "https://images.unsplash.com/photo-1539874754764-5a96559165b0?auto=format&fit=crop&w=800&q=80",
  ),
  Watch(
    name: "Executive Watch",
    price: 5299,
    image: "https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=800&q=80",
  ),
];

// ======================================================
// SPLASH SCREEN
// ======================================================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.watch,
              color: Colors.white,
              size: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              "WATCH STORE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Premium Watches",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 40),

            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// HOME PAGE
// ======================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Cart stores selected watches
  final List<Watch> cart = [];

  void addToCart(Watch watch) {
    setState(() {
      cart.add(watch);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${watch.name} added to cart"),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cart: cart),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ==================================================
      // APP BAR
      // ==================================================

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Watch Store",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          // Cart Button
          IconButton(
            onPressed: openCart,
            icon: Stack(
              children: [

                const Icon(
                  Icons.shopping_cart,
                  size: 28,
                ),

                if (cart.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cart.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 10),
        ],
      ),

      // ==================================================
      // HOME BODY
      // ==================================================

      body: Column(
        children: [

          // Heading
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Premium Watches",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Choose your perfect watch",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // ==================================================
          // WATCH GRID
          // ==================================================

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),

              itemCount: watches.length,

              itemBuilder: (context, index) {

                final watch = watches[index];

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      // ==================================================
                      // WATCH IMAGE
                      // ==================================================

                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),

                          child: Image.network(
                            watch.image,
                            width: double.infinity,
                            fit: BoxFit.cover,

                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.watch,
                                  size: 60,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // ==================================================
                      // WATCH DETAILS
                      // ==================================================

                      Padding(
                        padding: const EdgeInsets.all(8),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Text(
                              watch.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "₹${watch.price.toStringAsFixed(0)}",

                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ==================================================
                            // ADD TO CART BUTTON
                            // ==================================================

                            SizedBox(
                              width: double.infinity,

                              child: ElevatedButton.icon(
                                onPressed: () {
                                  addToCart(watch);
                                },

                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  size: 18,
                                ),

                                label: const Text(
                                  "Add to Cart",
                                ),

                                style:
                                    ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black,
                                  foregroundColor:
                                      Colors.white,

                                  shape:
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// CART PAGE
// ======================================================

class CartPage extends StatefulWidget {

  final List<Watch> cart;

  const CartPage({
    super.key,
    required this.cart,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // ==================================================
  // CALCULATE TOTAL
  // ==================================================

  double get totalAmount {

    double total = 0;

    for (var watch in widget.cart) {
      total += watch.price;
    }

    return total;
  }

  // ==================================================
  // REMOVE ITEM
  // ==================================================

  void removeItem(int index) {
    setState(() {
      widget.cart.removeAt(index);
    });
  }

  // ==================================================
  // BUILD CART PAGE
  // ==================================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // ==================================================
      // CART APP BAR
      // ==================================================

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,

        title: const Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ==================================================
      // CART BODY
      // ==================================================

      body: widget.cart.isEmpty

          // Empty cart
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )

          // Cart has products
          : Column(
              children: [

                // ==================================================
                // CART ITEMS
                // ==================================================

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),

                    itemCount: widget.cart.length,

                    itemBuilder: (context, index) {

                      final watch = widget.cart[index];

                      return Card(
                        margin:
                            const EdgeInsets.only(bottom: 10),

                        child: ListTile(

                          // Watch image
                          leading: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(8),

                            child: Image.network(
                              watch.image,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Watch name
                          title: Text(
                            watch.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Watch price
                          subtitle: Text(
                            "₹${watch.price.toStringAsFixed(0)}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Remove button
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),

                            onPressed: () {
                              removeItem(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ==================================================
                // TOTAL SECTION
                // ==================================================

                Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          const Text(
                            "Total Amount",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "₹${totalAmount.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // ==================================================
                      // CHECKOUT BUTTON
                      // ==================================================

                      SizedBox(
                        width: double.infinity,

                        height: 50,

                        child: ElevatedButton(
                          onPressed: () {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Checkout feature coming soon!",
                                ),
                              ),
                            );
                          },

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                          ),

                          child: const Text(
                            "Proceed to Checkout",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

