execute as @a at @s run summon armor_stand ~ ~ ~ {Tags:["kill_on_end_game","timekeeper_mark_point"],NoGravity:true,Invisible:true,Invulnerable:true,Marker:true,Small:true}
execute as @a at @s run data modify entity @n[type=armor_stand,tag=timekeeper_mark_point] last_hurt_by_player set from entity @s UUID
stopwatch create temporal_mark_timer
stopwatch restart temporal_mark_timer