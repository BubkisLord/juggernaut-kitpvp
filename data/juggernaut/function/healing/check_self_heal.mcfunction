data modify storage juggernaut:healing/try_self_heal heal_amount set value 2
# If using fractured aid, self-heal 20% slower.
execute if entity @s[tag=using_fractured_aid] store result storage juggernaut:healing/try_self_heal heal_amount int 0.8 run data get storage juggernaut:healing/try_self_heal heal_amount

# If using self-preservation, self-heal 15% faster.
execute if entity @s[tag=using_self_preservation] store result storage juggernaut:healing/try_self_heal heal_amount int 1.15 run data get storage juggernaut:healing/try_self_heal heal_amount

# If blood pact is active, heal 70% faster.
execute if entity @s[tag=blood_pact_active] store result storage juggernaut:healing/try_self_heal heal_amount int 1.7 run data get storage juggernaut:healing/try_self_heal heal_amount

# If overwhelming presence is in effect, heal 15% slower.
execute if entity @a[tag=using_overwhelming_presence,distance=..15] store result storage juggernaut:healing/try_self_heal heal_amount int 0.85 run data get storage juggernaut:healing/try_self_heal heal_amount

# Run healing function
execute as @s at @s run function juggernaut:healing/try_self_heal with storage juggernaut:healing/try_self_heal