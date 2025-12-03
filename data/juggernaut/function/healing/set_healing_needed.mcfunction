scoreboard players set #25 var 25

execute store result score @s healing_needed run attribute @s max_health get
scoreboard players operation @s healing_needed -= @s health
scoreboard players operation @s healing_needed *= #25 var
scoreboard players operation @s healing_needed *= #1000 var
execute if score @s healing_needed matches 0 run scoreboard players set @s healing_needed 1


scoreboard players operation @s healing_percent = @s healing_progress
scoreboard players operation @s healing_percent *= #100 var
scoreboard players operation @s healing_percent /= @s healing_needed
execute if score @s healing_percent > #100 var run scoreboard players set @s healing_percent 100