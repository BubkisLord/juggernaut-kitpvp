# Run as a puppet at the puppet. One tick of running forward and hopping, driven entirely off the
# puppet's own heading with no reference to the caster - which is what lets each puppet peel away
# on its own line instead of trailing the player around like a shield.

# Forward step. Take it only if the space ahead is clear, otherwise climb a single block. The
# pp_stepped tag stops the climb from firing on the new position after a step already succeeded.
tag @s remove pp_stepped
execute positioned ^ ^ ^0.22 if block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/step_puppet
execute if entity @s[tag=!pp_stepped] positioned ^ ^ ^0.22 unless block ~ ~ ~ #juggernaut:raycast_permeable if block ~ ~1 ~ #juggernaut:raycast_permeable if block ~ ~2 ~ #juggernaut:raycast_permeable run function juggernaut:abilities/puppeteer/climb_puppet
tag @s remove pp_stepped

# Fall to the ground beneath in whole-block steps, which keeps the puppet's height block-aligned so
# the symmetric hop below always returns it to exactly the height it took off from.
execute if block ~ ~-1 ~ #juggernaut:raycast_permeable run tp @s ~ ~-1 ~

# Hop cycle: four ticks up, four ticks back down, then a randomised pause before the next one. The
# pause is rolled per puppet, so the crowd never bounces in lockstep the way a scripted mob would.
scoreboard players add @s puppet_hop 1
execute if score @s puppet_hop matches 1..4 run tp @s ~ ~0.15 ~
execute if score @s puppet_hop matches 5..8 run tp @s ~ ~-0.15 ~
execute if score @s puppet_hop matches 9.. store result score @s puppet_hop run random value -10..0
