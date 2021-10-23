import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chats',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
              radius: 18.0,
              backgroundColor: Colors.grey.shade800,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                color: Colors.white,
                iconSize: 15.0,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.grey.shade800,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                  iconSize: 15.0,
                )),
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
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.shade800,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 17.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20.0,
                ),
                itemCount: 20,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://www.remove.bg/images/remove_image_background.jpg'),
              ),
              CircleAvatar(
                radius: 7.5,
                backgroundColor: Colors.black,
              ),
              CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lina Ahmed Mahmoud',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You:hello my name is lina ahmed mahmoud',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Container(
                        width: 3.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '02:00 PM',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  Widget buildStoryItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://www.remove.bg/images/remove_image_background.jpg'),
                ),
                CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Colors.black,
                ),
                CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Lina Ahmed Mahmoud',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      );
}
