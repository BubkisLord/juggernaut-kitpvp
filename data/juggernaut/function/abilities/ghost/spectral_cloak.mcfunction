function juggernaut:effects/apply_effect {effect:"not_replenishing",duration:6,color:"gray"}
function juggernaut:effects/apply_effect {effect:"undetectable",duration:6,color:"gray"}
effect give @s invisibility 6 0 true
scoreboard players set @n[type=armor_stand,tag=replenishment.station,distance=..6] replenish_timeout 0
tag @s add spectral_cloak_active
scoreboard players set @s ability_cooldown3 10000