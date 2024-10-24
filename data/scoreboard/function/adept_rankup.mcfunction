team join adept @s
tellraw @a {"text":" "}
tellraw @a [{"text":"[","color":"dark_gray","bold":true},{"text":"KitPvP","color":"gold","bold":true},{"text":"] ","color":"dark_gray","bold":true},{"selector":"@s"},{"text":" is now proud to be an ","color":"yellow","bold":false},{"text":"Adept","color":"gold","bold":false},{"text":"!","color":"yellow","bold":false}]
tellraw @a {"text":" "}
execute as @a at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 0.7
execute as @s at @s run summon firework_rocket ~ ~10 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;11743532,4312372,14602026,6719955],FadeColors:[I;3887386,2437522,8073150,15790320]}],Flight:1}}}}