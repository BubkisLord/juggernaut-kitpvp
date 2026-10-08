execute if entity @s[tag=using_hopeful_sprint,tag=!exhausted] run function juggernaut:attribute_management/apply {\
    "attribute_name": "movement_speed",\
    "modifier_name": "hopeful_sprint",\
    "value": 0.5,\
    "duration": 5,\
}
execute if entity @s[tag=using_hopeful_sprint,tag=!exhausted] run function juggernaut:effects/apply_effect {\
    "effect": "exhausted",\
    "duration": 10,\
}
execute if entity @a[tag=juggernaut,tag=using_hunters_instinct] unless entity @s[tag=undetectable] run effect give @s glowing 4 0 true

attribute @s name_tag_distance modifier remove juggernaut:phantom_chase