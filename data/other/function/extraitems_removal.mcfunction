execute as @a[tag=tutorial.player] store result score @s clearcount run clear @s minecraft:enchanted_book 0
clear @a[tag=tutorial.player,scores={clearcount=2..}] minecraft:enchanted_book

execute as @a[tag=!lobby.player,tag=!tutorial.player,tag=!autorespawn] store result score @s clearcount run clear @s minecraft:red_bed 0
execute as @a[tag=!lobby.player,tag=!tutorial.player,tag=autorespawn] store result score @s clearcount run clear @s minecraft:lime_bed 0
clear @a[tag=!lobby.player,tag=!tutorial.player,tag=!autorespawn,scores={clearcount=2..}] minecraft:red_bed
clear @a[tag=!lobby.player,tag=!tutorial.player,tag=autorespawn,scores={clearcount=2..}] minecraft:lime_bed
clear @a[tag=!lobby.player,tag=!tutorial.player,tag=autorespawn] minecraft:red_bed
clear @a[tag=!lobby.player,tag=!tutorial.player,tag=!autorespawn] minecraft:lime_bed

scoreboard players set @a[scores={clearcount=2..}] clearcount 0