damage @a[limit=1,sort=nearest,distance=2..40,tag=!lobby.player,tag=!tutorial.player] 6 minecraft:arrow by @p
execute at @a[limit=1,sort=nearest,distance=2..40,tag=!lobby.player,tag=!tutorial.player] run playsound minecraft:entity.arrow.hit master @a ~ ~ ~ 1 1.2
execute at @p run playsound minecraft:entity.arrow.hit_player master @p ~ ~ ~ 1 1
kill @s