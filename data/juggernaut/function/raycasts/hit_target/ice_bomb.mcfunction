particle electric_spark ~ ~ ~ 3 3 3 0 400 force @a[tag=runner,distance=..32]
particle electric_spark ~ ~ ~ 3 3 3 0 200 force @a[tag=juggernaut,distance=..32]

effect give @s slowness 8 255 true
playsound entity.arrow.hit_player master @a[tag=survivor,distance=..32,scores={ability_cooldown0=1..}]