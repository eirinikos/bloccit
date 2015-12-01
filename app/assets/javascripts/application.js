// declare an empty object & thus create a namespace for blocmetrics code
// create the report function as a property on the empty object
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = { name: eventName }; // create an event JSON object
    var request = new XMLHttpRequest(); // initialize a new XMLHttpRequest (AJAX request)

    request.open("POST", "http://localhost:3000/api/events", true);
    // set HTTP method to POST, set the URL of our events endpoint
    // and allow request to run asynchronously

    request.setRequestHeader('Content-Type', 'application/json');
    // set the request Content-Type header to 'application/json'
    // this is how our API::EventsController knows how to process the request as JSON

    request.send(JSON.stringify(event)); // send the request
  };

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
