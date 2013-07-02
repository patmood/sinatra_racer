var playerOneDistance = 0;
var playerTwoDistance = 0;



var playerOneUpdate = function(){
  var speed = Math.floor(Math.random()*31)
  $('#player1').animate({left:"+=" + speed + "px"},10);
  playerOneDistance += speed;
};

var playerTwoUpdate = function(){
  var speed = Math.floor(Math.random()*31)
  $('#player2').animate({left:"+=" + speed + "px"},10);
  playerTwoDistance += speed;
};

var finished = function() {
  if(playerOneDistance >= 100){
    alert("Player One Wins!");
    $.post('/update',{winner: p1, loser: p2, game: game });
    reset();
  } else if (playerTwoDistance >= 100){
    alert("Player Two Wins!");
    $.post('/update',{winner: p2, loser: p1, game: game });
    reset();
  };
};

var reset = function(){
  $('#player1').animate({left: 0},'slow');
  $('#player2').animate({left: 0},'slow');
  playerOneDistance = 0;
  playerTwoDistance = 0;
};

$(document).ready(function() {
  $(document).on('keyup', function(event) {
    if (event.keyCode == 81){
      playerOneUpdate();
    }else if(event.keyCode == 80){
      playerTwoUpdate();
    };
    finished();
  });
});
