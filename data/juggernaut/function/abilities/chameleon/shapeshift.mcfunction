kill @e[type=mannequin,tag=chameleon_mannequin,distance=..6]
kill @e[type=text_display,tag=chameleon_name_tag,distance=..6]
kill @e[type=text_display,tag=chameleon_health_tag,distance=..6]
effect give @s invisibility infinite 0 true
summon mannequin ~ ~ ~ {Team:"test",Tags:["chameleon_mannequin","kill_on_end_game"]}
data modify entity @n[type=mannequin,tag=chameleon_mannequin] profile.id set from entity @p[tag=saved_skin] UUID
tag @s add shapeshifting
summon text_display ~ ~2 ~ {default_background:true,width:2,Tags:["chameleon_name_tag","kill_on_end_game"],teleport_duration:3,text:{selector:"@p[tag=saved_skin]","color":"dark_aqua"},billboard:"center"}
summon text_display ~ ~2 ~ {default_background:true,width:2,Tags:["chameleon_health_tag","kill_on_end_game"],teleport_duration:3,text:[{"score":{name:"@p[tag=saved_skin]",objective:"health"},color:"green"},{"text":" Health","color": "green"}],billboard:"center"}