import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klarmd_test/models/models.dart';

class HomePageScreen extends StatelessWidget {
  final List<Artist> artists;

  const HomePageScreen({Key key, this.artists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Welcome Amma',style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold,)),
                Text('')
              ],
            ),
            SizedBox(height: 25,),
            Container(
              // height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: Color(0xffF1F3F6),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Appointments',style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold,)),
                        Text('view more',style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w400),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Container(
                        height: 50,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      title: Text('Mammography',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      subtitle: Text('LUKS, FrauelInk',style:TextStyle(color: Colors.black26,),),
                      trailing:  Text('14 Sept, 4:30PM ',style:TextStyle(color: Colors.black26,),),
                    ),
                    SizedBox(height: 4,),
                    ListTile(
                      leading: Container(
                        height: 50,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      title: Text('Follow-up,Brutzentrum',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                      subtitle: Text('LUKS, FrauelInk',style:TextStyle(color: Colors.black26,),),
                      trailing:  Text('14 Sept, 4:30PM ',style:TextStyle(color: Colors.black26,),),
                    ),
                    SizedBox(height: 4,),
                    ListTile(
                      leading: Container(
                        height: 50,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      title: Text('Follow-up,Radio-onkologie',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                      subtitle: Text('LUKS, FrauelInk',style:TextStyle(color: Colors.black26,),),
                      trailing:  Text('14 Sept, 4:30PM ',style:TextStyle(color: Colors.black26,),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Family Members',style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold,)),
                Text('')
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>null ));
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue
                        ),
                        child: Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),

          ListView.builder(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 32,
            ),
        shrinkWrap: true,
        itemCount: artists.length -3,
        scrollDirection:Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return FamilyMembers(
            artist: artists[index],
          );
        },
      )

                  ],
                ),
              ),
            ),


            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("What's new",style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold,)),
                Text('')
              ],
            ),
            SizedBox(height: 30,),
            Row(

              children: [
                Container(
                  height: 25,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xfff1f3f6)
                  ),
                  child: Text('    Breast Cancer',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 25,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xfff1f3f6)
                  ),
                  child: Text('      Serology',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            SizedBox(height: 15,),
            ListTile(
              leading: Image.asset('assets/images/13.png'),
              title: Text('Prof. Dr. W. Weber',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              subtitle: Text('Posted new patient information Breast cancer',style: TextStyle(fontSize: 12,),),
            ),

            SizedBox(height: 30,),
            Row(

              children: [
                Container(
                  height: 25,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xfff1f3f6)
                  ),
                  child: Text('    Breast Cancer',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 25,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xfff1f3f6)
                  ),
                  child: Text('      Serology',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            SizedBox(height: 15,),
            ListTile(
              leading: Image.asset('assets/images/13.png'),
              title: Text('Prof. Dr. W. Weber',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              subtitle: Text('Posted new patient information Breast cancer',style: TextStyle(fontSize: 12,),),
            )
          ],
        ),
      ),
    );
  }


  Container avatarWidget(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 200,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xfff1f3f6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/images/$img.png'),
                    fit: BoxFit.contain
                ),
                border: Border.all(
                    color: Colors.grey,
                    width: 0.5
                )
            ),
          ),
          Text(name, style: TextStyle(
            fontSize: 16,
            fontFamily: 'ubuntu',
            // fontWeight: FontWeight.w700
          ),)
        ],
      ),
    );
  }


}
class FamilyMembers extends StatelessWidget {
  final Artist artist;

  const FamilyMembers({Key key, this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return avatarWidget(artist.image, artist.name);
  }

  Container avatarWidget(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 200,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xfff1f3f6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            // child: Image.network(img),
            child: CircleAvatar(
              backgroundImage: NetworkImage(img),
              backgroundColor: Colors.transparent,
              radius: 30.0,

            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,

                // image: DecorationImage(
                //     image: AssetImage('assets/images/$img.png'),
                //     fit: BoxFit.contain
                // ),
                border: Border.all(
                    color: Colors.grey,
                    width: 0.5
                )
            ),
          ),
          Text(name, style: TextStyle(
            fontSize: 16,
            fontFamily: 'ubuntu',
            // fontWeight: FontWeight.w700
          ),)
        ],
      ),
    );
  }

}
