import 'dart:js';
import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/items_provider.dart';

class MapInterface extends StatefulWidget {
  FocusNode gamefocus;
  MapInterface(this.gamefocus, {Key? key});

  @override
  State<MapInterface> createState() => _MapInterfaceState();
}

class _MapInterfaceState extends State<MapInterface> {
  // FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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

  // @override
  Widget _topRightMenu(BuildContext context, BoxConstraints constraints) {
    //TODO good value corresponding on OS
    double height =
        constraints.maxHeight < 500 ? constraints.maxHeight : 500; //threshold
    double width = constraints.maxWidth < 500
        ? constraints.maxWidth * 0.2
        : 500 * 0.25; //threshold

    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 2,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[600]?.withOpacity(0.5),
                    ),
                    child: GestureDetector(

                        // color: Colors.pink,
                        // splashColor: Colors.transparent,

                        onTap: ()  {
                          
                          showBookClue(context).then((value) => FocusScope.of(context).requestFocus(widget.gamefocus));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Icon(
                                Icons.search,
                              ),
                              Text("Clue Book")
                            ],
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[600]?.withOpacity(0.5),
                      ),
                      child: GestureDetector(

                          // color: Colors.pink,
                          // splashColor: Colors.transparent,

                          onTap: () {
                            Focus.of(context).unfocus();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(
                                  Icons.map,
                                ),
                                Text("Map"),
                              ],
                            ),
                          )),
                    ),
                  ),
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/notebook.png'),
            ),
          ),
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
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
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
                        onDoubleTap: () {
                          FocusScope.of(context).requestFocus(widget.gamefocus);
                          itemProvider.toggleCoupeCoupe();
                        },
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
                          color: itemProvider.FoudedRope
                              ? Colors.amber
                              : Colors.black,
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
        ),
      ),
    );
  }
}
