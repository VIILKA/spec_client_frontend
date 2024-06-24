class UnbordingContent {
  String image;
  String title;

  UnbordingContent({required this.image, required this.title});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Дополнительное оборудование\nи услуги грузчиков',
    image: 'assets/images/creating_order.jpg',
  ),
  UnbordingContent(
    title: 'Оплачивайте как удобно:\nкартой или наличными',
    image: 'assets/images/payment_details.jpg',
  ),
  UnbordingContent(
    title: 'Отслеживайте передвижение\nисполнителя к вам на карте',
    image: 'assets/images/map.jpg',
  ),
  UnbordingContent(
    title: 'Круглосуточная помощь\nтехподдержки',
    image: 'assets/images/helping_chat.jpg',
  ),
];
