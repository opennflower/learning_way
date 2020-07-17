import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CNObservable {
    static Future<T> toFuture<T>(Observable<T> observable) {
        final Completer<T> completer = Completer<T>();
        var v1;
        observable.listen((v) {
            v1 = v;
        }, onError: (error) {
            completer.completeError(error);
        }, onDone: () {
            if (!completer.isCompleted) {
                completer.complete(v1);
            }
        });
        return completer.future;
    }
}