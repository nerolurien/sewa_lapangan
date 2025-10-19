import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingHistory {
  final String courtName;
  final String courtType;
  final String bookingDate;
  final int totalPrice;
  final String status;

  const BookingHistory({
    required this.courtName,
    required this.courtType,
    required this.bookingDate,
    required this.totalPrice,
    required this.status,
  });
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  final List<BookingHistory> bookings = const [
    BookingHistory(
      courtName: "Cihuni Futsal",
      courtType: "Futsal Court - Vinyl",
      bookingDate: "2025-10-12 19:00:00",
      totalPrice: 155000,
      status: "Selesai",
    ),
    BookingHistory(
      courtName: "Basketball Court B",
      courtType: "Outdoor • Premium Floor",
      bookingDate: "2025-10-25 10:00:00",
      totalPrice: 80000,
      status: "Akan Datang",
    ),
    BookingHistory(
      courtName: "Badminton Hall 3",
      courtType: "Indoor • Karpet",
      bookingDate: "2025-09-30 14:00:00",
      totalPrice: 95000,
      status: "Dibatalkan",
    ),
    BookingHistory(
      courtName: "Cihuni Futsal",
      courtType: "Futsal Court - Vinyl",
      bookingDate: "2025-09-20 20:00:00",
      totalPrice: 105000,
      status: "Selesai",
    ),
  ];

  Widget _buildStatusBadge(String status) {
    Color badgeColor;
    String badgeText;

    switch (status) {
      case "Selesai":
        badgeColor = Colors.green;
        badgeText = "Completed";
        break;
      case "Akan Datang":
        badgeColor = Colors.blue;
        badgeText = "Upcoming";
        break;
      case "Dibatalkan":
        badgeColor = Colors.red;
        badgeText = "Cancelled";
        break;
      default:
        badgeColor = Colors.grey;
        badgeText = "Unknown";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        badgeText,
        style: TextStyle(color: badgeColor, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final dateFormatter = DateFormat('d MMMM yyyy, HH:mm', 'id_ID');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Booking History"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: bookings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history_toggle_off, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  const Text(
                    "No Booking History",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                   const SizedBox(height: 8),
                  const Text(
                    "Your past and upcoming bookings will appear here.",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                     boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            booking.courtName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _buildStatusBadge(booking.status),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking.courtType,
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      const Divider(height: 24),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14, color: Colors.grey[700]),
                          const SizedBox(width: 8),
                          Text(dateFormatter.format(DateTime.parse(booking.bookingDate))),
                          const Spacer(),
                          Text(
                            currencyFormatter.format(booking.totalPrice),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}