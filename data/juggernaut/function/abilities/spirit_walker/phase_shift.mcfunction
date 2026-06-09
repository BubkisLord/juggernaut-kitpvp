execute if entity @s[tag=is_phasing] run tag @s add teleporting
execute unless entity @s[tag=is_phasing] run stopwatch create phase_time
execute unless entity @s[tag=is_phasing] run playsound minecraft:block.end_portal_frame.fill master @a[distance=..20] ~ ~ ~ 3 1.1 1
execute unless entity @s[tag=is_phasing] run tag @s add is_phasing