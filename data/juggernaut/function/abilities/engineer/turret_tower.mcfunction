summon armor_stand ~ ~ ~ {Invisible:true,Invulnerable:true,NoGravity:true,Tags:["turret","engineer_tower","kill_on_end_game"],Small:true}
summon skeleton ~ ~ ~ {Team:"runner",DeathLootTable:"",attributes:[{id:"max_health",base:30},{id:"movement_speed",base:0}],Tags:["kill_on_end_game","skeleton_turret"],Invulnerable:true,equipment:{mainhand:{id:"bow",count:1,components:{enchantments:{punch:1}}}},drop_chances:{mainhand:0}}
scoreboard players set @n[type=armor_stand,tag=turret] var 60
scoreboard players set @n[type=armor_stand,tag=turret] dispel_progress 0
scoreboard players set @n[type=armor_stand,tag=turret] total_dispelling_needed 5