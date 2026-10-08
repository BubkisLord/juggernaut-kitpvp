$tellraw @s [{text:"$(name)",color:"$(color)",hover_event:{action:"show_text",value:[\
    {text:"$(name)",color:"$(color)",bold:true},\
    {text:"\n- Times Picked: ",color:"$(color)",bold:false},{text:"$(times_picked)",color:white},\
    {text:"\n- Player Kills: ",color:"$(color)",bold:false},{score:{"name":"@s",objective:"kills_kit_$(id)"},color:"white"},\
    {text:"\n- Total Kills: ",color:"$(color)",bold:false},{text:"$(kills)",color:white},\
    {text:"\n- Wins: ",color:"$(color)",bold:false},{text:"$(wins)",color:white},\
    {text:"\n- Losses: ",color:"$(color)",bold:false},{text:"$(losses)",color:white},\
    {text:"\n- Genius Factor: ",color:"$(color)",bold:false},{text:"$(win_ratio)",color:white}\
]}}]