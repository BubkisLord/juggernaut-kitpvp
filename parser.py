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
    "Stations": "#3AC23A",
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

MAX_LENGTH = 50

_PATTERN = "|".join(re.escape(k) for k in sorted(KEYWORDS, key=len, reverse=True))
_KEYWORD_LOOKUP = {k.lower(): k for k in KEYWORDS}


def _tokenize(raw_string):
    """Split into (word, color) tuples, one per whitespace-separated word."""
    parts = re.split(f"({_PATTERN})", raw_string, flags=re.IGNORECASE)
    words = []
    for part in parts:
        if not part:
            continue
        match = _KEYWORD_LOOKUP.get(part.lower())
        color = KEYWORDS[match] if match else "gray"
        for w in part.split():
            words.append((w, color))
    return words


def build_components(raw_string):
    """Returns a list of lines; each line is a list of {"text","color"} dicts.
    Wraps by word so no line's text exceeds MAX_LENGTH characters."""
    words = _tokenize(raw_string)

    lines = [[]]
    line_len = 0
    for word, color in words:
        sep = 1 if line_len > 0 else 0
        if line_len + sep + len(word) > MAX_LENGTH and line_len > 0:
            lines.append([])
            line_len = 0
            sep = 0
        # keep the separating space attached to the word so it survives
        # across component boundaries (color changes)
        piece = (" " if sep else "") + word
        lines[-1].append((piece, color))
        line_len += sep + len(word)

    # merge consecutive words of the same color into single components
    components = []
    for line in lines:
        line_components = []
        cur_color = None
        cur_text = ""
        for piece, color in line:
            if color == cur_color:
                cur_text += piece
            else:
                if cur_text:
                    line_components.append({"text": cur_text, "color": cur_color})
                cur_color = color
                cur_text = piece
        if cur_text:
            line_components.append({"text": cur_text, "color": cur_color})
        components.append(line_components)
    return components


def _escape(text):
    return text.replace("\\", "\\\\").replace('"', '\\"')


def to_snbt(lines):
    """lines: list of lines, each a list of {"text","color"} dicts."""
    line_strs = []
    for line in lines:
        comp_strs = []
        for c in line:
            kv = ", ".join(f'{k}: "{_escape(v)}"' for k, v in c.items())
            comp_strs.append("{" + kv + "}")
        line_strs.append("[" + ", ".join(comp_strs) + "]")
    return "[" + ", ".join(line_strs) + "]"


if __name__ == "__main__":
    raw_string = input("String to convert: ")
    comp = build_components(raw_string)
    print(to_snbt(comp))