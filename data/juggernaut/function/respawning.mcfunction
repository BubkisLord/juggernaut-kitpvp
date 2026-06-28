scoreboard players set @s lives_remaining 0
scoreboard players operation @s lives_remaining = @s lives
scoreboard players operation @s lives_remaining -= @s game_deaths

scoreboard players set @s chase_timeout 0

effect give @s saturation infinite 255 true

execute if score @s lives_remaining matches 1.. run spawnpoint @s 0 101 0
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_undying_ties] run tag @a remove undying_ties_target
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_undying_ties] as @r[tag=runner,scores={health=1..}] run tag @s add undying_ties_target
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_undying_ties] if entity @a[tag=undying_ties_target] at @p[tag=undying_ties_target] run spawnpoint @s ~ ~ ~
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_undying_ties] if entity @a[tag=undying_ties_target] at @p[tag=undying_ties_target] run tp @s ~ ~ ~
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_durable] run effect give @s health_boost 9999 1 true
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_durable] run effect give @s regeneration 2 255 true
execute if score @s lives_remaining matches 1.. if entity @s[tag=medic] run function juggernaut:kit_replenishes/replenish_medic
execute if score @s lives_remaining matches 1.. if entity @s[tag=survivor] run function juggernaut:kit_replenishes/replenish_survivor
execute if score @s lives_remaining matches 1.. if entity @s[tag=runner] run effect give @s invisibility 30 0 true
execute if score @s lives_remaining matches 1.. if entity @s[tag=runner] run tag @s add has_respawn_time
execute if score @s lives_remaining matches 1.. if entity @s[tag=runner] run scoreboard players set @s respawn_time_left 30
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_teeny_weeny] run attribute @s scale modifier add teeny_weeny -0.25 add_multiplied_base
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_lightweight] run attribute @s safe_fall_distance modifier add juggernaut:lightweight 9999 add_value
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_lightweight] run attribute @s air_drag_modifier modifier add juggernaut:lightweight -0.2 add_multiplied_base
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_lightweight] run attribute @s gravity modifier add juggernaut:lightweight 0.2 add_multiplied_total
execute if score @s lives_remaining matches 1.. if entity @s[tag=using_lightweight] run attribute @s jump_strength modifier add juggernaut:lightweight 0.2 add_multiplied_base
execute if score @s lives_remaining matches 1.. if entity @s[tag=windrunner] run attribute @s friction_modifier modifier add juggernaut:windrunner -0.9 add_multiplied_total
execute if score @s lives_remaining matches 1.. if entity @s[tag=windrunner] run attribute @s bounciness modifier add juggernaut:windrunner 0.08 add_value
tag @s remove has_hunters_mark
tag @s remove in_chase
tag @s remove hunted

execute if score @s lives_remaining matches ..0 run tag @s remove has_jug_kit
execute if score @s lives_remaining matches ..0 run tag @s remove juggernaut
execute if score @s lives_remaining matches ..0 run tag @s remove runner
execute if score @s lives_remaining matches ..0 run tag @s remove spectator
execute if score @s lives_remaining matches ..0 run tag @s remove predator
execute if score @s lives_remaining matches ..0 run tag @s remove witch_doctor
execute if score @s lives_remaining matches ..0 run tag @s remove medic
execute if score @s lives_remaining matches ..0 run tag @s remove survivor
execute if score @s lives_remaining matches ..0 run tag @s remove escapist
execute if score @s lives_remaining matches ..0 run tag @s remove scout
execute if score @s lives_remaining matches ..0 run tag @s remove engineer
execute if score @s lives_remaining matches ..0 run tag @s remove witch_doctor
execute if score @s lives_remaining matches ..0 run tag @s remove warlock
execute if score @s lives_remaining matches ..0 run tag @s remove hunter
execute if score @s lives_remaining matches ..0 run tag @s remove is_hunting
execute if score @s lives_remaining matches ..0 run tag @s remove has_hunters_mark
execute if score @s lives_remaining matches ..0 run tag @s remove dragon
execute if score @s lives_remaining matches ..0 run tag @s remove is_floating
execute if score @s lives_remaining matches ..0 run tag @s remove blinker
execute if score @s lives_remaining matches ..0 run tag @s remove spirit_walker
execute if score @s lives_remaining matches ..0 run tag @s remove guide
execute if score @s lives_remaining matches ..0 run tag @s remove trickster
execute if score @s lives_remaining matches ..0 run tag @s remove ghost
execute if score @s lives_remaining matches ..0 run tag @s remove windrunner
execute if score @s lives_remaining matches ..0 run tag @s remove saved_skin

execute if score @s lives_remaining matches ..0 run attribute @s max_health base set 20
execute if score @s lives_remaining matches ..0 run attribute @s scale base set 1
execute if score @s lives_remaining matches ..0 run attribute @s gravity base set 0.08
execute if score @s lives_remaining matches ..0 run spawnpoint @s 2000 100 0 ~ ~
execute if score @s lives_remaining matches ..0 run tag @s add lobby.player
execute if score @s lives_remaining matches ..0 run clear @s
