# First try: 8 blocks from the Juggernaut in a random direction, landing anywhere within 4 blocks of that point.
$execute at @p[tag=juggernaut,tag=in_chase] rotated $(rotation) 0 positioned ^ ^ ^8 store success score #misty_step_ok var run spreadplayers ~ ~ 0 4 under $(max_height) false @s
# Fallback if that whole area was unsafe (water, void, wall, hill): anywhere within 8 blocks of the Juggernaut.
$execute if score #misty_step_ok var matches 0 at @p[tag=juggernaut,tag=in_chase] store success score #misty_step_ok var run spreadplayers ~ ~ 0 8 under $(max_height) false @s
