var less = require('less');
less.render('.class { width: (1 + 1) }',
{
  paths: ['.', './src/less'],  // Specify search paths for @import directives
  filename: '*', // Specify a filename, for better error messages
  compress: true          // Minify CSS output
},
function (e, output) {
   console.log(output.css);
});