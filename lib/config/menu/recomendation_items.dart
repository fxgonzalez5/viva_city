class RecomendationItems {
  final String image;
  final String lugar;
  final String distancia;

  const RecomendationItems({
    required this.image,
    required this.lugar,
    required this.distancia,
  });
}

const List<RecomendationItems> recommendationsItems = [
  RecomendationItems(
    image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Estadio_Reina_del_Cisne.jpg/1200px-Estadio_Reina_del_Cisne.jpg',
    lugar: 'Estadio Reina del Cisne',
    distancia: '121 m.'
  ),
  
  RecomendationItems(
    image: 'https://d2w66jai70z7l8.cloudfront.net/media/2023/07/Parque-Infantil-Bernabe-Luis.webp',
    lugar: 'Parque Infantil',
    distancia: '364 m.'
  ),
  
  RecomendationItems(
    image: 'https://www.loja.gob.ec/files/noticias/2018/05/nnn.jpg',
    lugar: 'Sendero Ecológico',
    distancia: '874 m.'
  )
];
