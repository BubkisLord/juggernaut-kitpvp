execute as @s[tag=!has_jug_kit] run item replace entity @s armor.head with leather_helmet[unbreakable={},lore=[{"text":"Keeps the ticking sound out. Mostly.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.chest with leather_chestplate[unbreakable={},lore=[{"text":"Time-resistant fabric.","color":"dark_gray"},{"text":"Not spill-resistant, sadly.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.legs with leather_leggings[unbreakable={},lore=[{"text":"Crafted to stride through different time speeds.","color":"dark_gray"},{"text":"Mind the temporal drag.","color":"dark_gray"}]]
execute as @s[tag=!has_jug_kit] run item replace entity @s armor.feet with leather_boots[unbreakable={},lore=[{"text":"Try not to trip on your own timestream.","color":"dark_gray"},{"text":"(Otherwise they get muddled up sometimes)","color":"dark_gray"}],enchantments={depth_strider:3}]
execute as @s[tag=!has_jug_kit] run give @s trident[item_name={"text": "Speartooth Trident"},enchantments={riptide:3},lore=[{"text":"","color":"dark_gray"}],unbreakable={}]
execute as @s[tag=!has_jug_kit] run attribute @s safe_fall_distance modifier add max_fishmonger_fall_distance 999 add_value
execute as @s[tag=!has_jug_kit] run attribute @s water_movement_efficiency base set 999999
execute as @s[tag=!has_jug_kit] run weather thunder 999999999999999d
execute as @s[tag=!has_jug_kit] run summon pufferfish -32 67 -57 {Invulnerable:true,Tags:["kill_on_end_game","fishmonger_pufferfish"],CustomName:{"text":"Taffy"},CustomNameVisible:true,Team:jug,DeathLootTable:""}
execute as @s[tag=!has_jug_kit] run summon pufferfish 0 67 0 {Invulnerable:true,Tags:["kill_on_end_game","fishmonger_pufferfish"],CustomName:{"text":"Taffy"},CustomNameVisible:true,Team:jug,DeathLootTable:""}
execute as @s[tag=!has_jug_kit] run summon pufferfish -32 67 45 {Invulnerable:true,Tags:["kill_on_end_game","fishmonger_pufferfish"],CustomName:{"text":"Taffy"},CustomNameVisible:true,Team:jug,DeathLootTable:""}
execute as @e[type=pufferfish,tag=fishmonger_pufferfish] run attribute @s scale base set 8
execute as @e[type=pufferfish,tag=fishmonger_pufferfish] run attribute @s movement_speed base set 5
# execute as @s[tag=!has_jug_kit] run function juggernaut:descriptions/kits/juggernaut/fishmonger
execute as @s[tag=!has_jug_kit] run tag @s add fishmonger
tag @s add has_jug_kit