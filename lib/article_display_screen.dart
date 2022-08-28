library article_display_screen;

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  const CustomTag(
      {Key? key, required this.backgroundColor, required this.children})
      : super(key: key);

  final Color backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: children,
      ),
    );
  }
}

class ArticleDisplayScreen extends StatefulWidget {
  const ArticleDisplayScreen({
    Key? key,
    this.height,
    this.borderRadius = 20,
    required this.width,
    this.imageUrl,
    this.padding,
    this.margin,
    this.child,
    this.subtitle,
    this.title,
    this.author,
    this.content,
    this.date,
  }) : super(key: key);
  final double width;
  final height;
  final imageUrl;
  final subtitle;
  final title;
  final author;
  final content;
  final date;

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  State<ArticleDisplayScreen> createState() => _ArticleDisplayScreenState();
}

class _ArticleDisplayScreenState extends State<ArticleDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(widget.imageUrl),
          fit: BoxFit.cover,
        ), // DecorationImage
      ),
      // BoxDecoration
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: NewsHeadline(
                title: widget.title,
                subtitle: widget.subtitle,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20,
                  ),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTag(
                        backgroundColor: Colors.black38,
                        children: [
                          Text(
                            widget.author,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTag(
                        backgroundColor: Colors.black38,
                        children: [
                          Text(
                            widget.date,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.content,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: MediaQuery.of(context).size.aspectRatio = 0.15,),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.25,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle, // TODO: add subtitle
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
