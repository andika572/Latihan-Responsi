import 'package:flutter/material.dart';
import 'package:latihan_responsi/model/blog_model.dart';
import 'package:latihan_responsi/Detail/blog_detail_page.dart';
import 'package:latihan_responsi/api_data_source.dart';

class ListBlogPage extends StatefulWidget {
  const ListBlogPage({super.key});

  @override
  State<ListBlogPage> createState() => _PageListBlogState();
}

class _PageListBlogState extends State<ListBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog List'),
      ),
      body: _buildListBlogBody(),
    );
  }

  Widget _buildListBlogBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadBlog(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            BlogModel newsModel =
            BlogModel.fromJson(snapshot.data);
            return _buildSuccessSection(newsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text('Failed');
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(BlogModel data){
    return ListView.builder(
        itemCount: data.results!.length,
        itemBuilder: (BuildContext context, int index){
          return _buildItemBlog(data.results![index]);
        }
    );
  }

  Widget _buildItemBlog(Results blogModel){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailPage(blogModel: blogModel),
          ),
        );
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(blogModel.imageUrl!),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(blogModel.title!),
                Text(blogModel.publishedAt!),
              ],
            )
          ],
        ),
      ),
    );
  }
}
