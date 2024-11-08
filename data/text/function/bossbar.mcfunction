bossbar set lobby players @a[tag=lobby.player,tag=!autorespawn]
bossbar set spectator players @a[tag=spectator]
bossbar set runner players @a[tag=runner]
bossbar set juggernaut players @a[tag=juggernaut,tag=!warlock]
execute if score #game_state var matches 51 run bossbar set hide_and_seek_timer players @a
execute unless score #game_state var matches 51 run bossbar set hide_and_seek_timer players @a[tag=no_one_has_this_tag_567]
bossbar set king_of_the_hill_timer players @a[scores={lives_remaining=1..}]