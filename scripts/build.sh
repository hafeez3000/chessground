#!/bin/sh

ROOT=$(cd `dirname $0` && pwd)/..

cd $ROOT
# lein cljsbuild clean
lein cljsbuild once prod

echo "Finalizing chessground.js"

(cat $ROOT/scripts/wrapper.beg.txt;
cat $ROOT/chessground.prod.js;
cat $ROOT/scripts/wrapper.end.txt) > $ROOT/chessground.js

$ROOT/node_modules/browserify/bin/cmd.js $ROOT/chessground.js --s chessground > $ROOT/dist/chessground.standalone.js
