# Completely heal all damaged players, and 99 all undamaged players. (Healed in < 0.5 seconds as that is when the try_heal_player function runs)
execute as @a[distance=..8,tag=runner] run scoreboard players set @s healing_progress 99
execute as @a[distance=..8,tag=runner,tag=!survivor,scores={health=..19}] run scoreboard players set @s healing_progress 100
execute as @a[distance=..8,tag=runner,tag=survivor,scores={health=..39}] run scoreboard players set @s healing_progress 100