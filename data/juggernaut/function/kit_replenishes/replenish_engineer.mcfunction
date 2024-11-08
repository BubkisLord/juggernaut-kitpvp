clear @s golden_apple
clear @s clock
clear @s cooked_beef
item replace entity @s hotbar.4 with clock[item_name='{"text": "Borrowed Time Ability"}',lore=['{"text": "Taking damage for the next 10 seconds is nullified","color":"dark_gray"}','{"text":"but then later applied periodically in stacks of 2.","color": "dark_gray"}']]
item replace entity @s hotbar.5 with golden_apple 3
item replace entity @s hotbar.6 with cooked_beef 32