execute on vehicle run data modify entity @s NoAI set value true
execute on vehicle run kill @s
execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"goat"}}} run scoreboard players set @s ability_cooldown0 20000
execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"dolphin"}}} run scoreboard players set @s ability_cooldown1 20000
execute if predicate {condition:"entity_properties",entity:"this",predicate:{vehicle:{entity_type:"blaze"}}} run scoreboard players set @s ability_cooldown2 20000
ride @s dismount