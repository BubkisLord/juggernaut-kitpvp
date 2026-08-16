execute if entity @a[tag=phantom] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.feet with iron_boots[unbreakable={},enchantments={feather_falling:3}]
tellraw @a[tag=juggernaut] [{"selector":"@s"},{"text":": ","color":"red"},{"text": "Selected ","color":"white"},{"text":"Phantom","color":"#4f298f"},{"text":" Kit.","color":"white"}]
attribute @s movement_speed modifier add juggernaut:phantom_move_spd -0.12 add_multiplied_base
item replace entity @s hotbar.0 with iron_sword[unbreakable={},item_name=[{"text": "Spirit Slicer","bold":false,"color":"#5e556e"},{"text": " | ","color": "dark_gray","bold": true},{"text": "MELEE WEAPON","color": "gray","bold": true}]]
function juggernaut:descriptions/kits/juggernaut/phantom
tag @s add phantom
tag @s add has_jug_kit