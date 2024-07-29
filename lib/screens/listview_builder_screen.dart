import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
   
  const ListviewBuilderScreen({super.key});

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {
  final List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  // Evento que se dispara cuando se instancia el Listview
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // scrollController.position.pixels -> Posición actual
      // scrollController.position.maxScrollExtent -> Posición máxima hasta donde llega el scroll
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  void addFiveElements() {
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
    // Mandar a redibujar el widget
    setState(() {});
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    // Mandar a redibujar el widget
    setState(() {});
    // Hacer un delay de 3 segundos mientras cargan los datos
    await Future.delayed(const Duration(seconds: 3));
    // Llamar función para agregar cinco nuevos elementos
    addFiveElements();
    isLoading = false;
    // Mandar a redibujar el widget
    setState(() {});
    // scrollController.position.pixels -> Posición actual
    // scrollController.position.maxScrollExtent -> Posición máxima hasta donde llega el scroll
    if ((scrollController.position.pixels + 100) <= scrollController.position.maxScrollExtent) return;
    // Movemos el scroll un poco hacia abajo para indicar que hay nuevas imágenes
    scrollController.animateTo(
      scrollController.position.pixels + 120, // Sumamos 120 a la posición actual del scroll
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  Future<void> onRefresh() async {
    // Hacer un delay de 2 segundos mientras cargan los datos
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    // Limpiamos todos los datos
    imagesIds.clear();
    // Agregamos un nuevo id con base en el último cargado
    imagesIds.add(lastId + 1);
    // Llamar función para agregar cinco nuevos elementos
    addFiveElements();
  }

  @override
  Widget build(BuildContext context) {
    // Tamaño de la pantalla del dispositivo (Alto y Ancho)
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://picsum.photos/500/300?image=${imagesIds[index]}')
                  );
                },
              ),
            ),
            // Validamos si está cargando y mostramos el container con el loading
            if (isLoading)
              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30, // Tomamos la mitad del ancho de la pantalla y le restamos la mitad del tamaño del container
                child: const _LoadingIcon()
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation(AppTheme.primary),),
    );
  }
}