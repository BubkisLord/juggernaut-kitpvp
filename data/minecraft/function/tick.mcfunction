# When playing a specific game.
execute if score #game_state var matches 10..19 run function juggernaut:loop/mainloop
execute if score #game_state var matches 20..29 run function survival:loop/mainloop
execute if score #game_state var matches 30..39 run function king_of_the_hill:loop/mainloop
execute if score #game_state var matches 50..59 run function hide_and_seek:loop/mainloop

# When all games are off / When playing KitPVP
execute if score #game_state var matches 0 run function tp:shulker_tp
execute if score #game_state var matches 0 run function abilities:kitabilities
execute if score #game_state var matches 0 run function other:autorespawn
execute if score #game_state var matches 0 run function shop:shopbrain
execute if score #game_state var matches 0 run function tp:exit_item

kill @e[type=end_crystal]
kill @e[type=tnt_minecart]
kill @e[type=tnt]
kill @e[type=ghast]
kill @e[type=creeper]
kill @e[type=wither]
kill @e[type=ender_dragon]
kill @e[type=wither_skull]
execute as @e[type=armadillo] run damage @s 1 magic

# Always run
function scoreboard:killstreak
function other:cleanup
function text:bossbar
function other:nether
function other:safelobby
function other:replenishment_stations