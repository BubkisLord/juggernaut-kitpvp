function juggernaut:effects/apply_effect {effect:"not_replenishing",duration:12}
function juggernaut:effects/apply_effect {effect:"undetectable",duration:10}
function juggernaut:effects/apply_effect {effect:"no_ghost_particles",duration:10}
function juggernaut:effects/apply_effect {effect:"allow_ghost_invisibility",duration:5}
effect give @s invisibility 5 0 true
scoreboard players set @n[type=armor_stand,tag=replenishment.station,distance=..6] replenish_timeout 0