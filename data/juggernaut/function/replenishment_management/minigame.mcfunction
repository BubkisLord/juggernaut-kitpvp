playsound minecraft:block.note_block.pling ui @s ~ ~ ~ 0.4 1.8
kill @e[tag=replenish_minigame_target,distance=..10]
summon bat ~ ~ ~ {Tags:["kill_on_end_game","replenish_minigame_target"],NoGravity:true,NoAI:true,Silent:true,Health:0.1f,active_effects:[{id:"invisibility",duration:-1,show_particles:false}]}
execute store result storage juggernaut:minigame_target_offset y_mod float 1 run random value 0..2
execute store result storage juggernaut:temp y double 1 run data get entity @s Pos[1]
function juggernaut:replenishment_management/spread_minigame_target with storage juggernaut:temp
function juggernaut:replenishment_management/offset_minigame_target with storage juggernaut:minigame_target_offset