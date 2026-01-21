effect clear @s poison

execute if entity @a[tag=fishmonger] run function juggernaut:ability_management/check_ability {\
    player_tag:"fishmonger",\
    item_id:"minecraft:nautilus_shell",\
    item_name:{"text": "Summon Mcbee","color": "#FFD700"},\
    description:[{"text": "Summon nautili at random points along the river,","color": "gray"},{"text": "each one with a drowned with a trident riding it.","color": "gray"},{"text": "Number of nautili equals amount of runners in the game.","color": "gray"},{"text": "Cooldown: 50s","color": "dark_gray"}],\
    ability_id:"summon_mcbee",\
    cooldown:50,\
    hotbar_slot:"hotbar.1",\
    cooldown_var:"jug_kit_cooldown",\
}

execute as @a[tag=fishmonger,scores={jug_kit_cooldown=30}] run kill @e[type=nautilus,tag=fishmonger_nautilus]
execute as @a[tag=fishmonger,scores={jug_kit_cooldown=30}] run kill @e[type=nautilus,tag=fishmonger_drowned]

execute as @a[tag=fishmonger,tag=in_chase] run clear @s trident[enchantments={riptide:3}]
execute as @a[tag=fishmonger,tag=!in_chase] run clear @s trident[enchantments={loyalty:3}]
execute as @a[tag=fishmonger] if entity @s[nbt={Items:[{id:"trident",count:2}]}] run clear @s trident 1