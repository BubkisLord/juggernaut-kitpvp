execute if entity @a[tag=il_krusher] run return fail
execute if entity @s[tag=has_jug_kit] run return fail
item replace entity @s armor.head with netherite_helmet[unbreakable={}]
item replace entity @s armor.chest with netherite_chestplate[unbreakable={}]
item replace entity @s armor.legs with netherite_leggings[unbreakable={}]
item replace entity @s armor.feet with netherite_boots[unbreakable={}]
item replace entity @s hotbar.0 with mace[unbreakable={},enchantments={density:3},item_name={"text":"Il Krusher's Maul","color":"#c0392b"},tooltip_display={hidden_components:["unbreakable","enchantments"]}]
effect give @s resistance infinite 0 true
function juggernaut:descriptions/kits/juggernaut/il_krusher
tag @s add il_krusher
tag @s add has_jug_kit
