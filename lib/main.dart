import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange).copyWith(background: Colors.white)
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// 타이틀바 영역
            Container(
              padding: EdgeInsets.all(8),
              // color: Colors.red,
              height: 60,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/title.png',
                    height: 40,
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/ic_like.png',
                    height: 24,
                  ),
                  SizedBox(width: 24),
                  Image.asset(
                    'assets/images/ic_share.png',
                    height: 22,
                  ),
                  SizedBox(width: 16)
                ],
              ),
            ),
            /// 바디 영역
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60, // 높이 조정
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home 아이콘
            GestureDetector(
              onTap: () => _onItemTapped(0),
              child: Icon(
                Icons.home,
                size: 30,
                color: _selectedIndex == 0 ? Colors.black : Colors.grey,
              ),
            ),
            // Search 아이콘
            GestureDetector(
              onTap: () => _onItemTapped(1),
              child: Icon(
                Icons.search,
                size: 30,
                color: _selectedIndex == 1 ? Colors.black : Colors.grey,
              ),
            ),
            // Profile 아이콘
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Icon(
                Icons.person,
                size: 30,
                color: _selectedIndex == 2 ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      'image': 'https://images.pexels.com/photos/6583358/pexels-photo-6583358.jpeg',
      'description': 'Beautiful sunset at the beach!',
    },
    {
      'image': 'https://images.pexels.com/photos/5282585/pexels-photo-5282585.jpeg',
      'description': 'Had an amazing hike in the mountains!',
    },
    {
      'image': 'https://images.pexels.com/photos/9850412/pexels-photo-9850412.jpeg',
      'description': 'Enjoying a nice cup of coffee.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostItem(post: posts[index]);
      },
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class PostItem extends StatelessWidget {
  final Map<String, String> post;

  PostItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 사용자 이름과 프로필 이미지 (간단히 텍스트로 대체)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/19615202/pexels-photo-19615202.jpeg',
                  ),
                ),
                SizedBox(width: 10),
                Text('User123', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // 이미지
          Image.network(
            post['image']!,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          // 설명 텍스트
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              post['description']!,
              style: TextStyle(fontSize: 16),
            ),
          ),
          // 좋아요 버튼
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // 좋아요 버튼 클릭 이벤트
                  },
                ),
                Text('10k Likes', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}