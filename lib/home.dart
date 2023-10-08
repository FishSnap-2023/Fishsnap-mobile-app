import 'package:fishsnap/fish.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FishIdentificationApp());
}



class FishIdentificationApp extends StatelessWidget {
  const FishIdentificationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<String> _fishTypes = ['All', 'Fish', 'Crab', 'Shrimp', 'Other'];

  void selectFilter(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              width: 350.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 13, 56).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black54.withOpacity(.6),
                  ),
                  const Expanded(
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        hintText: 'Search Fish',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.black54.withOpacity(0.6)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _fishTypes
                .asMap()
                .entries
                .map((entry) => buildFilterChip(entry.key, entry.value))
                .toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fishData.length,
              itemBuilder: (context, index) {
                final fish = fishData[index];
                if (selectedIndex == 0 || fish.type == _fishTypes[selectedIndex]) {
                  return ListTile(
                    leading: Image.asset(
                      fish.imagePath,
                      width: 200,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    title: Text(fish.name),
                    subtitle: Text(fish.scientificName),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FishDetailPage(fish: fish),
                        ),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterChip(int index, String label) {
    return FilterChip(
      label: Text(label),
      selected: selectedIndex == index,
      onSelected: (selected) => selectFilter(index),
      selectedColor: Theme.of(context).colorScheme.secondary,
    );
  }
}

class FishDetailPage extends StatelessWidget {
  final Fish fish;

  const FishDetailPage({Key? key, required this.fish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          fish.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            ),

          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              fish.imagePath,
              width: 400,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'Name: ${fish.name}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            Text(
              'Scientific Name: ${fish.scientificName}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 18, 2, 61),
              ),
              ),
              const SizedBox(height: 8),
            Text(
              fish.description,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              ),
          ],
        ),
      ),
    );
  }
}
