execute as @a[tag=lobby.player,tag=autorespawn,scores={health=20}] run tellraw @s [{"text":"\n"},{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"]","color":"dark_gray","bold":true},{"text":" Auto-Respawn: ","color":"dark_green","bold":false},{"text":"You have automatically respawned with your previous kit.","color":"yellow","bold":false}]

execute as @a[tag=warrior,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:warrior
execute as @a[tag=cactus,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:cactus
execute as @a[tag=farmer,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:farmer
execute as @a[tag=viking,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:viking
execute as @a[tag=zombie,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:zombie
execute as @a[tag=defender,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:defender
execute as @a[tag=assassin,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:assassin

execute as @a[tag=archer,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:archer
execute as @a[tag=flame,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:flame
execute as @a[tag=quickcharger,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:quickcharger
execute as @a[tag=hunter,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:hunter
execute as @a[tag=poseidon,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:poseidon
execute as @a[tag=sharpshooter,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:sharpshooter
execute as @a[tag=pirate,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:pirate
execute as @a[tag=divinity,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:divinity

execute as @a[tag=rabbit,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:rabbit
execute as @a[tag=cheetah,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:cheetah
execute as @a[tag=dolphin,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:dolphin
execute as @a[tag=jouster,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:jouster
execute as @a[tag=yeti,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:yeti
execute as @a[tag=unicorn,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:unicorn
execute as @a[tag=ninja,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:ninja
execute as @a[tag=shark,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:shark

execute as @a[tag=ambusher,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:ambusher
execute as @a[tag=auramancer,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:auramancer
execute as @a[tag=levitator,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:levitator
execute as @a[tag=teleporter,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:teleporter
execute as @a[tag=ghost,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:ghost
execute as @a[tag=shaman,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:shaman
execute as @a[tag=deflector,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:deflector
execute as @a[tag=alchemist,tag=lobby.player,tag=autorespawn,scores={health=20}] run function kits:alchemist

execute as @a[tag=!lobby.player,tag=!tutorial.player,tag=!autorespawn] if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run item replace entity @s hotbar.7 with red_bed[item_name='[{"text":"Auto-Respawn: ","color":"yellow","italic":false},{"text":"[","color":"dark_gray"},{"text":"OFF","color":"red"},{"text":"]","color":"dark_gray"}]',lore=['{"text":"Drop this item to toggle","color":"dark_gray"}','{"text":"Auto-Respawn on.","color":"dark_gray"}'],hide_additional_tooltip={}]
execute as @a[tag=!lobby.player,tag=!tutorial.player,tag=autorespawn] if entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run item replace entity @s hotbar.7 with lime_bed[item_name='[{"text":"Auto-Respawn: ","color":"yellow","italic":false},{"text":"[","color":"dark_gray"},{"text":"ON","color":"green"},{"text":"]","color":"dark_gray"}]',lore=['{"text":"Drop this item to toggle","color":"dark_gray"}','{"text":"Auto-Respawn off.","color":"dark_gray"}'],hide_additional_tooltip={}]
execute as @a[tag=!lobby.player,tag=!tutorial.player,tag=autorespawn] unless entity @e[type=armor_stand,tag=juggernaut_manager,scores={game_state=0}] run item replace entity @s hotbar.7 with air

execute as @e[type=item,nbt={Item:{id:"minecraft:red_bed"}}] at @s as @p run function other:autorespawn_toggle_on
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_bed"}}] at @s as @p run function other:autorespawn_toggle_off