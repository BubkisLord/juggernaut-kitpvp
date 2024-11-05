tellraw @a [{"text": "Hide and Seek","color": "dark_red"},{"text": " is starting!","color": "gray"}]

# Sets the timer to be 25 seconds.
scoreboard players set @a[tag=seeker] seeker_release_timer 40

# Score for the juggernaut game time left is set to the max time (300 seconds) plus the release timer (25 seconds)
# This is for when the game time is capped. (Optional)
scoreboard players operation @a lives_remaining = #hide_and_seek_customisation lives_count
scoreboard players set @a[tag=seeker] hide_and_seek_game_time 340
scoreboard players set #hide_and_seek_game_ending var 0
scoreboard players set #end_game_timer var 10

tp @a[tag=hider] 0 101 0
effect give @a[tag=hider] minecraft:speed 40 0 true
effect give @a[tag=hider] minecraft:invisibility 40 0 true
item replace entity @a[tag=seeker] hotbar.0 with netherite_sword[unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=seeker] armor.head with netherite_helmet[unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=seeker] armor.chest with netherite_chestplate[unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=seeker] armor.legs with netherite_leggings[unbreakable={show_in_tooltip:false}]
item replace entity @a[tag=seeker] armor.feet with netherite_boots[unbreakable={show_in_tooltip:false}]
give @a cooked_beef 64
function hide_and_seek:loop/release_seeker

# Turns on the game running variable.
scoreboard players set #game_state var 51