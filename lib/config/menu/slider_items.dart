class SliderItem {
  final String image;
  final String emphasis;
  final String description;

  const SliderItem({
    required this.image,
    required this.emphasis,
    required this.description,
  });
}

const List<SliderItem> sliderItems = [
  SliderItem(
    image: 'assets/images/slide1.png',
    emphasis: 'Vive al máximo\nLa experiencia definitiva',
    description: 'La ciudad interactúa contigo. No te pierdas nada de lo que sucede a tu alrededor.\nNosotros te diremos como...'
  ),
  
  SliderItem(
    image: 'assets/images/slide2.png',
    emphasis: 'Con tu registro obtienes\ntu agenda personalizada',
    description: 'Así puedes disfrutar de las más diversas actividades culturales en la ciudad.\nDanza, música, Teatro, exposiciones artísticas, emprendimientos, congresos, etc.'
  ),
  
  SliderItem(
    image: 'assets/images/slide3.png',
    emphasis: 'Recorre los lugares\nmás fascinantes',
    description: 'Cada uno de los lugares de esta ciudad tiene su historia, así que puedes conocer mas de ella y de su gente, recórrela y conoce más detalles con los puntos de realidad aumentada...'
  ),

  SliderItem(
    image: 'assets/images/slide4.png',
    emphasis: 'Una experiencia virtual más\ncerca de lo que te imaginas',
    description: 'Disfruta de la ciudad, sumérgete en una nueva experiencia, mediante recorridos virtuales de varios lugares y conoce más de ellos...'
  ),

  SliderItem(
    image: 'assets/images/slide5.png',
    emphasis: 'Puedes obtener grandes beneficios con nuestras marcas aliadas',
    description: 'Descuentos y promociones en varios lugares como: hoteles, bares, restaurantes etc\nRegístrate y consíguelos.'
  ),
];