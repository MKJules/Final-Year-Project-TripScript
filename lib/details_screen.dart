import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image and Title Section
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  children: [
                    Image.asset(
                      'images/onboarding1.webp',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      top: 16,
                      right: 16,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semeru Mountain',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Malang, East Java',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Rating, Type, Estimate, and Via Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem(Icons.star, '4.5', Colors.amber),
                  _buildInfoItem(Icons.map, 'Open Trip', Colors.grey),
                  _buildInfoItem(Icons.timer, '3D 2N', Colors.grey),
                  _buildInfoItem(Icons.directions, 'Ranupane', Colors.grey),
                ],
              ),
              const SizedBox(height: 16),

              // Description Section
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Mount Semeru or Mount Meru is a cone volcano in East Java, Indonesia. '
                'Mount Semeru is the highest mountain on the island of Java, with its peak '
                'Mahameru, 3,676 meters above sea level.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Date Selection Section
              const Text(
                'Choose date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDateButton('15 Dec - 20 Dec 2023', onTap: () {}),
                    _buildDateButton('25 Dec - 30 Dec 2023', onTap: () {}),
                    _buildDateButton(
                      'Choose Date',
                      icon: Icons.date_range,
                      onTap: () async {
                        DateTimeRange? picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2025),
                          currentDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary:
                                      Colors.blue, // header background color
                                  onPrimary: Colors.white, // header text color
                                  onSurface: Colors.black, // body text color
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          // Handle the selected date range
                          print(
                              "Selected date range: ${picked.start} to ${picked.end}");
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Number of Pax Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Number of pax',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      const Text(
                        '1',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Facilities Section
              const Text(
                'Facilities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildFacilityItem(Icons.directions_bus, 'Transport'),
                  _buildFacilityItem(Icons.smoking_rooms, 'Smoking'),
                  _buildFacilityItem(Icons.free_breakfast, 'Coffee Break'),
                  _buildFacilityItem(Icons.restaurant, 'Meals during trekking'),
                  _buildFacilityItem(Icons.campaign, 'Camping tents'),
                  _buildFacilityItem(Icons.park, 'Park'),
                  _buildFacilityItem(Icons.map, 'Mountain guide'),
                  _buildFacilityItem(
                      Icons.directions_walk, 'Guide during trekking'),
                ],
              ),
              const SizedBox(height: 16),
              // Price and Book Now Button

              Container(
                color: Colors.black, // Set the background color to black
                padding: const EdgeInsets.all(10.0), // Add some padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$80/person',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // Change text color to white for better contrast
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              color: Colors
                                  .white), // Ensure the button text is white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }

  Widget _buildDateButton(String text, {IconData? icon, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: icon != null
            ? Icon(icon, size: 16, color: Colors.black)
            : const SizedBox.shrink(),
        label: Text(text, style: const TextStyle(fontSize: 12)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildFacilityItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black54),
        const SizedBox(height: 8),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
