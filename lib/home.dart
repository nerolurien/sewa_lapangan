import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sewa_lapangan/duration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  // Widget untuk bikin card field rent
  Widget _buildFieldRent({
    required String title,
    required String type,
    required int courtprice,
    required String imagePath,
    required double rating,
  }) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 352,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                height: 192,
                width: 352,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    type,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${formatPrice(courtprice)}/hour",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DurationPage(
                                title: title,
                                type: type,
                                courtprice: courtprice, 
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Select",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Rent A Field",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFieldRent(
                title: "Futsal Court A",
                type: "Indoor • Air Conditioned",
                courtprice: 50000,
                imagePath: 'images/lapangan.png',
                rating: 4.8,
              ),
              _buildFieldRent(
                title: "Basketball Court B",
                type: "Outdoor • Premium Flooring",
                courtprice: 75000,
                imagePath: 'images/lapangan2.png',
                rating: 4.7,
              ),
              _buildFieldRent(
                title: "Badminton Court C",
                type: "Indoor • Wooden Flooring",
                courtprice: 45000,
                imagePath: 'images/lapangan3.png',
                rating: 4.9,
              ),
              _buildFieldRent(
                title: "Tennis Court D",
                type: "Outdoor • Hard Surface",
                courtprice: 80000,
                imagePath: 'images/lapangan4.png',
                rating: 4.6,
              ),
              _buildFieldRent(
                title: "Volleyball Court E",
                type: "Indoor • Syntetic Flooring",
                courtprice: 60000,
                imagePath: 'images/lapangan5.png',
                rating: 4.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}