execute if entity @a[tag=fishmonger] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with leather_helmet[unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[unbreakable={}]
item replace entity @s armor.legs with leather_leggings[unbreakable={}]
item replace entity @s armor.feet with leather_boots[unbreakable={},enchantments={depth_strider:3}]
give @s trident[item_name={"text": "Speartooth Trident"},enchantments={riptide:1},damage=248,lore=[{"text":"","color":"dark_gray"}]] 1
attribute @s safe_fall_distance modifier add max_fishmonger_fall_distance 999 add_value
attribute @s water_movement_efficiency base set 999999
weather thunder 999999999999999d
summon pufferfish -32 67 -57 {Invulnerable:true,Tags:["kill_on_end_game","fishmonger_pufferfish"],CustomName:{"text":"Taffy"},CustomNameVisible:true,Team:jug,DeathLootTable:""}
summon pufferfish 0 67 0 {Invulnerable:true,Tags:["kill_on_end_game","fishmonger_pufferfish"],CustomName:{"text":"Taffy"},CustomNameVisible:true,Team:jug,DeathLootTable:""}
summon pufferfish -32 67 45 {Invulnerable:true,Tags:["kill_on_end_game","fishmonger_pufferfish"],CustomName:{"text":"Taffy"},CustomNameVisible:true,Team:jug,DeathLootTable:""}
execute as @e[type=pufferfish,tag=fishmonger_pufferfish] run attribute @s scale base set 8
execute as @e[type=pufferfish,tag=fishmonger_pufferfish] run attribute @s movement_speed base set 5
function juggernaut:descriptions/kits/juggernaut/fishmonger
tag @s add fishmonger
tag @s add has_jug_kit