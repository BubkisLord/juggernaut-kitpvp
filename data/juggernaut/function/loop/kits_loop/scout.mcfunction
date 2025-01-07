# Scout passive effects
execute as @a[tag=scout] run scoreboard players add @n[tag=juggernaut_manager] scout_reveal_timer 1
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run effect give @a[tag=juggernaut] glowing 16 0 true
execute as @a[tag=juggernaut_manager,scores={scout_reveal_timer=1200..}] run scoreboard players set @a[tag=juggernaut_manager] scout_reveal_timer 0