title @a times 0.25 1.5 0.25

execute store result score #size tips.data run data get storage tips:data list
execute store result score #idx tips.data run random value 0..2147483646
scoreboard players operation #idx tips.data %= #size tips.data
execute store result storage tips:data idx int 1 run scoreboard players get #idx tips.data
function tips:pick with storage tips:data
execute as @a run function tips:show
