# Run as a puppet, positioned one step ahead of it. Commits the step and marks it as taken.
# Rotation is passed explicitly as ~ ~ so the puppet's heading survives the teleport intact.
tp @s ~ ~ ~ ~ ~
tag @s add pp_stepped
