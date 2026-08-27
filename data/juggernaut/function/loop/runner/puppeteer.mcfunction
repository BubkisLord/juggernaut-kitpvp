# Puppeteer - runs as each puppeteer, positioned at them.

# Track the mannequin's current health first, so the swap ability (registered below) can tell
# whether it has taken damage this tick.
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppeteer/track_mannequin_hp

# Slot 0: Summon Mannequin / Pickup Mannequin (mutually exclusive, like hunter's mark/pursue).
# Both share ability_cooldown0 so that consuming one does not instantly auto-trigger the other into
# the momentarily-empty slot. After summoning you must keep the mannequin for the summon cooldown.
execute unless entity @s[tag=has_mannequin] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:armor_stand",\
    item_name:{"text": "Summon Mannequin","color": "#cfc7ba"},\
    description:[{"text": "Summon a mannequin clone of you.","color": "gray"},{"text": "It is able to replenish at 60% speed.","color": "gray"},{"text": "If the mannequin dies, you die.","color": "dark_red"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"summon_mannequin",\
    cooldown:15,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

execute if entity @s[tag=has_mannequin] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:lead",\
    item_name:{"text": "Pickup Mannequin","color": "#cfc7ba"},\
    description:[{"text": "Pick up your placed mannequin within 6 blocks.","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"pickup_mannequin",\
    cooldown:15,\
    hotbar_slot:"hotbar.0",\
    cooldown_var:"ability_cooldown0",\
}

# Slot 1: Swap with the mannequin (usable within 10 blocks OR while it has taken damage - enforced
# inside the ability itself so the item is always visible but only fires when eligible).
execute if entity @s[tag=has_mannequin] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:resin_brick",\
    item_name:{"text": "Swap","color": "#cfc7ba"},\
    description:[{"text": "Swap places with your mannequin.","color": "gray"},{"text": "Cooldown: 0s","color": "dark_gray"}],\
    ability_id:"swap_mannequin",\
    cooldown:1,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"ability_cooldown1",\
}

execute if entity @s[tag=!has_mannequin,tag=!spectator] run item replace entity @s hotbar.1 with brick[item_name=[{"text": "Swap","color": "#cfc7ba"},{"text": " | ","color": "dark_gray","bold": true},{"text": "NOT AVAILABLE","color": "red","bold": true}],lore=[{"text": "Cannot swap without a mannequin.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}]]

# Slot 2: Make Puppets.
execute unless entity @s[tag=has_puppets] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:cobweb",\
    item_name:{"text": "Make Puppets","color": "#cfc7ba"},\
    description:[{"text": "Create 5 identical copies of you around you.","color": "gray"},{"text": "Cooldown: 60s","color": "dark_gray"}],\
    ability_id:"make_puppets",\
    cooldown:60,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown2",\
}

execute if entity @s[tag=has_puppets] run function juggernaut:ability_management/check_ability {\
    player_tag:"puppeteer",\
    item_model:"minecraft:prismarine_shard",\
    item_name:{"text": "Dimiss Puppets","color": "#cfc7ba"},\
    description:[{"text": "Dismisses all summoned puppets.","color": "gray"},{"text": "Cooldown: 1s","color": "dark_gray"}],\
    ability_id:"end_puppets",\
    cooldown:1,\
    hotbar_slot:"hotbar.2",\
    cooldown_var:"ability_cooldown3",\
}

# Bound Soul passive: if the summoned mannequin has been destroyed, the puppeteer dies too.
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppeteer/check_mannequin_alive

# The mannequin passively replenishes the nearest station at 60% efficiency.
execute if entity @s[tag=has_mannequin] run function juggernaut:abilities/puppeteer/mannequin_replenish

# Puppet ring: tick down its lifetime, keep the formation locked, and clean up when it ends.
execute if entity @s[tag=has_puppets] run scoreboard players remove @s puppet_time 1
execute if entity @s[tag=has_puppets] if score @s puppet_time matches 1.. run function juggernaut:abilities/puppeteer/move_puppets
execute if entity @s[tag=has_puppets] if score @s puppet_time matches ..0 run function juggernaut:abilities/puppeteer/end_puppets

# End early if every puppet has been destroyed.
execute if entity @s[tag=has_puppets] run scoreboard players operation #pp_link var = @s puppet_id
execute if entity @s[tag=has_puppets] run tag @e[type=mannequin,tag=puppeteer_puppet] remove pp_check
execute if entity @s[tag=has_puppets] as @e[type=mannequin,tag=puppeteer_puppet] if score @s puppet_id = #pp_link var run tag @s add pp_check
execute if entity @s[tag=has_puppets] unless entity @e[type=mannequin,tag=pp_check] run function juggernaut:abilities/puppeteer/end_puppets
