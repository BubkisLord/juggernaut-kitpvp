# Puppetteer - runs as each puppetteer, positioned at them.

# Track the mannequin's current health first, so the swap ability (registered below) can tell
# whether it has taken damage this tick.
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppetteer/track_mannequin_hp

# Slot 0: Summon Mannequin / Pickup Mannequin (mutually exclusive, like hunter's mark/pursue).
# Both share ability_cooldown0 so that consuming one does not instantly auto-trigger the other into
# the momentarily-empty slot. After summoning you must keep the mannequin for the summon cooldown.
execute unless entity @s[tag=has_mannequin] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppetteer",\
    item_id:"minecraft:armor_stand",\
    item_name:{"text": "Summon Mannequin","color": "#a64dff"},\
    description:[{"text": "Summon a stationary mannequin with lots of health.","color": "gray"},{"text": "It replenishes the nearest station at 60% efficiency.","color": "gray"},{"text": "If it dies, you die. Pickup unlocks after this cooldown.","color": "dark_red"},{"text": "Cooldown: 15s","color": "dark_gray"}],\
    ability_id:"summon_mannequin",\
    cooldown:15,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute if entity @s[tag=has_mannequin] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppetteer",\
    item_id:"minecraft:lead",\
    item_name:{"text": "Pickup Mannequin","color": "#a64dff"},\
    description:[{"text": "Pick your mannequin back up.","color": "gray"},{"text": "You must be within 3 blocks of it.","color": "gray"},{"text": "Cooldown: 2s","color": "dark_gray"}],\
    ability_id:"pickup_mannequin",\
    cooldown:2,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

# Slot 1: Swap with the mannequin (usable within 10 blocks OR while it has taken damage - enforced
# inside the ability itself so the item is always visible but only fires when eligible).
function juggernaut:ability_management/check_ability {\
    player_tag:"puppetteer",\
    item_id:"minecraft:string",\
    item_name:{"text": "Swap","color": "#a64dff"},\
    description:[{"text": "Trade places with your mannequin.","color": "gray"},{"text": "Only while within 10 blocks of it,","color": "gray"},{"text": "or while it has taken any damage.","color": "gray"},{"text": "Cooldown: 15s","color": "dark_gray"}],\
    ability_id:"swap_mannequin",\
    cooldown:15,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

# Slot 2: Make Puppets.
function juggernaut:ability_management/check_ability {\
    player_tag:"puppetteer",\
    item_id:"minecraft:cobweb",\
    item_name:{"text": "Make Puppets","color": "#a64dff"},\
    description:[{"text": "Conjure six identical puppets that move as you do.","color": "gray"},{"text": "You swap into one - the juggernaut can't tell which.","color": "gray"},{"text": "Each puppet dies in one hit.","color": "gray"},{"text": "Cooldown: 1m 30s","color": "dark_gray"}],\
    ability_id:"make_puppets",\
    cooldown:90,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown2",\
}

# Bound Soul passive: if the summoned mannequin has been destroyed, the puppetteer dies too.
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppetteer/check_mannequin_alive

# The mannequin passively replenishes the nearest station at 60% efficiency.
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppetteer/mannequin_replenish

# Puppet ring: tick down its lifetime, keep the formation locked, and clean up when it ends.
execute if entity @s[tag=has_puppets] run scoreboard players remove @s puppet_time 1
execute if entity @s[tag=has_puppets] if score @s puppet_time matches 1.. run function juggernaut:abilities/puppetteer/move_puppets
execute if entity @s[tag=has_puppets] if score @s puppet_time matches ..0 run function juggernaut:abilities/puppetteer/end_puppets

# End early if every puppet has been destroyed.
execute if entity @s[tag=has_puppets] run scoreboard players operation #pp_link var = @s puppet_id
execute if entity @s[tag=has_puppets] run tag @e[type=mannequin,tag=puppetteer_puppet] remove pp_check
execute if entity @s[tag=has_puppets] as @e[type=mannequin,tag=puppetteer_puppet] if score @s puppet_id = #pp_link var run tag @s add pp_check
execute if entity @s[tag=has_puppets] unless entity @e[type=mannequin,tag=pp_check] run function juggernaut:abilities/puppetteer/end_puppets
