<!DOCTYPE html>
<html>
<head>
  <title>WebSocket Test</title>
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
</head>
<body>
<h1>WebSocket Test</h1>
<script>
  var socket = new SockJS('/ws');
  var stompClient = Stomp.over(socket);

  stompClient.connect({}, function(frame) {
    console.log('Connected: ' + frame);
    stompClient.subscribe('/user/25/topic/notifications', function(message) {
      console.log('Received: ' + message.body);
    });
  }, function(error) {
    console.error('WebSocket connection failed:', error);
  });
</script>
</body>
</html>
