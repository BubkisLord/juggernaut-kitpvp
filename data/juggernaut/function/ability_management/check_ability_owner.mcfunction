data modify storage juggernaut:ability_management/check_ability_owner owner set from entity @s Thrower
function juggernaut:ability_management/give_owner_tag with storage juggernaut:ability_management/check_ability_owner
$execute if score #game_state var matches 11 as @p[tag=ability_owner] at @s run function juggernaut:ability_management/use_ability {\
    player_tag:$(player_tag),\
    cooldown:$(cooldown),\
    item_name:$(item_name),\
    hotbar_slot:$(hotbar_slot),\
    cooldown_var:$(cooldown_var),\
    ability_id:"$(ability_id)"\
}
execute if score #game_state var matches 10..12 unless score #game_state var matches 11 as @a[tag=ability_owner] at @s run particle angry_villager ~ ~ ~ 0.5 1 0.5 0 60 force @s
$execute if score #game_state var matches 10..12 unless score #game_state var matches 11 as @a[tag=ability_owner] run scoreboard players set @s $(cooldown_var) 2
kill @s
tag @a remove ability_owner
data modify storage juggernaut:ability_management/check_ability_owner * set value {}