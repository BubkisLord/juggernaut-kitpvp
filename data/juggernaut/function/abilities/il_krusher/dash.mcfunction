# Il Krusher - Crushing Dash (Active)
# The cooldown is already set by use_ability before this runs.
playsound minecraft:entity.ravager.roar master @a[distance=..32] ~ ~ ~ 1.2 0.8
playsound minecraft:entity.player.attack.sweep master @a[distance=..32] ~ ~ ~ 1 0.7

# Clear any leftover crush markers so each runner can be hit once this dash.
tag @a[tag=runner] remove il_krusher_crushed

# Charge forward for the next 8 ticks (handled per-tick in the kit loop).
scoreboard players set @s il_krusher_dash_ticks 8
tag @s add il_krusher_dashing
