# Scout
# Scout's Sight (Passive)
execute as @a[tag=scout] run scoreboard players add @n[tag=juggernaut_manager] scout_reveal_timer 1
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run effect give @a[tag=juggernaut] glowing 16 0 true
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run scoreboard players set @a[tag=juggernaut_manager] scout_reveal_timer 0

# Revealing Powder (Active)
execute if entity @a[tag=scout] run function juggernaut:ability_management/check_ability {\
    player_tag:"scout",\
    item_id:"minecraft:glowstone_dust",\
    item_name:'{"text": "Revealing Powder","color": "gold"}',\
    ability_id:"reveal_jugs",\
    cooldown:25,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}