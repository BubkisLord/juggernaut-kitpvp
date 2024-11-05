# When playing a specific game.
execute if score #game_state var matches 10..19 run function juggernaut:loop/mainloop
execute if score #game_state var matches 20..29 run function survival:loop/mainloop
execute if score #game_state var matches 30..39 run function king_of_the_hill:loop/mainloop

# When all games are off / When playing KitPVP
execute if score #game_state var matches 0 run function tp:shulker_tp
execute if score #game_state var matches 0 run function abilities:kitabilities
execute if score #game_state var matches 0 run function scoreboard:killstreak
execute if score #game_state var matches 0 run function other:autorespawn
execute if score #game_state var matches 0 run function shop:shopbrain
execute if score #game_state var matches 0 run function tp:exit_item

# Always run
function other:cleanup
function text:bossbar
function other:nether
function other:safelobby
function other:replenishment_stations