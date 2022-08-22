import 'dart:js';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/items_provider.dart';

class MapInterface extends StatelessWidget {
  const MapInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: LayoutBuilder(builder: (_, constraint) {
        return Stack(
          children: [
            _topRightMenu(context, constraint),
            _bottomCenterItems(constraint),
          ],
        );
      }),
    );
  }

  Widget _topRightMenu(BuildContext context, BoxConstraints constraints) {
    //TODO good value corresponding on OS
    double height =
        constraints.maxHeight < 500 ? constraints.maxHeight : 500; //threshold
    double width =
        constraints.maxWidth < 500 ? constraints.maxWidth : 500; //threshold

    return Align(
      alignment: Alignment.topRight.add(Alignment(0.0, 0.1)),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () async {
                  await showBookClue(context);
                },
                tooltip: 'Clue',
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'Maps',
                icon: Icon(
                  Icons.map,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showBookClue(BuildContext ctx) async {
    showDialog(
      context: ctx,
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: IconButton(
          onPressed: () => Navigator.of(ctx).pop(),
          icon: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/notebook.png'),),),
          //TODO gridview from the enums 
        //     child: Column(
        //   children: [
        //     GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150.0, childAspectRatio: 2.0 ), children: ),
        //     Divider(),
        //     GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150.0, childAspectRatio: 2.0 )),
        //     Divider(),
        //     GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150.0, childAspectRatio: 2.0 )),
        //     Divider(),
        //   ],
        // ),
        ),
      ),
    );
  }

  Widget _bottomCenterItems(BoxConstraints constraints) {
    //TODO good value corresponding on OS
    double height =
        constraints.maxHeight < 100 ? constraints.maxHeight : 100; //threshold
    double width =
        constraints.maxWidth < 500 ? constraints.maxWidth : 500; //threshold
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          height: height,
          width: width,
          child: Consumer<ItemProvider>(
            builder: (context, itemProvider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mad for debug
                  InkWell(
                    onDoubleTap: () => itemProvider.toggleCoupeCoupe(),
                    child: FaIcon(
                      FontAwesomeIcons.utensils,
                      color: itemProvider.FoudedCoupeCoupe
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => itemProvider.toggleFoundedRope(),
                    child: FaIcon(
                      FontAwesomeIcons.trowel,
                      color:
                          itemProvider.FoudedRope ? Colors.amber : Colors.black,
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () => itemProvider.toggleFoundedFire(),
                    child: FaIcon(
                      FontAwesomeIcons.fire,
                      color: itemProvider.FoudedFire
                          ? Colors.deepOrange
                          : Colors.black,
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

//  Widget gridListClue(List clues){
//    //todo Proper gridviews with enums
//   //  return GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150.0, childAspectRatio: 2.0 ), children: clues.map((e) => GridTile(child: Text(e.))).toList());
//  }
}
