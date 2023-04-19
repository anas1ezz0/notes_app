
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [

            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
            ),
            SizedBox(width: 15.0,),
            Text(
              'chats' , style: TextStyle(color: Colors.black),)

          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const CircleAvatar(
            backgroundColor: Colors.blue,
             radius: 16.0,
              child: Icon(Icons.camera_alt,

                size: 16.0,
                color: Colors.white,
              ), )
          ),
          IconButton(onPressed: (){}, icon: const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 16.0,
            child: Icon(Icons.edit,

              size: 16.0,
              color: Colors.white,
            ), )
          ),


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0)
                ,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),


                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text('Search')
                  ],
                ),
              ),
               SizedBox(
                height: 10,),
              Container(
                height: 100.0,
                child: ListView.separated(

                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => bulidStoryItem(),
                  separatorBuilder: (context,index) => SizedBox(width: 20.0,),
                  itemCount: 5,


                ),
              ),
              SizedBox(
                height: 20,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index) => buildChatItem(),
                  separatorBuilder: (context,index) => SizedBox(height: 20.0,),
                  itemCount: 15,
              )

              // SingleChildScrollView(
              //   scrollDirection:Axis.horizontal ,
              //   child: Row(
              //     children: [
              //
              //        SizedBox(
              //         width: 20.0,),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             const SizedBox(
              //                 height: 6.0),
              //             const Text(
              //               '3B3al 33333',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             )
              //           ],),
              //       ),
              //        SizedBox(
              //         width: 20.0,),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             const SizedBox(
              //                 height: 6.0),
              //             const Text(
              //               'Anos Ezz aaaaaaaa',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             )
              //           ],),
              //       ),
              //       SizedBox(
              //         width: 20.0,),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             const SizedBox(
              //                 height: 6.0),
              //             const Text(
              //               'Anos Ezz aaaaaaaa',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             )
              //           ],),
              //       ),
              //       SizedBox(
              //         width: 20.0,),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             const SizedBox(
              //                 height: 6.0),
              //             const Text(
              //               'Malak mloka koka ',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             )
              //           ],),
              //       ),
              //     ],
              //   ),
              // ),
              //  SizedBox(
              //   height: 30,),
              // Expanded(
              //   child:
              //   SingleChildScrollView(
              //     child: Column(
              //       children: [
              //
              //         const SizedBox(
              //           height: 30,),
              //         Row(
              //           children: [
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //
              //                 children:[
              //
              //                   Text(
              //                     'Anas Ezz afdfdfdfdfdfsdfffddffdfdfdffdffdfddf445555aaaaaaaa000005648484151845154',
              //                     style: TextStyle(fontSize:15.0  , fontWeight: FontWeight.bold),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello how are you  hello how are you hello how are you hello how are you ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //                         child: Container(
              //                             width: 7.0,
              //                             height: 7.0,
              //                             decoration: BoxDecoration(
              //                                 color: Colors.blue,
              //                                 shape: BoxShape.circle
              //                             )
              //                         ),
              //                       ),
              //                       Text(
              //                           '2:00 pm'
              //                       )
              //
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           height: 30,),
              //         Row(
              //           children: [
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //
              //                 children:[
              //
              //                   Text(
              //                     'Anas Ezz afdfdfdfdfdfsdfffddffdfdfdffdffdfddf445555aaaaaaaa000005648484151845154',
              //                     style: TextStyle(fontSize:15.0  , fontWeight: FontWeight.bold),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello how are you  hello how are you hello how are you hello how are you ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //                         child: Container(
              //                             width: 7.0,
              //                             height: 7.0,
              //                             decoration: BoxDecoration(
              //                                 color: Colors.blue,
              //                                 shape: BoxShape.circle
              //                             )
              //                         ),
              //                       ),
              //                       Text(
              //                           '2:00 pm'
              //                       )
              //
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           height: 30,),
              //         Row(
              //           children: [
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //
              //                 children:[
              //
              //                   Text(
              //                     'Anas Ezz afdfdfdfdfdfsdfffddffdfdfdffdffdfddf445555aaaaaaaa000005648484151845154',
              //                     style: TextStyle(fontSize:15.0  , fontWeight: FontWeight.bold),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello how are you  hello how are you hello how are you hello how are you ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //                         child: Container(
              //                             width: 7.0,
              //                             height: 7.0,
              //                             decoration: BoxDecoration(
              //                                 color: Colors.blue,
              //                                 shape: BoxShape.circle
              //                             )
              //                         ),
              //                       ),
              //                       Text(
              //                           '2:00 pm'
              //                       )
              //
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(
              //           height: 30,),
              //         Row(
              //           children: [
              //             Stack(
              //
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: const [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //
              //                 children:[
              //
              //                   Text(
              //                     'Anas Ezz afdfdfdfdfdfsdfffddffdfdfdffdffdfddf445555aaaaaaaa000005648484151845154',
              //                     style: TextStyle(fontSize:15.0  , fontWeight: FontWeight.bold),
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'hello how are you  hello how are you hello how are you hello how are you ',
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //                         child: Container(
              //                             width: 7.0,
              //                             height: 7.0,
              //                             decoration: BoxDecoration(
              //                                 color: Colors.blue,
              //                                 shape: BoxShape.circle
              //                             )
              //                         ),
              //                       ),
              //                       Text(
              //                           '2:00 pm'
              //                       )
              //
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

            ],
          ),
        ),

      ),
    );
  }

  Widget buildChatItem() =>  Row(
    children: [
      Stack(

        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      SizedBox(
        width: 20.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children:[

            Text(
              'Anas Ezz afdfdfdfdfdfsdfffddffdfdfdffdffdfddf445555aaaaaaaa000005648484151845154',
              style: TextStyle(fontSize:15.0  , fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.0,
            ),

            Row(
              children: [
                Expanded(
                  child: Text(
                    'hello how are you  hello how are you hello how are you hello how are you ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle
                      )
                  ),
                ),
                Text(
                    '2:00 pm'
                )

              ],
            )
          ],
        ),
      ),
    ],
  );

  Widget bulidStoryItem() =>  Container(
    width: 60.0,
    child: Column(
      children: [

        Stack(

          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage( 'https://avatars.githubusercontent.com/u/34492145?v=4'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        const SizedBox(
            height: 6.0),
        const Text(
          'Anos Ezz aaaaaaaa',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],),
  );


}
