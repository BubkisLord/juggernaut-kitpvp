function juggernaut:effects/apply_effect_silent {effect:"not_replenishing",duration:5,color:"gray"}
function juggernaut:effects/apply_effect_silent {effect:"undetectable",duration:5,color:"gray"}
effect give @s invisibility 5 0 true
tag @s add spectral_cloak_active
scoreboard players set @s ability_cooldown3 5