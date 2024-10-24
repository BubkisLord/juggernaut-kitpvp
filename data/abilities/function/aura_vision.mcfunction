execute at @s run effect give @a[distance=0..16,tag=!auramancer,tag=!hider,tag=!seeker] glowing 1 0 false
effect give @s[tag=assistant_seeker] glowing 1 0 false
execute at @s run effect give @a[tag=ghost] glowing 1 0 false
execute as @s at @s run particle end_rod ~ ~1 ~ 0.2 0.5 0.2 0.01 1 normal
scoreboard players add @s aura_sound 1