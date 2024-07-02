import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/utils/customcolor.dart';

class AppliesScreen extends StatefulWidget {
  const AppliesScreen({super.key});

  @override
  State<AppliesScreen> createState() => _AppliesScreenState();
}


class _AppliesScreenState extends State<AppliesScreen> {
   @override
  void initState() {
    super.initState();
    context.read<ApplyjobBloc>().add(LoadAppliedJobs());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: AppBar(
          backgroundColor: CustomColor.bluecolor(),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.045,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: height * 0.008,
                      vertical: height * 0.008,
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                  onSubmitted: (query) {
                    // Handle the search query here
                    print('Search query: $query');
                  },
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
          ],
        ),
      ),
      body: BlocBuilder<ApplyjobBloc, ApplyjobState>(
        builder: (context, state) {
          
          if (state is ApplyjobLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AppliedJobLoaded) {
            print("hleo");
            if (state.appliedjob.isEmpty) {
              return Center(
                child: Text('No jobs found.'),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: state.appliedjob.length,
              itemBuilder: (BuildContext context, int index) {
                final AppliedJobModel appliedjobs = state.appliedjob[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                     
                    },
                    child: Container( 
                      decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 205, 202, 202),),borderRadius:BorderRadius.all(Radius.circular(10)) ),
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 5,
                        margin: EdgeInsets.all(1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            ListTile(
                              leading: Container(
                                height: height * 0.09,
                                width: height * 0.08,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 237, 231, 231),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.shop)
                              ),
                              title: Text(
                                appliedjobs.jobtitle.toUpperCase(),
                                style: TextStyle(
                                  color: CustomColor.bluecolor(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Rs.${appliedjobs.salary}',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                            ),
                           
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_city_outlined,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: width * 0.069),
                                  Text(appliedjobs.companyname),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:  width * 0.05,
                                  ),
                                  Container(
                                    height: height *0.03,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 164, 218, 198),
                                    ),
                                    child: Center(child: Text('Application Sent '))
                                  ),
                                  SizedBox(
                                   width:  width*0.2,
                                  ),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.book,size: 20,color: Color.fromARGB(255, 36, 35, 35),))
                                  ,Text('Similar',style: TextStyle(color: Color.fromARGB(255, 35, 34, 34)),)
                                ],

                              ),
                            )
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ApplyjobFailure) {
            return Center(
              child: Text('Failed to load jobs.'),
            );
          }
          return Center(
            child: Text('Unknown state.'),
          );
        },
      ),
    );
  }
}
