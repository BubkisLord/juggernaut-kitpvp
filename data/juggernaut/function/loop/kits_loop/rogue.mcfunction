# Rogue
# Stealth Expertise Passive
execute as @a[tag=rogue,scores={is_sneaking=1}] run attribute @s step_height base set 1
execute as @a[tag=rogue,scores={is_sneaking=0}] run attribute @s step_height base set 0.6