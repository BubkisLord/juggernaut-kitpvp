function juggernaut:end_game
function survival:end_game
function survival:remove_chests
scoreboard objectives remove health
scoreboard objectives remove lives_remaining
scoreboard objectives add health health {"text": "Health","color":green}
scoreboard objectives setdisplay below_name health
scoreboard objectives add lives_remaining dummy {"text": "Remaining Lives","color":"#ff771d"}
scoreboard objectives setdisplay list lives_remaining