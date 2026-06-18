# When playing a specific game.
execute if score #game_state var matches 10..19 run function juggernaut:loop/mainloop
execute if score #game_state var matches 20..29 run function survival:loop/mainloop

# Always run
execute if entity @a[scores={health=..0}] as @a[scores={health=..0}] run function scoreboard:respawning
function other:cleanup
function text:bossbar
function other:safelobby
execute unless score #game_state var matches 10..12 run function other:replenishment_stations