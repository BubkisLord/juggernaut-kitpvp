tag @r[tag=saved_skin] add unsaved_skin
tag @a remove saved_skin
tag @r[tag=!unsaved_skin,tag=runner] add saved_skin
tag @a remove unsaved_skin
data modify entity @n[type=mannequin,tag=chameleon_mannequin] profile.id set from entity @p[tag=saved_skin] UUID
data modify entity @n[type=text_display,tag=chameleon_name_tag] text set value {selector:"@p[tag=saved_skin]","color":"dark_aqua"}
data modify entity @n[type=text_display,tag=chameleon_health_tag] text set value [{"score":{name:"@p[tag=saved_skin]",objective:"health"},color:"green"},{"text":" Health","color": "green"}]