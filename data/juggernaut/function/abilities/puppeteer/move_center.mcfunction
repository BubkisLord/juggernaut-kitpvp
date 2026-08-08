# Macro: shift this owner's centre marker by a local (left, forward) offset in its own facing,
# which is level with the caster (pitch zeroed by the caller). Used to slide the ring centre back
# by the caster's slot so the caster sits on the ring instead of at its middle.
$execute as @e[type=marker,tag=pp_c] at @s rotated as @s positioned ^$(nx) ^0 ^$(nz) run tp @s ~ ~ ~
