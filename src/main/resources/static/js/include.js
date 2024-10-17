// include.js

$(document).ready(function() {
    var headerPath = $('header').data('include-path');
    $('header').load(headerPath);
});