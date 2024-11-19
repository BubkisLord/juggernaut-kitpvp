data modify storage juggernaut:healing/try_heal_player heal_amount set value 5
data modify storage juggernaut:healing/try_heal_player distance set value 1.5
execute if entity @s[tag=medic] run data modify storage juggernaut:healing/try_heal_player heal_amount set value 7

# If using fractured aid, heal 15% faster.
execute if entity @s[tag=using_fractured_aid] store result storage juggernaut:healing/try_heal_player heal_amount int 1.15 run data get storage juggernaut:healing/try_heal_player heal_amount

# If using self-preservation, heal 20% slower.
execute if entity @s[tag=using_self_preservation] store result storage juggernaut:healing/try_heal_player heal_amount int 0.8 run data get storage juggernaut:healing/try_heal_player heal_amount

# If blood pact is active, heal 70% faster.
execute if entity @s[tag=blood_pact_active] store result storage juggernaut:healing/try_heal_player heal_amount int 1.7 run data get storage juggernaut:healing/try_heal_player heal_amount

function juggernaut:healing/try_heal_player with storage juggernaut:healing/try_heal_player