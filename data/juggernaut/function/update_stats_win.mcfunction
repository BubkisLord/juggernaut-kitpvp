execute if score #juggernaut_customisation debug_mode matches 1 run return fail
$scoreboard players operation #juggernaut_manager picked_kit_$(kit) += #$(kit)_count var
$scoreboard players operation #juggernaut_manager $(kit)_wins += #$(kit)_count var