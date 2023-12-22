class eventosItems {
  final String image;
  final String category;

  const eventosItems({
    required this.image,
    required this.category,
  });
}

const List<eventosItems> eventoItems = [
  eventosItems(
    image: 'assets/images/teatro_eventos.png',
    category: 'TEATRO'
  ),
  
  eventosItems(
    image: 'assets/images/caminatas_eventos.png',
    category: 'CAMINATAS'
  ),
  
  eventosItems(
    image: 'assets/images/resentaciones_eventos.png',
    category: 'PRESENTACIONES'
  ),

];