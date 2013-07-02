
var Game = {
  startTime: new Date().getTime(),
  endTime: 0,
  duration: 0
}


function Player(player_id,css_id,wins,losses,name){
  this.name = name;
  this.player_id = player_id;
  this.css_id = css_id
  this.position = 0;
  this.wins = wins;
  this.losses = losses;
}

Player.prototype.advance = function(){
  this.position += Math.floor(Math.random()*10+10);
  if (this.position >= 100 ){
    winner(this);
  }
};


var winner = function(winningPlayer){
  Game.endTime = new Date().getTime();
  Game.duration = Game.endTime - Game.startTime;
  // winningPlayer.wins += 1;

  // Add loss to other player somehow???????????

  alert(winningPlayer.name+" wins!");
  reset();
  $.post('/update',{winner: winningPlayer.player_id, game_id: Game.id, game_time: Game.duration},function(){
    window.location = "/logout";
  });
  
}

var drawBoard = function(){
  $(p1.css_id).animate({left:p1.position + "%"},'fast');
  $(p2.css_id).animate({left:p2.position + "%"},'fast');
}


var reset = function(){
  p1.position = 0;
  p2.position = 0;
  drawBoard();
};

$(document).ready(function() {
  alert("Player 1 is: "+p1.name+"Player 2 is: "+p2.name);
  $(document).on('keyup', function(event) {
    if (event.keyCode == 81){
      p1.advance();
    }else if(event.keyCode == 80){
      p2.advance();
    };
    drawBoard();
    // checkWinner();
  });
});
