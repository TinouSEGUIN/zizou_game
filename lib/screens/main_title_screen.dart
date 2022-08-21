import 'package:flutter/material.dart';
import 'package:zizou_game/maps/mapsZizou.dart';
import 'package:zizou_game/util/extensions.dart';

class TitleScreen extends StatelessWidget {
  TitleScreen({Key? key}) : super(key: key);

  double maxWidthThreshold = 500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: LayoutBuilder(builder: (context, constraint) {
        print(constraint.toString());
        if (constraint.maxWidth < maxWidthThreshold) {
          return Center(
            child: Text('Title'),
          );
        } else {
          return Center(
            child: SizedBox(
              width: maxWidthThreshold,
              child: Column(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: FittedBox(
                      child: Text(
                        'Zizou Game',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                  Spacer(flex: 3,),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: FittedBox(
                          child: Text(
                        'Histoire',
                        style: Theme.of(context).textTheme.headline1,
                      )),
                      // style: ,
                      onPressed: () => context.goTo(MapsZizou()),
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: FittedBox(
                          child: Text(
                        'Mini-Jeux (not implemented)',
                        style: Theme.of(context).textTheme.headline1,
                      )),
                      // style: ,
                      onPressed: () {},
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: FittedBox(
                          child: Text(
                        'Crédits (not implemented)',
                        style: Theme.of(context).textTheme.headline1,
                      )),
                      // style: ,
                      onPressed: () {},
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          );
          ;
        }
      }),
    );
  }
}
