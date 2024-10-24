execute at @s run effect give @a[distance=0..6] levitation 5 10 false
execute at @s run particle minecraft:firework ~ ~-0.3 ~ 5 0 5 0 200 force
execute at @s run playsound minecraft:entity.shulker.shoot master @a ~ ~ ~ 1.2 1.3
execute at @s run playsound minecraft:block.sweet_berry_bush.place master @a ~ ~ ~ 1.2 0
execute at @s run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.2 2
execute at @s run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.2 0
kill @s