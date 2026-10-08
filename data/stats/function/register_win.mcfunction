execute if score #juggernaut_customisation debug_mode matches 1 run return fail

# Repeat for each player that has this kit selected
$execute if data storage juggernaut:kits {kits:[{id:"$(id)",current_count:0}]} run return fail
$data modify storage juggernaut:kits kits[{id:"$(id)"}].current_count set compute default integer {type:"sub",left:{type:"minecraft:storage",storage:"juggernaut:kits",path:"kits[{id:'$(id)'}].current_count",fallback:{type:"constant",value:1}},right:{type:"constant",value:1}}
$execute unless data storage juggernaut:kits {kits:[{id:"$(id)",current_count:0}]} run function stats:register_loss {id: "$(id)"}

$data modify storage juggernaut:kits kits[{id:"$(id)"}].wins set compute default integer {type:"add",inputs:[{type:"minecraft:storage",storage:"juggernaut:kits",path:"kits[{id:'$(id)'}].wins",fallback:{type:"constant",value:0}},{type:"constant",value:1}]}
$data modify storage juggernaut:kits kits[{id:"$(id)"}].times_picked set compute default integer {type:"add",inputs:[{type:"minecraft:storage",storage:"juggernaut:kits",path:"kits[{id:'$(id)'}].times_picked",fallback:{type:"constant",value:0}},{type:"constant",value:1}]}
$data modify storage juggernaut:kits kits[{id:"$(id)"}].win_ratio set compute default float {type:"div",left:{type:"minecraft:storage",storage:"juggernaut:kits",path:"kits[{id:'$(id)'}].wins",fallback:{type:"constant",value:0}},right:{type:"minecraft:storage",storage:"juggernaut:kits",path:"kits[{id:'$(id)'}].losses",fallback:{type:"constant",value:1}}}