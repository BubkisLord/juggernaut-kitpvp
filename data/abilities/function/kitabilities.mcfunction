#Samurai
execute as @a[tag=samurai,scores={damage_dealt=1..},nbt={Inventory:[{id:"minecraft:red_dye",Slot:-106b}]}] run scoreboard players add @s ryujins_wrath 1
execute as @a[tag=samurai,scores={damage_dealt=1..},nbt={Inventory:[{id:"minecraft:cyan_dye",Slot:-106b}]}] run scoreboard players add @s bushido_flow 1
execute as @a[tag=samurai,scores={damage_dealt=1..}] run scoreboard players remove @s damage_dealt 1

# The more ryujins wrath, the more strength and recovery the samurai gains
execute as @a[tag=samurai,scores={ryujins_wrath=15..}] at @s run effect give @s strength 1 0 true
execute as @a[tag=samurai,scores={ryujins_wrath=30..}] at @s run effect give @s regeneration 2 0 true
execute as @a[tag=samurai,scores={ryujins_wrath=45..}] at @s run effect give @s strength 1 1 true
execute as @a[tag=samurai,scores={ryujins_wrath=60..}] at @s run effect give @s regeneration 2 1 true
execute as @a[tag=samurai,scores={ryujins_wrath=80..}] at @s run effect give @s strength 1 2 true
execute as @a[tag=samurai,scores={ryujins_wrath=100..}] at @s run effect give @s regeneration 2 2 true
execute as @a[tag=samurai,scores={ryujins_wrath=200..}] at @s run effect give @s strength 1 3 true
execute as @a[tag=samurai,scores={ryujins_wrath=200..}] at @s run effect give @s regeneration 2 4 true

# The more bushido flow, the more speed and endurance the samurai gains
execute as @a[tag=samurai,scores={bushido_flow=15..}] at @s run effect give @s speed 1 0 true
execute as @a[tag=samurai,scores={bushido_flow=30..}] at @s run effect give @s resistance 2 0 true
execute as @a[tag=samurai,scores={bushido_flow=45..}] at @s run effect give @s speed 1 1 true
execute as @a[tag=samurai,scores={bushido_flow=60..}] at @s run effect give @s resistance 1 1 true
execute as @a[tag=samurai,scores={bushido_flow=80..}] at @s run effect give @s speed 1 2 true
execute as @a[tag=samurai,scores={bushido_flow=100..}] at @s run effect give @s resistance 1 2 true
execute as @a[tag=samurai,scores={bushido_flow=200..}] at @s run effect give @s speed 1 3 true
execute as @a[tag=samurai,scores={bushido_flow=200..}] at @s run effect give @s resistance 1 4 true

execute as @e[type=item,nbt={Item:{id:"minecraft:gunpowder"}}] at @s run execute as @p[tag=samurai,distance=..3] run function abilities:dance_of_scattered_steps

execute as @a[tag=samurai,scores={scattered_steps_duration=1..}] at @s run function abilities:scattered_aura

#Pirate
scoreboard players set @a[tag=!pirate] pirateKills 0
execute as @a[tag=pirate,scores={pirateKills=1}] run function kits:pirate2
execute as @a[tag=pirate,scores={pirateKills=3}] run function kits:pirate3
execute as @a[tag=pirate,scores={pirateKills=5}] run function kits:pirate4
execute as @a[tag=pirate,scores={pirateKills=7}] run function kits:pirate5
execute as @a[tag=pirate,scores={pirateKills=9}] run function kits:pirate6
execute as @a[tag=pirate,scores={pirateKills=11}] run function kits:pirate7
execute as @a[tag=pirate,scores={pirateKills=13}] run function kits:pirate8

execute as @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}] run execute as @p[tag=pirate,distance=..3] at @s run function abilities:maw_of_the_deep

execute as @a[tag=pirate] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}},limit=1,sort=nearest,distance=..3]

#Cheetah
execute as @a[tag=cheetah] run effect give @s speed 1000000 2 true
execute as @e[type=item,nbt={Item:{id:"minecraft:light_blue_dye"}}] run function abilities:cheetah_sprint

#Shark
execute as @a[tag=shark] at @s if block ~ ~ ~ water run effect give @s strength 3 0 false

#Farmer
execute as @e[tag=farmer.buff] at @s run effect give @a[tag=farmer,distance=0..20] strength 1 0 false

#Hunter
effect give @a[tag=hunter] speed 1000000 2 true

#Flame
execute as @a[tag=flame] at @s unless block ~ ~ ~ water run particle flame ~ ~ ~ 0.01 0.01 0.01 0 2 normal

#Jouster
execute as @e[type=horse] at @s unless entity @p[tag=jouster] run kill @s
execute as @e[type=horse] at @s unless entity @p[tag=jouster,distance=0..12] run kill @s
clear @a saddle
clear @a leather

#Deflector
execute at @a[tag=deflector] as @e[type=arrow,distance=0..4] run function abilities:deflector_ability
execute at @a[tag=deflector] as @e[type=spectral_arrow,distance=0..4] run function abilities:deflector_ability

#Viking
effect give @a[tag=viking] weakness 1000000 0 true

#Yeti
execute at @a[tag=yeti] run execute as @e[type=item,nbt={Item:{id:"minecraft:snow_block"}},distance=..3] run function abilities:frost_breath
execute as @a[tag=yeti] at @s if block ~ ~-1 ~ snow_block run effect give @s speed 1 2 false
execute as @a[tag=yeti] at @s if block ~ ~-2 ~ snow_block run effect give @s speed 1 2 false
execute as @a[tag=yeti] at @s if block ~ ~-1 ~ ice run effect give @s speed 1 2 false
execute as @a[tag=yeti] at @s if block ~ ~-2 ~ ice run effect give @s speed 1 2 false

#Defender
execute at @a[tag=defender] run execute as @e[type=item,nbt={Item:{id:"minecraft:brick"}},distance=..3] run function abilities:defense_spell

#Assassin
execute as @a[tag=assassin,scores={assassinActivate=1},nbt={Inventory:[{"id":"minecraft:prismarine_shard"}]}] at @s run function abilities:unlock_blade

#Ambusher
scoreboard players add @a[tag=ambusher,tag=ambush_cooldown] ambushCounter 1
scoreboard players remove @a[tag=ambusher,tag=ambush_cooldown,scores={ambushCounter=20..}] ambushDisplay 1
scoreboard players set @a[tag=ambusher,tag=ambush_cooldown,scores={ambushCounter=20..}] ambushCounter 0
execute as @a[tag=ambusher,tag=ambush_cooldown,scores={ambushDisplay=..0}] run clear @s popped_chorus_fruit[item_name='{"text":"Drained Star","color":"dark_purple","italic":false}',lore=['{"text":"Ambush Enemy is on cooldown.","color":"dark_gray"}']]
execute as @a[tag=ambusher,tag=ambush_cooldown,scores={ambushDisplay=..0}] run item replace entity @s hotbar.1 with nether_star[item_name='{"text":"Ambush Enemy","color":"dark_purple","italic":false}',lore=['{"text":"Drop to be teleported to a random enemy.","color":"dark_gray"}']]
execute as @a[tag=ambusher,tag=ambush_cooldown,scores={ambushDisplay=..0}] run tag @s remove ambush_cooldown
execute at @a[tag=ambusher] run execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}},distance=..3] run function abilities:ambush_on_cooldown
execute at @a[tag=ambusher] run execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},distance=..3] run function abilities:ambush

#Alchemist
execute at @a[tag=alchemist] run execute as @e[type=item,nbt={Item:{id:"minecraft:clock"}},distance=..3] at @s as @p[tag=alchemist] run function abilities:alchemist_ability

#Divinity
execute at @a[tag=divinity] run execute as @e[type=item,nbt={Item:{id:"minecraft:feather"}},distance=..3] at @s as @p run function abilities:divinity_ability
#Mainhand charm of floatation
effect give @a[tag=divinity,nbt={SelectedItem:{id:"minecraft:phantom_membrane"}}] slow_falling 1 9 false
execute as @a[tag=divinity,nbt={SelectedItem:{id:"minecraft:phantom_membrane"}}] at @s run particle end_rod ~ ~ ~ 0.4 0.0001 0.4 0 10 force
execute as @a[tag=divinity,nbt={SelectedItem:{id:"minecraft:phantom_membrane"}}] at @s run scoreboard players add @s aura_sound 1
execute as @a[scores={aura_sound=20..},tag=divinity,nbt={SelectedItem:{id:"minecraft:phantom_membrane",}}] at @s run function abilities:aura_sound

#Auramancer
execute as @a[nbt={Inventory:[{id:"minecraft:turtle_scute",Slot:-106b}]},tag=auramancer] run function abilities:aura_protection
execute as @a[nbt={Inventory:[{id:"minecraft:cobweb",Slot:-106b}]},tag=auramancer] run function abilities:aura_confusion
execute as @a[nbt={Inventory:[{id:"minecraft:wither_rose",Slot:-106b}]},tag=auramancer] run function abilities:aura_despair
execute as @a[nbt={Inventory:[{id:"minecraft:bell",Slot:-106b}]},tag=auramancer] run function abilities:aura_vision
execute as @a[scores={aura_sound=20..},tag=auramancer] run function abilities:aura_sound

#Levitator
effect give @a[tag=levitator,nbt={SelectedItem:{id:"minecraft:firework_rocket"}}] levitation 1 2 false
execute as @a[tag=levitator,nbt={SelectedItem:{id:"minecraft:firework_rocket"}}] at @s run particle firework ~ ~ ~ 0.4 0.0001 0.4 0 10 force
execute as @a[tag=levitator,nbt={SelectedItem:{id:"minecraft:firework_rocket"}}] at @s run scoreboard players add @s aura_sound 1
execute as @a[scores={aura_sound=20..},tag=levitator,nbt={SelectedItem:{id:"minecraft:firework_rocket"}}] run clear @s firework_rocket 1
execute as @a[scores={aura_sound=20..},tag=levitator,nbt={SelectedItem:{id:"minecraft:firework_rocket"}}] at @s run function abilities:aura_sound
effect give @a[tag=levitator,nbt={SelectedItem:{id:"minecraft:phantom_membrane"}}] slow_falling 1 9 false
execute as @a[tag=levitator,nbt={SelectedItem:{id:"minecraft:phantom_membrane"}}] at @s run particle end_rod ~ ~ ~ 0.4 0.0001 0.4 0 10 force
execute as @a[tag=levitator,nbt={SelectedItem:{id:"minecraft:phantom_membrane"}}] at @s run scoreboard players add @s aura_sound 1
execute as @a[scores={aura_sound=20..},tag=levitator,nbt={SelectedItem:{id:"minecraft:phantom_membrane"}}] at @s run function abilities:aura_sound
execute at @a[tag=levitator] run execute as @e[type=item,nbt={Item:{id:"minecraft:flower_banner_pattern"}},distance=..3] run function abilities:levitation_spell

#Ghost
execute as @a[tag=ghost,scores={health=0..12}] at @s run particle minecraft:effect ~ ~1 ~ 0.2 0.2 0.2 1 3 force

#Shaman
effect give @a[tag=shaman] water_breathing 1000000 100 true
effect give @a[tag=shaman] dolphins_grace 1000000 0 true
effect give @a[tag=shaman] fire_resistance 1000000 0 true
effect give @a[tag=shaman] speed 1000000 0 true

#Ninja
execute at @a[tag=ninja] run execute as @e[type=item,nbt={Item:{id:"minecraft:firework_star"}}] run function abilities:ninja_ability
effect give @a[tag=ninja] speed 1000000 2 true
effect give @a[tag=ninja] jump_boost 1000000 1 true

#Sharpshooter
execute as @e[nbt={crit:1b,Potion:"minecraft:luck"}] at @s at @p run function abilities:sharpshooter_ability
