execute if entity @s[tag=has_jug_kit] run return fail
attribute @s movement_speed base set 0.05
attribute @s step_height base set 1
attribute @s jump_strength base set 0
stopwatch create juggernaut:windrunner_sprint_time
function juggernaut:descriptions/kits/runner/windrunner
tag @s add windrunner
tag @s add has_jug_kit