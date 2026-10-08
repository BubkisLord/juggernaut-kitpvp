data modify storage juggernaut:kits kits set value []

data modify storage juggernaut:kits kits append value {id: "beast_tamer", name: "Beast Tamer", color: "#05856b"}
data modify storage juggernaut:kits kits append value {id: "chameleon", name: "Chameleon", color: "#b5ee4a"}
data modify storage juggernaut:kits kits append value {id: "classic", name: "Classic Juggernaut", color: "#3434FF"}
data modify storage juggernaut:kits kits append value {id: "dragon", name: "Dragon", color: "#7F63D9"}
data modify storage juggernaut:kits kits append value {id: "fishmonger", name: "Fishmonger", color: "dark_aqua"}
data modify storage juggernaut:kits kits append value {id: "hunter", name: "Hunter", color: "dark_red"}
data modify storage juggernaut:kits kits append value {id: "knight", name: "Knight", color: "yellow"}
data modify storage juggernaut:kits kits append value {id: "phantom", name: "Phantom", color: "#5e556e"}
data modify storage juggernaut:kits kits append value {id: "predator", name: "Predator", color: "#b5ee4a"}
data modify storage juggernaut:kits kits append value {id: "spirit_walker", name: "Spirit Walker", color: "#577ebe"}
data modify storage juggernaut:kits kits append value {id: "timekeeper", name: "Timekeeper", color: "gold"}
data modify storage juggernaut:kits kits append value {id: "warlock", name: "Warlock", color: "#350F5B"}
data modify storage juggernaut:kits kits append value {id: "witch_doctor", name: "Witch Doctor", color: "dark_purple"}

data modify storage juggernaut:kits kits append value {id: "engineer", name: "Engineer", color: "#9221ee"}
data modify storage juggernaut:kits kits append value {id: "escapist", name: "Escapist", color: "blue"}
data modify storage juggernaut:kits kits append value {id: "ghost", name: "Ghost", color: "white"}
data modify storage juggernaut:kits kits append value {id: "guide", name: "Guide", color: "yellow"}
data modify storage juggernaut:kits kits append value {id: "jester", name: "Jester", color: "#f528d3"}
data modify storage juggernaut:kits kits append value {id: "medic", name: "Medic", color: "green"}
data modify storage juggernaut:kits kits append value {id: "puppeteer", name: "Puppeteer", color: "#a64dff"}
data modify storage juggernaut:kits kits append value {id: "rogue", name: "Rogue", color: "#9705aa"}
data modify storage juggernaut:kits kits append value {id: "scout", name: "Scout", color: "#ffe600"}
data modify storage juggernaut:kits kits append value {id: "survivor", name: "Survivor", color: "dark_aqua"}
data modify storage juggernaut:kits kits append value {id: "trickster", name: "Trickster", color: "light_purple"}

data modify storage juggernaut:kits kits[] merge value {times_picked: 0, kills: 0, wins: 0, losses: 0, win_ratio: 0, current_count: 0}

function stats:reset