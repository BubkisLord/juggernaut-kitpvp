execute at @e[type=armor_stand,tag=tutorial_ability.ast] run item replace entity @a[tag=tutorial.player,distance=0..8] hotbar.4 with minecraft:enchanted_book[item_name={"text":"Jumping Scroll","color":"green","italic":false},lore=[{"text":"Drop to activate.","color":"dark_gray"}],unbreakable={}]
execute at @a[tag=tutorial.player] run execute as @e[type=item,nbt={Item:{id:"minecraft:enchanted_book"}},distance=..3] run function tutorial:tutorial_ability
execute at @e[type=armor_stand,tag=tutorial_ability.ast] run clear @a[tag=tutorial.player,distance=8..] enchanted_book

execute as @e[tag=dummy.spawner,limit=1] unless entity @e[type=zombie,name="Dummy"] run summon zombie -4 101 -2038 {Silent:1b,CustomNameVisible:1b,DeathLootTable:"",PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Rotation:[-90F,0F],CustomName:{"text":"Dummy","color":"gold"},attributes:[{id:max_health,base:1}]}
execute at @e[type=zombie,name="Dummy"] run effect give @a[distance=0..5] strength 2 100 true
xp set @a[tag=tutorial.player] 0 points
execute as @a[tag=tutorial.player,scores={dummyKills=1..}] run xp add @s 1 levels
execute as @a[tag=tutorial.player,scores={dummyKills=1..}] run scoreboard players set @s dummyKills 0

scoreboard players enable @a[tag=tutorial.player,tag=ul.Warrior] fav1trigger
scoreboard players enable @a[tag=tutorial.player,tag=ul.Warrior] fav2trigger
scoreboard players enable @a[tag=tutorial.player,tag=ul.Warrior] fav3trigger
execute as @a[tag=tutorial.player,scores={tutorialPurchase=1}] run function tutorial:tutorial_purchase_prompt
execute as @a[tag=tutorial.player,scores={tutorialPurchase=101}] run function tutorial:tutorial_purchase_complete
execute as @a[tag=tutorial.player,scores={tutorialPurchase=999}] run function tutorial:tutorial_purchase_cancel

execute at @e[type=armor_stand,tag=replenishment.station,nbt={Small:0b}] as @a[distance=0..1] run function tutorial:tutorial_replenish

execute as @a[tag=tutorial.player] run item replace entity @s hotbar.8 with minecraft:book[item_name={"text":"Skip Tutorial","color":"gold","italic":false},lore=[{"text":"Drop to exit the tutorial.","color":"dark_gray"}]]
execute at @a[tag=tutorial.player] run execute as @e[type=item,nbt={Item:{id:"minecraft:book"}},distance=..3] at @s as @p[scores={skip_prompt=..0}] run function tutorial:skip_prompt
execute at @a[tag=tutorial.player] run execute as @e[type=item,nbt={Item:{id:"minecraft:book"}},distance=..3] at @s as @p[scores={skip_prompt=0..}] run function tutorial:skip_tutorial
execute as @a[tag=tutorial.player,scores={skip_prompt=1..}] run scoreboard players remove @s skip_prompt 1