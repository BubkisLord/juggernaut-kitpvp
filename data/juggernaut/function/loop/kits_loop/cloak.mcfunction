# Cloak
# Veil of Shadows
execute as @a[tag=cloak,scores={is_sneaking=1},tag=!in_chase] at @s as @a[tag=runner,distance=..8] at @s run function juggernaut:effects/apply_effect_silent {effect:"undetectable",duration:1}