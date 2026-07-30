tag @a remove lobby.player
execute as @a run item replace entity @s armor.head with netherite_helmet
execute as @a run item replace entity @s armor.chest with netherite_chestplate
execute as @a run item replace entity @s armor.legs with netherite_leggings
execute as @a run item replace entity @s armor.feet with netherite_boots
execute as @a run item replace entity @s hotbar.0 with stone_spear[attack_range={hitbox_margin:1,max_reach:10,min_reach:6}]
execute as @a run attribute @s bounciness base set 120
execute as @a run attribute @s air_drag_modifier base set 0.2
execute as @a run attribute @s friction_modifier base set 0.2
execute as @a run attribute @s jump_strength base set 0.5
execute as @a run attribute @s safe_fall_distance base set 999
spawnpoint @a 200 80 20
tp @a 200 80 20
effect give @a saturation infinite 255 true