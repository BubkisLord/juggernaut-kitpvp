# Run as a puppet, positioned one step ahead of it against a single-block obstacle. Steps up onto it.
# Rotation is passed explicitly as ~ ~ so the puppet's heading survives the teleport intact.
tp @s ~ ~1 ~ ~ ~
tag @s add pp_stepped
