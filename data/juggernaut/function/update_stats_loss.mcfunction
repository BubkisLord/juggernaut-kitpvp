execute if score #juggernaut_customisation debug_mode matches 1 run return fail
$scoreboard players add #juggernaut_manager picked_kit_$(kit) 1
$scoreboard players add #$(kit)_count var 1
$scoreboard players operation #juggernaut_manager $(kit)_losses += #$(kit)_count var