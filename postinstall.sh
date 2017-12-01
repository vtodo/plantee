if [ -z "$PRODUCTION" ]; then
    echo Building with debug &&
    browserify --transform coffeeify --debug coffee/main.coffee > dist/js/main.bundle.js
else
    echo Building for production &&
    browserify --transform coffeeify coffee/main.coffee > dist/js/main.pretty.js
fi

if [ -z "$PRODUCTION" ]; then
    echo Would not uglify
else
    echo Would uglify 100% &&
    npx uglifyjs -o dist/js/main.bundle.js dist/js/main.pretty.js &&
    rm dist/js/main.pretty.js
fi