
class Fish {
  final String name;
  final String type;
  final String imagePath;
  final String description;
  final String scientificName;

  Fish({
    required this.name,
    required this.type,
    required this.imagePath,
    required this.description, 
    required this.scientificName,
  });
}

final List<Fish> fishData = [
   
   //fish
   Fish(
    name: 'Bubbles',
    type: 'Fish',
    scientificName: 'Zebrasoma flavescens',
    imagePath: 'assets/images/fish/Bubbles.jpeg',
    description: 'Fish that are known to enjoy chasing bubbles, such as the yellow tang fish (Zebrasoma flavescens) and the clownfish (Amphiprioninae). Fish that produce bubbles as part of their normal behavior, such as the bubble nest gourami (Betta bublica) and the pufferfish (Tetraodontiformes).Fish that are associated with bubbles in popular culture, such as Bubbles, the yellow tang fish from the Pixar film Finding Nemo.Bubbles can be a sign of a healthy aquarium, as they indicate that there is enough oxygen in the water.',
  ),
  Fish(
    name: 'Coral',
    type: 'Fish',
    scientificName: 'Amphiprioninae , Pomacanthidae',
    imagePath: 'assets/images/fish/Coral.jpeg',
    description: 'Coral fish are fish that live in or around coral reefs. They are some of the most colorful and diverse fish in the world, with over 6,000 species known to science. Coral fish come in all shapes and sizes, from tiny gobies to large sharks.Coral reefs are important ecosystems that provide food and shelter for a wide variety of marine life, including coral fish. Coral fish play an important role in the reef ecosystem by helping to keep the coral clean and healthy. They also provide food for other animals, such as seabirds and sharks.',
  ),
   Fish(
    name: 'Flounder',
    type: 'Fish',
    scientificName: 'Paralichthys',
    imagePath: 'assets/images/fish/Flounder.jpeg',
    description: 'Flounder is a group of flatfish species that are found in all oceans of the world. They are demersal fish, which means they live at the bottom of the ocean. Flounders are known for their unique bodies, which are flattened laterally, with both eyes on the same side of the body. This adaptation helps them to camouflage themselves on the ocean floor and ambush their prey.',
  ),
  Fish(
    name: 'Guppy',
    type: 'Fish',
    scientificName: 'Poecilia reticulata',
    imagePath: 'assets/images/fish/Guppy.jpeg',
    description: 'The guppy is one of the most popular freshwater aquarium fish species in the world. They are known for their bright colors, small size, and easy care requirements.Guppies are native to South America, but they have been introduced to many other parts of the world, including North America, Europe, and Asia. They are highly adaptable fish and can thrive in a variety of water conditions. ',
  ),
   Fish(
    name: 'Koi',
    type: 'Fish',
    scientificName: 'Cyprinus rubrofuscus',
    imagePath: 'assets/images/fish/Koi.jpeg',
    description: 'Koi (錦鯉) are ornamental varieties of the common carp (Cyprinus carpio). They are native to Japan, but they are now popular all over the world. Koi are known for their beautiful colors and patterns, and they can grow to be quite large.Koi are omnivores, and they eat a variety of foods, including algae, plants, insects, and worms. It is important to feed koi a high-quality fish food that is appropriate for their size and age. ',
  ),

   Fish(
    name: 'Tango',
    type: 'Fish',
    scientificName: 'Paracanthurus hepatus',
    imagePath: 'assets/images/fish/Tango.jpeg',
    description: 'The tango fish, also known as the yellow tang (Zebrasoma flavescens), is a saltwater fish species of the family Acanthuridae. It is one of the most popular marine aquarium fish, and is known for its bright yellow color and elegant swimming movements.Tango fish are native to the Indo-Pacific region, where they are found in coral reefs. They are herbivores, and their diet consists mainly of algae. Tango fish can grow up to 8 inches in length, and have a lifespan of up to 20 years in captivity. ',
  ),
  

  //crab
  Fish(
    name: 'Blue Crab',
    type: 'Crab',
    scientificName: 'Callinectes sapidus',
    imagePath: 'assets/images/crabs/blur_crab.jpeg',
    description: ' The blue crab is one of the most popular types of crab in the world. It is found in the Atlantic Ocean from Nova Scotia to Argentina. Blue crabs are typically blue-green in color and have a hard shell. They are known for their sweet and delicate meat.',
  ),
  Fish(
    name: 'Dungeness Crab',
    type: 'Crab',
    scientificName: 'Metacarcinus magister',
    imagePath: 'assets/images/crabs/Dungeness_Crab.jpeg',
    description: 'The Dungeness crab is another popular type of crab. It is found in the Pacific Ocean from Alaska to California. Dungeness crabs are typically orange or red in color and have a soft shell. They are known for their large size and sweet meat.',
  ),
  Fish(
    name: 'King Crab',
    type: 'Crab',
    scientificName: 'Paralithodes camtschaticus',
    imagePath: 'assets/images/crabs/king_Crab.jpeg',
    description: 'The king crab is the largest type of crab in the world. It is found in the North Pacific Ocean from Alaska to Japan. King crabs are typically red or orange in color and have a hard shell. They are known for their large size and sweet meat.',
  ),
  
  Fish(
    name: 'Snow Crab',
    type: 'Crab',
    scientificName: 'Chionoecetes opilio',
    imagePath: 'assets/images/crabs/snow_Crab.jpeg',
    description: 'The snow crab is a type of crab that is found in the North Pacific Ocean from Alaska to Japan. Snow crabs are typically white or brown in color and have a soft shell. They are known for their large size and sweet meat.',
  ),

  //Shrimp
  Fish(
    name: 'Whiteleg shrimp',
    type: 'Shrimp',
    scientificName: 'Litopenaeus vannamei',
    imagePath: 'assets/images/shrimp/Whiteleg_shrimp.jpeg',
    description: 'This is the most common type of shrimp farmed and consumed worldwide. Whiteleg shrimp are typically white or light pink in color, and they can grow up to 9 inches long.',
  ),
  Fish(
    name: 'Giant freshwater prawn',
    type: 'Shrimp',
    scientificName: 'Macrobrachium rosenbergii',
    imagePath: 'assets/images/shrimp/Giant_freshwater_prawn.jpeg',
    description: 'This is the largest species of shrimp in the world, and it can grow up to 18 inches long. Giant freshwater prawns are native to Southeast Asia, but they have been introduced to many other parts of the world.',
  ),
  Fish(
    name: 'Cherry shrimp',
    type: 'Shrimp',
    scientificName: 'Neocaridina davidi',
    imagePath: 'assets/images/shrimp/Cherryshrimp.jpeg',
    description: 'Cherry shrimp are another popular type of freshwater aquarium shrimp. They are native to China and Taiwan, and they typically grow to about 1 inch long. Cherry shrimp are known for their bright red color, and they are relatively easy to care for.',
  ),
];