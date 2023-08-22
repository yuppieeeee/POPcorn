import 'package:flutter/material.dart';
import 'package:popcorn/widgets/toprated.dart';
import 'package:popcorn/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

String appbarTitle = "POPcorn";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String search_query ='iron man';
  List topratedMovies = [];
  List trendingMovies = [];
  final String apikey = "8d28c2f1418b07cac8dfcdbfac0d3a44";
  final String readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZDI4YzJmMTQxOGIwN2NhYzhkZmNkYmZhYzBkM2E0NCIsInN1YiI6IjYzZGFjNjA1YTZjMTA0MDA4NTg3Y2YzNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fVZtxE0HhKVu6Q9mIztpQoOtwosTr2qKp1eKAGrz8u8";

  @override
  //initializing on Start
  void initState() {
    // functions to call
    loadmovies();
    super.initState();
  }

  //load Top rated Movies from TMDB
  loadmovies() async {
    TMDB tmdbLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map topratedresult = await tmdbLogs.v3.movies.getTopRated();
    Map trendingresult = await tmdbLogs.v3.movies.getPopular();
    Map searchresult = await tmdbLogs.v3.search.queryMovies(search_query);

    setState(() {
      topratedMovies = topratedresult['results'];
      trendingMovies = trendingresult['results'];
    });

    //show output of API call
    print(searchresult);
  }

  @override
  Widget build(BuildContext context) {
    //Main Scaffold that holds Layout and links to widgets
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: _buildAppBar(context),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              SearchBar(
                controller: searchController,
                leading: const Icon(Icons.search),
                hintText: 'Search Movies',
                onChanged: (value) {
                  value = search_query;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TrendingMovies(Trending: trendingMovies),
              TopRatedMovies(TopRated: topratedMovies),
            ]),
          ),
        ));
  }
}

//Topbar of the App
AppBar _buildAppBar(context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: (){
            
          }, 
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          )
        ),
        Text(appbarTitle),
        IconButton(
          onPressed: (){

          }, 
          icon: const Icon(Icons.person, size: 30,)
        ),
      ],
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).colorScheme.secondary,
  );
}
