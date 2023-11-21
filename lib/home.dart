import 'package:flutter/material.dart';
import 'package:latihan_responsi/list_page/blog_page.dart';
import 'package:latihan_responsi/list_page/news_page.dart';
import 'package:latihan_responsi/list_page/report_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Flight News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              _buildListItem(
                context,
                'News',
                'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites.',
                ListNewsPage(),
                'https://a-cdn.sindonews.net/dyn/732/content/2017/12/06/15/1263469/pembaca-masih-memilih-koran-sebagai-media-terpercaya-jwJ-thumb.jpg',
              ),
              _buildListItem(
                context,
                'Blog',
                'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast',
                ListBlogPage(),
                'https://cdn.pixabay.com/photo/2014/04/18/10/08/blog-327070_1280.jpg',
              ),
              _buildListItem(
                context,
                'Report',
                'Space station and other missions often publish their data. With SNAPI, you can include it in your app as well!',
                ListReportPage(),
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVE1QdlyCQ9udUaVKQmRkA2cKXSOyyG_nmbA&usqp=CAU',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context,
      String title,
      String description,
      Widget page,
      String imageUrl, // Tambahkan parameter imageUrl
      ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => page),
        );
      },
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 150, // Sesuaikan tinggi gambar sesuai kebutuhan
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}