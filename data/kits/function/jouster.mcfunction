tag @s remove lobby.player
clear @s
tag @s add jouster
give @s iron_sword[item_name='{"text":"Jousting Lance","color":"gold","italic":false}',lore=['{"text":"They were all out of Tridents!","color":"dark_gray"}'],unbreakable={},enchantments={sharpness:2},hide_additional_tooltip={}]
give @s cooked_beef[item_name='{"text":"Steak","color":"gold","italic":false}',lore=['{"text":"Eat to regenerate.","color":"dark_gray"}']] 16
give @s horse_spawn_egg[item_name='{"text":"Thunderhoof","color":"gold","italic":false}',lore=['{"text":"Summon your trusty steed.","color":"dark_gray"}'],entity_data={id:"minecraft:horse",Variant:1,PersistenceRequired:1b,CanPickUpLoot:0b,Attributes:[{Name:"generic.movement_speed",Base:0.4f},{Name:"minecraft:generic.jump_strength",Base:0.9f}],Invulnerable:0b,SaddleItem:{id:saddle,Count:1},Age:0,Tame:1b,Tags:["lancer.horse"]},hide_additional_tooltip={},can_place_on={blocks:["minecraft:grass_block","minecraft:stone","minecraft:cobblestone","minecraft:andesite","minecraft:netherrack","minecraft:sand","minecraft:sandstone","minecraft:short_grass","minecraft:tall_grass","minecraft:snow","minecraft:snow_block","minecraft:gravel","minecraft:soul_sand","minecraft:magma_block","minecraft:bone_block","minecraft:oak_wood","minecraft:oak_log","minecraft:coarse_dirt","minecraft:dirt_path"]}] 3
item replace entity @s armor.chest with leather_chestplate[item_name='{"text":"Jousting Tunic","color":"gold","italic":false}',lore=['{"text":"Avoid being hit.","color":"dark_gray"}'],dyed_color=13881807,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.legs with leather_leggings[item_name='{"text":"Joster\'s Trousers","color":"gold","italic":false}',lore=['{"text":"Great for horseback riding.","color":"dark_gray"}'],dyed_color=13881807,unbreakable={},hide_additional_tooltip={}]
item replace entity @s armor.feet with iron_boots[item_name='{"text":"Metal Shoes","color":"gold","italic":false}',lore=['{"text":"For that tiny bit of extra protection.","color":"dark_gray"}'],unbreakable={},hide_additional_tooltip={}]
tp @s @e[tag=arena.spawn,limit=1,sort=random]
execute at @s run particle witch ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.2 1
tellraw @s {"text":" "}
tellraw @s [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"text":"You have selected the ","color":"yellow","bold":false},{"text":"Jouster ","color":"gold","bold":false},{"text":"kit.","color":"yellow","bold":false}]
tellraw @s {"text":" "}