# If there are no runners or juggernauts then the game will end.
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run tellraw @a {"text": "Runners win! (Juggernaut Dead/Not Found)","bold": true}
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run scoreboard players add @a[tag=runner] points 100
execute if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run function juggernaut:end_game

execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run tellraw @a {"text": "Juggernaut wins! (Runners Dead/Not Found)","bold": true}
execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run scoreboard players add @a[tag=juggernaut] points 100
execute if score #game_state var matches 10..19 unless entity @a[tag=runner] run function juggernaut:end_game

#The replenish progress mode for winning the game.
execute if score #juggernaut_customisation completable_stations matches 0 if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run tellraw @a {"text": "Runners win! (Replenishment Complete)","bold": true}
execute if score #juggernaut_customisation completable_stations matches 0 if score #game_state var matches 10..19 unless entity @a[tag=juggernaut] run scoreboard players add @a[tag=runner] points 100
execute if score #juggernaut_customisation completable_stations matches 0 if score #game_state var matches 10..19 if score @n[type=armor_stand,tag=juggernaut_manager] replenish_progress >= @n[type=armor_stand,tag=juggernaut_manager] total_replenishment_needed run function juggernaut:end_game