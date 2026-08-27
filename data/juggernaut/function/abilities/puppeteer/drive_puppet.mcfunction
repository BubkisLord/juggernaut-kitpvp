# Run as a puppet at the puppet. One tick of sprint-jumping, driven entirely off the puppet's own
# heading with no reference to the caster - which is what lets each puppet peel away on its own line
# instead of trailing the player around like a shield.

# Forward step. Sprint pace on the ground, faster again while airborne, because a real sprint jump
# carries more speed than the run-up into it. That difference is most of what separates the gait
# from a walk with hops in it. The two lines are mutually exclusive on puppet_hop, so they can never
# both fire in the same tick and double the step.
tag @s remove pp_stepped
execute if score @s puppet_hop matches 1..10 positioned ^ ^ ^0.36 if block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/step_puppet
execute unless score @s puppet_hop matches 1..10 positioned ^ ^ ^0.28 if block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/step_puppet

# Blocked rather than merely stepped up to, so climb it. Guarded by pp_stepped so the climb cannot
# fire against the new position after a step has already succeeded this tick.
execute if entity @s[tag=!pp_stepped] positioned ^ ^ ^0.28 unless block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable if block ~ ~2 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/climb_puppet
tag @s remove pp_stepped

# Fall to the ground beneath in whole-block steps. Suppressed for the whole airborne stretch of the
# jump: without that guard, the moment the puppet clears its own standing block the ground check
# sees air underneath and yanks it straight back down, cancelling every jump before it is seen.
execute unless score @s puppet_hop matches 1..10 if block ~ ~-1 ~ #juggernaut:raycast_permeable run tp @s ~ ~-1 ~ ~ ~

# Launch the next jump the moment the puppet is stood on something. There is no pause built in - a
# sprinting player is airborne again the tick after they land, and leaving a gap here is what made
# the gait read as walk-jump-walk-jump. A puppet that has run off a ledge is not grounded, so it
# holds here and falls properly instead of launching itself out of mid-air.
execute if score @s puppet_hop matches ..0 unless block ~ ~-1 ~ #juggernaut:raycast_permeable run scoreboard players add @s puppet_hop 1

# The jump arc, roughly a vanilla player's: ~1.25 blocks up over five ticks, decelerating into the
# apex, then a mirrored fall that accelerates back out of it. The two halves sum to exactly zero, so
# the puppet lands on precisely the height it took off from and stays block-aligned for the fall
# check above.
execute if score @s puppet_hop matches 1 run tp @s ~ ~0.42 ~ ~ ~
execute if score @s puppet_hop matches 2 run tp @s ~ ~0.33 ~ ~ ~
execute if score @s puppet_hop matches 3 run tp @s ~ ~0.25 ~ ~ ~
execute if score @s puppet_hop matches 4 run tp @s ~ ~0.17 ~ ~ ~
execute if score @s puppet_hop matches 5 run tp @s ~ ~0.08 ~ ~ ~
execute if score @s puppet_hop matches 6 run tp @s ~ ~-0.08 ~ ~ ~
execute if score @s puppet_hop matches 7 run tp @s ~ ~-0.17 ~ ~ ~
execute if score @s puppet_hop matches 8 run tp @s ~ ~-0.25 ~ ~ ~
execute if score @s puppet_hop matches 9 run tp @s ~ ~-0.33 ~ ~ ~
execute if score @s puppet_hop matches 10 run tp @s ~ ~-0.42 ~ ~ ~

# Arm the next jump once the arc is spent, then advance through it. The reset is checked before the
# advance, otherwise tick 9 would step to 10 and be reset in the same tick, silently skipping the
# last and largest step of the fall.
execute if score @s puppet_hop matches 10.. run scoreboard players set @s puppet_hop 0
execute if score @s puppet_hop matches 1..9 run scoreboard players add @s puppet_hop 1
