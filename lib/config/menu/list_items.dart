class ListItem {
  final String image;
  final String title;
  final String type;
  final String location;
  final String distance;
  final String description;

  const ListItem({
    required this.image,
    required this.title,
    required this.type,
    required this.location,
    required this.distance,
    required this.description,
  });
}

const List<ListItem> listItems = [
  ListItem(
    image: 'https://picsum.photos/id/55/1000',
    title: 'OPERA LOJA FEST',
    type: 'Música',
    location: 'Teatro Bolívar - Olmedo y Rocafuerte',
    distance: 'Distancia 20m',
    description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim '
  ),

  ListItem(
    image: 'https://picsum.photos/id/112/1000',
    title: 'EXPOSICION FOTOGRAFICA',
    type: 'Música',
    location: 'Teatro Bolívar - Olmedo y Rocafuerte',
    distance: 'Distancia 20m',
    description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim '
  ),

  ListItem(
    image: 'https://picsum.photos/id/171/1000',
    title: 'DANZA DE FLORES',
    type: 'Música',
    location: 'Teatro Bolívar - Olmedo y Rocafuerte',
    distance: 'Distancia 20m',
    description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim '
  ),

];