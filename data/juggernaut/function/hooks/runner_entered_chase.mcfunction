execute if entity @s[tag=using_adrenaline,tag=!exhausted] run function juggernaut:attribute_management/apply {\
    "attribute_name": "movement_speed",\
    "modifier_name": "adrenaline",\
    "value": 0.5,\
    "duration": 3,\
}
execute if entity @s[tag=using_adrenaline,tag=!exhausted] run function juggernaut:effects/apply_effect {\
    "effect": "exhausted",\
    "duration": 10,\
}

# Must use chase_timeout score as chase_eligible tag is removed prior and in_chase tag has not yet been added.
execute if entity @a[tag=phantom,scores={chase_timeout=1..}] run attribute @s name_tag_distance modifier add juggernaut:phantom_chase -100 add_multiplied_total