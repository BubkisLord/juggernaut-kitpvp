execute as @a[tag=spirit_walker] run function juggernaut:ability_management/check_ability {\
    player_tag:"spirit_walker",\
    item_id:"minecraft:amethyst_shard",\
    item_name:{"text":"Teleport","color":"dark_purple"},\
    description:[{"text":"Hold to charge a teleport through blocks.","color":"gray"}],\
    ability_id:"phase_shift",\
    cooldown:3,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown0",\
}

execute if stopwatch minecraft:phase_time 1.02.. run tag @a[tag=spirit_walker,tag=is_phasing] add teleporting
execute as @a[tag=spirit_walker,tag=is_phasing] at @s store result storage juggernaut:abilities/spirit_walker/execute_phase teleport_distance long 1 run stopwatch query phase_time 12.8
execute as @a[tag=spirit_walker,tag=is_phasing] at @s run function juggernaut:abilities/spirit_walker/execute_phase with storage juggernaut:abilities/spirit_walker/execute_phase
execute as @a[tag=spirit_walker,tag=is_phasing,tag=teleporting] run tag @s remove is_phasing
execute as @a[tag=spirit_walker,tag=teleporting] run tag @s remove teleporting

execute if entity @n[type=mannequin,tag=phase_shift_destination] run team modify runner nametagVisibility hideForOtherTeams
execute unless entity @n[type=mannequin,tag=phase_shift_destination] run team modify runner nametagVisibility always