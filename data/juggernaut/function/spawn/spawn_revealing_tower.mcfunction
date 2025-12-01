kill @e[tag=revealing_tower]
summon armor_stand ~ ~0.5 ~ {Invisible:true,Invulnerable:true,CustomName:{"text": "Revealing Tower","bold": true,"color": "gold"},CustomNameVisible:false,Small:true,NoGravity:true,Tags:["revealing_tower","engineer_tower","kill_on_end_game"]}
# Duration
scoreboard players set @n[type=armor_stand,tag=revealing_tower] var 60
scoreboard players set @n[type=armor_stand,tag=revealing_tower] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=revealing_tower] total_dispelling_needed 10
clear @s raw_gold_block