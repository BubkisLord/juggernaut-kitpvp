execute if score #juggernaut_customisation debug_mode matches 1 run return fail
$data modify storage juggernaut:kits kits[{id:"$(id)"}].current_count set compute default integer {type:"add",inputs:[{type:"minecraft:storage",storage:"juggernaut:kits",path:"kits[{id:\"$(id)\"}].current_count",fallback:{type:"constant",value:0}},{type:"constant",value:1}]}
