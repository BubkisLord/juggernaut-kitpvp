execute as @a[tag=spirit_walker] run attribute @s step_height base set 0.6
execute as @a[tag=spirit_walker] run attribute @s jump_strength base set 0.4199999
execute as @a[tag=spirit_walker] run item replace entity @s armor.head with diamond_helmet[unbreakable={}]
execute as @a[tag=spirit_walker] run item replace entity @s armor.chest with diamond_chestplate[unbreakable={}]
execute as @a[tag=spirit_walker] run item replace entity @s armor.legs with diamond_leggings[unbreakable={}]
execute as @a[tag=spirit_walker] run item replace entity @s armor.feet with diamond_boots[unbreakable={}]
execute as @a[tag=spirit_walker] run item replace entity @s hotbar.0 with diamond_sword[unbreakable={},enchantments={sharpness:4}]
playsound block.note_block.pling master @s ~ ~ ~ 3 0.1