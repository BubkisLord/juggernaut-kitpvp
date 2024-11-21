# Harbinger
# Theme: Sacrifice and high-risk support, designed for runners willing to take risks to benefit their team.

# Chase Passive: Grim Determination
# Each time you lose a life, gain a permanent 5% speed boost in chases.

# Teamwork Passive: Beacon of Hope
# Nearby teammates within 10 blocks regenerate health 15% faster while you are injured.

# Activated Ability 1: Martyr’s Blessing
# Instantly heal all runners by one health state, but lose 50% of your remaining health (cooldown: 60 seconds).

# Activated Ability 2: Final Call
# Reveal your location to the juggernaut for 10 seconds, but reduce all replenishment station interaction times by 20% for 15 seconds (cooldown: once per game).
execute if entity @s[tag=!has_jug_kit] run tag @s add harbinger
tag @s add has_jug_kit