import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:graphql/client.dart';

class GraphqlPage extends StatefulWidget {
  const GraphqlPage({Key? key}) : super(key: key);

  @override
  State<GraphqlPage> createState() => _GraphqlPageState();
}

class _GraphqlPageState extends State<GraphqlPage> {
  List<dynamic> characters = [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _loading
            ? const CupertinoActivityIndicator()
            : characters.isEmpty
                ? ElevatedButton(
                    onPressed: () {
                      // _fetchData();
                    },
                    child: const Text("Fetch Data"),
                  )
                : ListView.builder(
                    itemCount: characters.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (_, __) {
                      return Card(
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage(
                              characters[__]['image'],
                            ),
                          ),
                          title: Text(
                            characters[__]['name'],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }

  // _fetchData() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");
  //   GraphQLClient qlClient = GraphQLClient(
  //     link: link,
  //     cache: GraphQLCache(
  //       store: HiveStore(),
  //     ),
  //   );
  //   QueryResult queryResult =
  //       await qlClient.query(QueryOptions(document: gql("""query {
  //                  characters(){
  //                   results{
  //                     name
  //                     image
  //                   }
  //                  }
          
          
  //         }""")));

  //   setState(() {
  //     characters = queryResult.data!['characters']['results'];
  //     _loading = false;
  //   });
  // }
}
