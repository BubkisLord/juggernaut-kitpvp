effect give @a invisibility infinite 0 true
effect give @s speed infinite 1 true
attribute @s step_height base set 1
attribute @s jump_strength base set 0
playsound minecraft:item.firecharge.use master @a[tag=runner,distance=..10] ~ ~ ~ 3 0.1
playsound block.note_block.pling master @s ~ ~ ~ 3 0.1
item replace entity @s armor.head with air
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
item replace entity @s hotbar.0 with air
execute if entity @s[tag=not_phasing] run tag @s remove not_phasing

execute if entity @s[tag=is_phasing] run function juggernaut:abilities/spirit_walker/disable_phase_shift
execute if entity @s[tag=is_phasing] run tag @s add not_phasing
execute if entity @s[tag=is_phasing] run tag @s remove is_phasing

execute if entity @s[tag=!not_phasing] run tag @s add is_phasing