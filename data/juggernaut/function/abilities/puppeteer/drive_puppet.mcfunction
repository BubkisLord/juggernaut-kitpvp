# Run as a puppet at the puppet. One tick of running forward and jumping, driven entirely off the
# puppet's own heading with no reference to the caster - which is what lets each puppet peel away
# on its own line instead of trailing the player around like a shield.

# Forward step. Take it only if the space ahead is clear, otherwise climb a single block. The
# pp_stepped tag stops the climb from firing on the new position after a step already succeeded.
tag @s remove pp_stepped
execute positioned ^ ^ ^0.22 if block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/step_puppet
execute if entity @s[tag=!pp_stepped] positioned ^ ^ ^0.22 unless block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable if block ~ ~2 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/climb_puppet
tag @s remove pp_stepped

# Fall to the ground beneath in whole-block steps. Suppressed for the whole airborne stretch of the
# jump: without that guard, the moment the puppet clears its own standing block the ground check
# sees air underneath and yanks it straight back down, which cancels every jump before it is seen.
execute unless score @s puppet_hop matches 1..10 if block ~ ~-1 ~ #juggernaut:raycast_permeable run tp @s ~ ~-1 ~

# Count the pause down toward the next jump, but only while stood on something solid, so a puppet
# that has run off a ledge falls properly instead of launching itself out of mid-air.
execute if score @s puppet_hop matches ..0 unless block ~ ~-1 ~ #juggernaut:raycast_permeable run scoreboard players add @s puppet_hop 1

# The jump arc, roughly a vanilla player's: ~1.25 blocks up over five ticks, decelerating into the
# apex, then a mirrored fall that accelerates back out of it. The two halves sum to exactly zero, so
# the puppet lands on precisely the height it took off from and stays block-aligned for the fall
# check above.
execute if score @s puppet_hop matches 1 run tp @s ~ ~0.42 ~
execute if score @s puppet_hop matches 2 run tp @s ~ ~0.33 ~
execute if score @s puppet_hop matches 3 run tp @s ~ ~0.25 ~
execute if score @s puppet_hop matches 4 run tp @s ~ ~0.17 ~
execute if score @s puppet_hop matches 5 run tp @s ~ ~0.08 ~
execute if score @s puppet_hop matches 6 run tp @s ~ ~-0.08 ~
execute if score @s puppet_hop matches 7 run tp @s ~ ~-0.17 ~
execute if score @s puppet_hop matches 8 run tp @s ~ ~-0.25 ~
execute if score @s puppet_hop matches 9 run tp @s ~ ~-0.33 ~
execute if score @s puppet_hop matches 10 run tp @s ~ ~-0.42 ~

# Roll a fresh randomised pause once the arc is spent, then advance through it. The reset is checked
# before the advance, otherwise tick 9 would step to 10 and be reset in the same tick, silently
# skipping the last and largest step of the fall.
execute if score @s puppet_hop matches 10.. store result score @s puppet_hop run random value -14..-4
execute if score @s puppet_hop matches 1..9 run scoreboard players add @s puppet_hop 1
