import 'dart:convert';
import 'package:gabrielmoreira/models/profile.dart';
import 'package:gabrielmoreira/models/project.dart';
import 'package:http/http.dart' as http;

class Service {
  consulta1(){
    return 'Gabriel Moreira'; // Consulta 
  }
}

Future<Profile> getUser() async {
  var profile = Profile();
  try {
    final response = await http.get('https://us-central1-martinsmiguel-31f62.cloudfunctions.net/api/home/profiles');
    var data = json.decode(response.body)['profiles']['XHk9SXYNvLSu0RpinH0g'];
    // data.map((key, value) {
    //   print(value['projectId']);
    //   profile = Profile(projectId: value['projectId']);
    // });
    profile = Profile(projectId: data['projectId']);
    return profile;
  } catch(e) {
    print(e);
  }
  return null;
}

Future getProjects () async {
  List<Project> projectsService = [];
  Profile profile = await getUser();
  projectsService = [];
  
  // print('Projects: ${profile.projectId.length}');
  try {
    // print(profile.projectId.length);
    for (var item in profile.projectId) { 
      final response = await http.get(
      'https://us-central1-martinsmiguel-31f62.cloudfunctions.net/api/home/projects/$item'
      ); 
      var data = json.decode(response.body);
      // print(data);
      // print('Project add before: ${projectsService.length}');
      projectsService.add(
        Project(
          date: DateTime(2020, 04, 04),//data['date'],
          description: data['description'],
          image: data['image'],
          link: data['link'],
          status: data['status'],
          tags: data['tags'],
          title: data['title'],
          type: data['type'],
          author: data['author'],
          collaborators: data['collaborators'],
          comments: [''],
          likes: 4,
        )
      );
      // print('Project add after: ${projectsService.length}');
    }
    // print(projectsService.length);
    return projectsService;
  } catch(e) {
    print(e);
  }
  return projectsService;
}

// void initiateDatabase () {
//   projects = [
//     Project(
//       DateTime(2020, 04, 25), 
//       'Se três ou mais objetos se movem, um ao redor do outro, '
//       'a história não pode ser revertida. Essa é a conclusão de '
//       'um grupo de pesquisadores depois de rodar simulações '
//       'computacionais de 3 buracos negros, um orbitando o outro.', 
//       'https://spacetoday.com.br/wp-content/uploads/2020/03/physicslawsc.jpg', 
//       ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
//       'Em Andamento', 
//       ['Robótica', 'Flutter', 'Astronomia', 'Drone'], 
//       'A Simetria do Tempo e as Leis da Física',
//       'Projeto Pessoal',
//       ['Muito Bom', 'Parabéns'],
//       4
//     ),
//     Project(
//       DateTime(2020, 04, 13), 
//       'A nossa galáxia é muito maior do que ela parece. Um novo trabalho '
//       'descobriu que a Via Láctea tem aproximadamente 2 milhões de anos-luz '
//       'de diâmetro, algo 15 vezes maior do que o disco espiral luminoso. O '
//       'número poderia levar a uma melhor estimativa de quão massiva a galáxia '
//       'é e quantas galáxias orbitam a nossa.', 
//       'https://spacetoday.com.br/wp-content/uploads/2020/03/032020_kc_milkway_feat-1028x579-1-1028x475.jpg', 
//       ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
//       'Finalizado', 
//       ['NASA', 'Astronomia', 'Rockets'], 
//       'Os Astrônomos encontram a borda da Via Láctea',
//       'Projeto Pessoal',
//       ['Tamo Juntos Brow'],
//       2
//     ),
//     Project(
//       DateTime(2020, 04, 31), 
//       'A matéria escura é um componente hipotético do nosso universo, '
//       'usada para explicar muitos comportamentos estranhos das estrelas e das galáxias.', 
//       'https://spacetoday.com.br/wp-content/uploads/2020/03/iq89WhYUoD3jWbBU9Cond6-650-80.jpg', 
//       ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
//       'Em Andamento', 
//       ['Robótica', 'Flutter', 'Astronomia', 'Drone'], 
//       'Caçando Matéria Escura no Interior da Terra',
//       'Projeto Pessoal',
//       [],
//       3
//     ),
//     Project(
//       DateTime(2020, 04, 04), 
//       'A sonda Juno da NASA capturou essa bela imagem do hemisfério sul de Júpiter '
//       'no dia 17 de fevereiro de 2020, durante a mais recente passagem da sonda pelo planeta gigante gasoso.', 
//       'https://spacetoday.com.br/wp-content/uploads/2020/03/pia23801-1270x475.jpg', 
//       ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
//       'Finalizado', 
//       ['Robótica', 'Flutter', 'Astronomia', 'Drone'], 
//       'A Beleza Massiva de Júpter',
//       'Projeto Pessoal',
//       [],
//       1
//     ),
//     Project(
//       DateTime(2020, 04, 18), 
//       'Em primeiro lugar, o gelo de água é abundante no satélite Encélado de Saturno, '
//       'pois esse objeto está bem longe do Sol. Na verdade, quase todos os satélites dos '
//       'planetas gigantes, com a importante exceção de Io, satélite de Júpiter, os planetas '
//       'anões, como Plutão, os cometas e os objetos do Cinturão de Kuiper são formados '
//       'com uma grande quantidade de gelo de água. O hidrogênio é o elemento mais abundante '
//       'no universo e o oxigênio, o terceiro mais abundante, isso faz com que a formação de '
//       'H2O não seja tão complicada assim. Além de uma certa distância do Sol, a chamada '
//       'linha de neve, ou linha de congelamento, qualquer água deve estar no seu estado sólido, '
//       'e quando os planetas e os satélites se desenvolveram, o gelo foi um importante componente químico.', 
//       'https://spacetoday.com.br/wp-content/uploads/2020/03/Enceladus-982x475.jpg', 
//       ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
//       'Finalizado', 
//       ['Robótica', 'Flutter', 'Astronomia', 'Drone'], 
//       'De Onde Vem a Água de Encélado ?',
//       'Projeto Pessoal',
//       [],
//       5
//     ),
//   ];
// }