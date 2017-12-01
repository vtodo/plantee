date &&
echo Compiling coffee script...&&
echo Linking... &&
browserify --transform coffeeify --debug coffee/main.coffee > dist/js/main.bundle.pretty.js && 
echo Uglifying... &&
mv dist/js/main.bundle.pretty.js dist/js/main.bundle.js &&
# uglifyjs dist/js/main.bundle.pretty.js > dist/js/main.bundle.js &&
# uglifyjs dist/js/parallel.jobs.pretty.js > dist/js/parallel.jobs.js &&
echo Success!
