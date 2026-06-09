execute if entity @a[tag=witch_doctor] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with leather_helmet[enchantments={protection:2},unbreakable={}]
item replace entity @s armor.chest with leather_chestplate[enchantments={protection:2},unbreakable={}]
item replace entity @s armor.legs with leather_leggings[enchantments={protection:2},unbreakable={}]
item replace entity @s armor.feet with leather_boots[enchantments={protection:2},unbreakable={}]
give @s blackstone[attribute_modifiers=[{type:"minecraft:attack_damage",id:"minecraft:attack_damage",amount:6.5,operation:"add_value"}]]
function juggernaut:descriptions/kits/juggernaut/witch_doctor
tag @s add witch_doctor
tag @s add has_jug_kit