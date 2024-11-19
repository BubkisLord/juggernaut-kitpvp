effect give @a invisibility 10 0 true
effect give @s speed 10 1 true
attribute @s generic.step_height base set 1
attribute @s generic.jump_strength base set 0
playsound minecraft:item.firecharge.use master @a[tag=runner,distance=..10] ~ ~ ~ 3 0.1
playsound block.note_block.pling master @s ~ ~ ~ 3 0.1
item replace entity @s armor.head with air
item replace entity @s armor.chest with air
item replace entity @s armor.legs with air
item replace entity @s armor.feet with air
item replace entity @s hotbar.0 with air
execute as @s run schedule function juggernaut:abilities/spirit_walker/disable_phase_shift 10s append