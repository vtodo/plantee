(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var Pi;

Pi = (function() {
  function Pi() {}

  Pi.a = function() {
    return alert("W");
  };

  return Pi;

})();

module.exports = Pi;


},{}],2:[function(require,module,exports){
var SocketClient, beta, client;

beta = require('./beta.coffee');

SocketClient = (function() {
  function SocketClient() {
    var go, host, ws;
    go = document.getElementById("submit");
    go.addEventListener("click", (function(_this) {
      return function() {
        ws.send(document.getElementById("message").value);
        return document.getElementById("message").value = "";
      };
    })(this));
    console.log("Woah!");
    host = window.location.host;
    ws = new WebSocket('ws://' + host + '/ws');
    ws.onopen = (function(_this) {
      return function() {
        return console.log("Connected");
      };
    })(this);
    ws.onclose = (function(_this) {
      return function() {
        return console.log("Close");
      };
    })(this);
    ws.onerror = (function(_this) {
      return function() {
        return console.log("Error");
      };
    })(this);
    ws.onmessage = (function(_this) {
      return function(message) {
        document.getElementById("log").appendChild(document.createTextNode(message.data));
        return document.getElementById("log").appendChild(document.createElement('br'));
      };
    })(this);
  }

  return SocketClient;

})();

client = new SocketClient();


},{"./beta.coffee":1}]},{},[2])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3Vzci9sb2NhbC9saWIvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsImNvZmZlZS9iZXRhLmNvZmZlZSIsImNvZmZlZS9tYWluLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQ0FBLElBQUE7O0FBQU07OztFQUNGLEVBQUMsQ0FBQSxDQUFELEdBQUcsU0FBQTtXQUNDLEtBQUEsQ0FBTSxHQUFOO0VBREQ7Ozs7OztBQUdQLE1BQU0sQ0FBQyxPQUFQLEdBQWlCOzs7O0FDSmpCLElBQUE7O0FBQUEsSUFBQSxHQUFPLE9BQUEsQ0FBUSxlQUFSOztBQUNEO0VBQ1Usc0JBQUE7QUFFUixRQUFBO0lBQUEsRUFBQSxHQUFLLFFBQVEsQ0FBQyxjQUFULENBQXdCLFFBQXhCO0lBQ0wsRUFBRSxDQUFDLGdCQUFILENBQW9CLE9BQXBCLEVBQTZCLENBQUEsU0FBQSxLQUFBO2FBQUEsU0FBQTtRQUN6QixFQUFFLENBQUMsSUFBSCxDQUFRLFFBQVEsQ0FBQyxjQUFULENBQXdCLFNBQXhCLENBQWtDLENBQUMsS0FBM0M7ZUFDQSxRQUFRLENBQUMsY0FBVCxDQUF3QixTQUF4QixDQUFrQyxDQUFDLEtBQW5DLEdBQTJDO01BRmxCO0lBQUEsQ0FBQSxDQUFBLENBQUEsSUFBQSxDQUE3QjtJQUlBLE9BQU8sQ0FBQyxHQUFSLENBQVksT0FBWjtJQUNBLElBQUEsR0FBTyxNQUFNLENBQUMsUUFBUSxDQUFDO0lBQ3ZCLEVBQUEsR0FBSyxJQUFJLFNBQUosQ0FBYyxPQUFBLEdBQVEsSUFBUixHQUFhLEtBQTNCO0lBQ0wsRUFBRSxDQUFDLE1BQUgsR0FBWSxDQUFBLFNBQUEsS0FBQTthQUFBLFNBQUE7ZUFDUixPQUFPLENBQUMsR0FBUixDQUFZLFdBQVo7TUFEUTtJQUFBLENBQUEsQ0FBQSxDQUFBLElBQUE7SUFFWixFQUFFLENBQUMsT0FBSCxHQUFhLENBQUEsU0FBQSxLQUFBO2FBQUEsU0FBQTtlQUNULE9BQU8sQ0FBQyxHQUFSLENBQVksT0FBWjtNQURTO0lBQUEsQ0FBQSxDQUFBLENBQUEsSUFBQTtJQUViLEVBQUUsQ0FBQyxPQUFILEdBQWEsQ0FBQSxTQUFBLEtBQUE7YUFBQSxTQUFBO2VBQ1QsT0FBTyxDQUFDLEdBQVIsQ0FBWSxPQUFaO01BRFM7SUFBQSxDQUFBLENBQUEsQ0FBQSxJQUFBO0lBRWIsRUFBRSxDQUFDLFNBQUgsR0FBZSxDQUFBLFNBQUEsS0FBQTthQUFBLFNBQUMsT0FBRDtRQUNYLFFBQVEsQ0FBQyxjQUFULENBQXdCLEtBQXhCLENBQThCLENBQUMsV0FBL0IsQ0FBMkMsUUFBUSxDQUFDLGNBQVQsQ0FBd0IsT0FBTyxDQUFDLElBQWhDLENBQTNDO2VBQ0EsUUFBUSxDQUFDLGNBQVQsQ0FBd0IsS0FBeEIsQ0FBOEIsQ0FBQyxXQUEvQixDQUEyQyxRQUFRLENBQUMsYUFBVCxDQUF1QixJQUF2QixDQUEzQztNQUZXO0lBQUEsQ0FBQSxDQUFBLENBQUEsSUFBQTtFQWhCUDs7Ozs7O0FBcUJoQixNQUFBLEdBQVMsSUFBSSxZQUFKLENBQUEiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiY2xhc3MgUGlcbiAgICBAYTooKT0+XG4gICAgICAgIGFsZXJ0KFwiV1wiKVxuXG5tb2R1bGUuZXhwb3J0cyA9IFBpIiwiYmV0YSA9IHJlcXVpcmUoJy4vYmV0YS5jb2ZmZWUnKVxuY2xhc3MgU29ja2V0Q2xpZW50XG4gICAgY29uc3RydWN0b3I6LT5cbiAgICAgICAgXG4gICAgICAgIGdvID0gZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoXCJzdWJtaXRcIilcbiAgICAgICAgZ28uYWRkRXZlbnRMaXN0ZW5lciBcImNsaWNrXCIsICgpPT5cbiAgICAgICAgICAgIHdzLnNlbmQoZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoXCJtZXNzYWdlXCIpLnZhbHVlKVxuICAgICAgICAgICAgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoXCJtZXNzYWdlXCIpLnZhbHVlID0gXCJcIlxuICAgICAgIFxuICAgICAgICBjb25zb2xlLmxvZyBcIldvYWghXCJcbiAgICAgICAgaG9zdCA9IHdpbmRvdy5sb2NhdGlvbi5ob3N0XG4gICAgICAgIHdzID0gbmV3IFdlYlNvY2tldCgnd3M6Ly8nK2hvc3QrJy93cycpXG4gICAgICAgIHdzLm9ub3BlbiA9ICgpPT5cbiAgICAgICAgICAgIGNvbnNvbGUubG9nIFwiQ29ubmVjdGVkXCJcbiAgICAgICAgd3Mub25jbG9zZSA9ICgpPT5cbiAgICAgICAgICAgIGNvbnNvbGUubG9nIFwiQ2xvc2VcIlxuICAgICAgICB3cy5vbmVycm9yID0gKCk9PlxuICAgICAgICAgICAgY29uc29sZS5sb2cgXCJFcnJvclwiXG4gICAgICAgIHdzLm9ubWVzc2FnZSA9IChtZXNzYWdlKT0+XG4gICAgICAgICAgICBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChcImxvZ1wiKS5hcHBlbmRDaGlsZChkb2N1bWVudC5jcmVhdGVUZXh0Tm9kZSBtZXNzYWdlLmRhdGEpXG4gICAgICAgICAgICBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChcImxvZ1wiKS5hcHBlbmRDaGlsZChkb2N1bWVudC5jcmVhdGVFbGVtZW50ICdicicpXG4gICAgICAgIFxuXG5jbGllbnQgPSBuZXcgU29ja2V0Q2xpZW50KCkiXX0=
