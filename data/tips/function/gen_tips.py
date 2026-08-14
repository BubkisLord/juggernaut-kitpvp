import json
import re

# edit these
KEYWORDS = {
    "Juggernaut": "#FF5555",
    "Runner": "#00AAAA",
    "Juggernauts": "#FF5555",
    "Runners": "#00AAAA",
    "Chameleon": "#99e642",
    "Dragon": "#7F63D9",
    "Fishmonger": "#00AAAA",
    "Escapist": "#5555FF",
    "Hunter": "#FF5555",
    "Classic Juggernaut": "#3434FF",
    "Knight": "#FFFF55",
    "Phantom": "#9c89bc",
    "Predator": "#55FF55",
    "Spirit Walker": "#577ebe",
    "Timekeeper": "#FFAA00",
    "Warlock": "#9045da",
    "Witch Doctor": "#AA00AA",
    "Ghost": "#555555",
    "Guide": "#f7d336",
    "Jester": "#f528d3",
    "Medic": "#55FF55",
    "Puppeteer": "#cfc7ba",
    "Rogue": "#340b4b",
    "Scout": "#FFFF55",
    "Engineer": "#AA00AA",
    "Survivor": "#3434FF",
    "Trickster": "#4f06d5",
    "Replenish": "#3AC23A",
    "Replenishment": "#3AC23A",
    "Station": "#3AC23A",
    "perks": "#24749D",
    "perk": "#24749D",
    "undetectable": "#484848",

    # Witch Doctor
    "Damage Potions": "#00AAAA",
    "Fire Resistance": "#FF5555",
    "Strength": "#FFAA00",
    "Enlarge": "#AA00AA",
    "Reduce": "#AA00AA",

    # Warlock
    "Malevolent Aura": "#AA0000",
    "Banishment Glyph": "#00AAAA",
    "Withering Surge": "#555555",
    "Revealing Tower": "#FFAA00",

    # Timekeeper
    "Timestream Rupture": "#FF5555",
    "Poison Time Strand": "#55FF55",
    "Time Skip": "#55FFFF",
    "Place Temporal Marker": "#FFAA00",
    "Temporal Rewind": "#FFAA00",

    # Trickster
    "Misty Step": "#00AAAA",
    "Player Swap": "#AA00AA",
    "False Detection": "#AA00AA",

    # Scout
    "Revealing Powder": "#FFAA00",

    # Survivor
    "Ice Bomb": "#A4D1EA",
    "Toughen Up": "#A4D1EA",

    # Spirit Walker
    "Teleport": "#AA00AA",

    # Rogue
    "Smoke Bomb": "#646464",
    "Backstep": "#646464",

    # Puppeteer
    "Summon Mannequin": "#cfc7ba",
    "Pickup Mannequin": "#cfc7ba",
    "Swap": "#cfc7ba",
    "Make Puppets": "#cfc7ba",
    "Dimiss Puppets": "#cfc7ba",

    # Phantom
    "Reap": "#5e556e",
    "Haunt": "#5e556e",

    # Medic
    "Rescue": "#A4D1EA",
    "Heal": "#dbbe2d",

    # Knight
    "Summon Steed": "#AA0000",
    "Dismiss Steed": "#AA0000",

    # Jester
    "Jest": "#f528d3",
    "Peekaboo": "#f528d3",

    # Hunter
    "Mark Prey": "#AA0000",
    "Pursue Prey": "#AA0000",
    "Wolf Hunt": "#AA0000",
    "Bloodhound": "#AA0000",

    # Guide
    "Replenish Boost": "#FFD700",

    # Ghost
    "Spectral Cloak": "#AAAAAA",

    # Fishmonger
    "Summon Drowned": "#FFD700",

    # Escapist
    "Flee Powder": "#646464",

    # Engineer
    "Replenishment Tower": "#55FF55",
    "Turret": "#AAAAAA",

    # Dragon
    "Switch to Flight": "#7F63D9",
    "Switch to Floating": "#7F63D9",
    "Shoot Dragon Breath": "#7F63D9",
    "Charged Breath Attack": "#7F63D9",

    # Classic Juggernaut
    "Find Runners": "#AAAAAA",

    # Chameleon
    "Shapeshift": "#AAAAAA",
    "Randomise Shapeshift Target": "#AAAAAA",
    "Exit Shapeshift": "#AAAAAA",
    "Swap with Runner": "#AAAAAA",

    "Speed": "#3D92CA",
    "Invisible": "#E0F3FF",
    "Invisibility": "#E0F3FF",
    "Glowing": "#EAE74F"
}

TIPS = [
    "Survivor's leather armor can be seen while you're invisible!",
    "Trickster's Misty Step will generally make you go to the highest blocks up.",
    "Jester can preview and line up multiple good effects by rerolling.",
    "Rogue's Backstep faces you away from the Juggernaut's back!",
    "Scout has Jump Boost - allowing you to get over fences and gaps alike.",
    "Trickster's Swap will move you to the closest Replenishment Station if there's no Runners.",
    "Rogue doesn't emit invisibility particles from their smoke bomb.",
    "Ghost's Spectral Cloak sets the detection timeout for Juggernauts to zero!",
    "Engineer's Replenishment Tower will emit a beam - potentially showing your position.",
    "Witch Doctor's Enlarge ability can trap Runners inside buildings.",
    "Classic Juggernaut's axe crit will one-shot most Runners!",
    "Chameleon's mannequin appears to provide replenishment when on a station.",
    "Runners can replenish while the Chameleon is shapeshifting - even when they're nearby!",
    "Warlock's Revealing Tower cannot be seen until the Runner gets close.",
    "Warlock locks down areas - counter this by having the final stations spread out.",
    "Medic can Rescue to any runner in chase, and can instantly heal them!",
    "Medic cannot Rescue when near the Juggernaut or when in chase.",
    "Medic's Heal ability halves all remaining ability cooldowns.",
    "The Undetectable status effect makes it so you cannot become glowing.",
    "When Spirit Walker is in the game, Runners won't show their name tags.",
    "Spirit Walker's destination is denoted by their glowing clone.",
    "When Spirit Walker's destination glows red, it is inside a block and will fail.",
    "Guide's Replenish Boost ability stacks with any replenishment buffs.",
    "Puppeteer's puppets cannot die to suffocation, but will die from most hits.",
    "Timekeeper's trail glows blue when a Runner steps through it!",
    "Escapist's ability emits invisibility particles as you move.",
    "Ghost cannot move while crouching, but is always invisible when doing so.",
    "Ghost emits tiny ash particles, possibly betraying your position when crouching.",
    "Phantom can fake their teleport by hovering over a station with their Haunt.",
    "Phantom's Reap ability doesn't reveal Runners with Undetectable.",
    "As Ghost, if you notice you're glowing, tap crouch to clear it!",
    "Triggering Undetectable even for a moment clears Glowing entirely!",
    "Chameleon's Swap always targets the last Runner you shapeshifted as.",
    "Knight's lunge can be chained multiple times - if you don't have too much impulse speed.",
    "The Knight's Summon Steed is excellent to get up multiple blocks at a time.",
    "Juggernauts always have one perk, while Runners will normally have 1-3",
    "You can change settings by right clicking the 'Customise' sign!",
    "As Puppeteer, some perks may have interesting effects with your mannequin!",
    "Swap with the mannequin when the Juggernaut is close!",
    "When the Juggernaut is close to the Puppeteer's mannequin, you will hear a sound and they will glow.",
    "Dragon's descent speed is slower when in floating mode.",
    "Dragon automatically adjusts their height when in floating mode.",
    "Dragon's charged breath deals a lot of damage but takes 4s to shoot.",
    "Dragon is all about line of sight, making indoors a strong counter.",
    "Predator doesn't emit any particles when they're crouching.",
    "Predator is Undetectable when they're crouching.",
    "Predator doesn't let Runners see station warning particles when they're crouching.",
    "Hunter's Pursue Prey will always be 3 seconds behind the Runner's position.",
    "Hunter's Bloodhound cannot seek out players who have just respawned.",
    "If the Spirit Walker overshoots their teleport, no harm in a 180!",
    "Rupturing your trail as Timekeeper will remove it quicker.",
    "Warlock's Banishment Glyph can block multiple replenishment stations if they're close together.",
    "Warlock's Withering Surge is dispelled almost instantly by a Runner.",
    "Scout can reveal the Juggernaut constantly by looking at them.",
    "Survivor's Ice Bomb ability has to be aimed at the Juggernaut to be used.",
    "Survivor's Toughen Up can be used to tank fall damage as well!",
    "Witch Doctor's Reduce and Speed abilities stack.",
    "Knight's Horse moves very fast underwater.",
    "You can take off your armour as Survivor when you're invisible!",
    "Most replenishment buffs are calculated from the station's position when out of chase.",
    "Most replenishment buffs are calculated from your position when in chase.",
    "Chameleon's holding the sword and bow isn't visible when shapeshifting.",
    "Predator can crouch-shift up to stations without making them purple!",
    "Juggernaut being Undetectable prevents Runners seeing warning particles.",
    "Unwavering Strength is always based on your position, not station position.",
    "Unwavering Strength cannot activate in chase."
]

def build_components(tip):
    pattern = "|".join(re.escape(k) for k in sorted(KEYWORDS, key=len, reverse=True))
    parts = re.split(f"({pattern})", tip, flags=re.IGNORECASE)
    components = []
    for part in parts:
        if not part:
            continue
        match = next((k for k in KEYWORDS if k.lower() == part.lower()), None)
        if match:
            components.append({"text": part, "color": KEYWORDS[match]})
        else:
            components.append({"text": part, "color": "gray"})
    return components

def to_snbt(components):
    parts = []
    for c in components:
        kv = ", ".join(f'{k}: "{v}"' for k, v in c.items())
        parts.append("{" + kv + "}")
    return "[" + ", ".join(parts) + "]"


file_contents = "# Clear tips:data first\ndata modify storage tips:data list set value []\n\n# Append all tips to the empty list\n"

for tip in TIPS:
    comp = build_components(tip)
    file_contents += f"data modify storage tips:data list append value {to_snbt(comp)}\n"

with open(file="add.mcfunction",mode="w") as file:
    file.write(file_contents)
