summon mannequin ~ ~ ~ {Tags:["encore_mannequin","runner","kill_on_end_game","pp_new_mannequin"],pose:"standing",Health:30f,attributes:[{id:"max_health",base:30}],Rotation:[0f,0f],Team:"runner"}
execute if entity @s[tag=using_teeny_weeny] as @n[type=mannequin,tag=pp_new_mannequin] run attribute @s scale modifier add teeny_weeny -0.25 add_multiplied_base
data modify entity @n[type=mannequin,tag=pp_new_mannequin] profile.id set from entity @s UUID
scoreboard players operation @n[type=mannequin,tag=pp_new_mannequin] puppet_id = @s puppet_id
scoreboard players operation @n[type=mannequin,tag=pp_new_mannequin] start_performance_tick = @s start_performance_tick
execute as @n[type=mannequin,tag=pp_new_mannequin] run function juggernaut:effects/apply_effect {effect:"encore_timeout",duration:20}
tag @n[type=mannequin,tag=pp_new_mannequin] remove pp_new_mannequin