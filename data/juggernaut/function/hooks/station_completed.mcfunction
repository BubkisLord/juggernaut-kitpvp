execute if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run function juggernaut:effects/apply_effect {effect:"undetectable",duration:20,color:"gray"}
execute if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run effect give @s resistance 4 1 true
execute if entity @a[tag=using_shared_resolve,distance=..3] as @a[tag=runner,distance=..3] run effect give @s speed 4 1 true

execute if entity @a[tag=using_floods_of_rage] as @a[tag=runner,tag=!is_undetectable] run effect give @s glowing 5 0 true