import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firebase/firestore/pagination/pagination_logic.dart';

const LIMIT = 50;

class PaginationView extends StatefulWidget {
  @override
  _PaginationViewState createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  final logic = PaginationLogic();
  final controller = ScrollController();

  void _onListener() {
    if ((controller.offset >= controller.position.maxScrollExtent) && !logic.loading) {
      print('LOADING from ... :${logic.items.last.position}');
      logic.loadData(logic.items.last.position, LIMIT);
    }
  }

  @override
  void initState() {
    logic.loadData(null, LIMIT);
    controller.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: logic,
        builder: (_, __) {
          return logic.items != null
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: logic.items.length,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (_, index) {
                          final item = logic.items[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                height: 100,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(
                                      item.image,
                                      fit: BoxFit.cover,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        item.position.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (logic.loading)
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
