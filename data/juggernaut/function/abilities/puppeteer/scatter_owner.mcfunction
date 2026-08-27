# Macro: fling the caster clear along heading $(yaw). Tries the furthest landing spot first and
# falls back to closer ones so the caster can never be thrown into the arena's geometry - if none
# of the three are open they simply stay put, still hidden by the crowd spawning on top of them.
$execute unless entity @s[tag=pp_scattered] rotated $(yaw) 0 positioned ^ ^ ^3.5 if block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/land_owner
$execute unless entity @s[tag=pp_scattered] rotated $(yaw) 0 positioned ^ ^ ^2.5 if block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/land_owner
$execute unless entity @s[tag=pp_scattered] rotated $(yaw) 0 positioned ^ ^ ^1.5 if block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/land_owner
