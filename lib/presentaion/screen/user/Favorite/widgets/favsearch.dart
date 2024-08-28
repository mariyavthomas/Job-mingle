import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/favorite/favorite_bloc.dart';

class FavSearch extends StatelessWidget {
  const FavSearch({
    super.key,
    required this.searchcontroller,
  });

  final TextEditingController searchcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 8.0),
       decoration: BoxDecoration(
         color: Colors.grey[200],
         borderRadius: BorderRadius.circular(30.0),
       ),
       child: TextField(
         controller: searchcontroller,
         onChanged: (value) {
           context.read<FavoriteBloc>().add(SearchEvent(searchQuery: value));
         },
         decoration: InputDecoration(
           hintText: 'Search',
           border: InputBorder.none,
           prefixIcon: Icon(Icons.search, color: Colors.grey),
           suffixIcon: searchcontroller.text.isNotEmpty
               ? IconButton(
                   icon: Icon(Icons.clear, color: Colors.grey),
                   onPressed: () {
                     searchcontroller.clear();
                     context.read<FavoriteBloc>().add(SearchEvent(searchQuery: ''));
                   },
                 )
               : null,
         ),
         style: TextStyle(
           fontSize: 16.0,
           color: Colors.black87,
         ),
       ),
     );
  }
}
