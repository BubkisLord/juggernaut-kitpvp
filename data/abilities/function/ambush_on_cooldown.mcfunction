execute at @s as @p[tag=ambusher] run title @s actionbar [{"text":"On cooldown for ","color":"yellow","bold":false},{"score":{"name":"*","objective":"ambushDisplay"},"color":"red","bold":false},{"text":" seconds.","color":"yellow","bold":false}]
execute at @s as @p[tag=ambusher] run item replace entity @s hotbar.1 with popped_chorus_fruit[item_name={"text":"Drained Star","color":"dark_purple","italic":false},lore=['{"text":"Ambush Enemy is on cooldown.","color":"dark_gray"}]]
execute at @s as @p[tag=ambusher] run particle minecraft:glow ~ ~ ~ 0.5 0.5 0.5 0 30
execute at @s as @p[tag=ambusher] run playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1 1.5
kill @s