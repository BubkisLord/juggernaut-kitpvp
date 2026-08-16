execute on vehicle run data modify entity @s NoAI set value true
execute on vehicle run kill @s
execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"goat"}}} run scoreboard players set @s ability_cooldown7 20000
execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"dolphin"}}} run scoreboard players set @s ability_cooldown8 20000
execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"blaze"}}} run scoreboard players set @s ability_cooldown9 20000
ride @s dismount