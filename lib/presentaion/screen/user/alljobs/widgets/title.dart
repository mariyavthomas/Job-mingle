import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';

class TitleColum extends StatefulWidget {
  const TitleColum({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<TitleColum> createState() => _TitleColumState();
}

class _TitleColumState extends State<TitleColum> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch initial jobs
    context.read<GetAllJobsBloc>().add(FetchJobs());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height * 0.04,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              print("Search value: $value"); // Debugging
              // Debounce to avoid too many searches
              Future.delayed(Duration(milliseconds: 300), () {
                try {
                  context.read<GetAllJobsBloc>().add(SearchJobEvent(searchtext: value));
                } catch (e) {
                  print("Error adding event: $e"); // Debugging
                }
              });
            },
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        searchController.clear();
                        context.read<GetAllJobsBloc>().add(SearchJobEvent(searchtext: ''));
                      },
                    )
                  : null,
            ),
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
