library find_xur.globals;

// GLOBAL VARIABLES

// API-key
const bungieAPIKey = BUGIE_API_KEY;

const String inventoryItemDefinitionURL =
    'https://www.bungie.net/platform/Destiny2/Manifest/DestinyInventoryItemDefinition/';
const String xurURL =
    'https://www.bungie.net/Platform/Destiny2/Vendors/?components=402';

const titan = 0;
const hunter = 1;
const warlock = 2;
const noClass = 3;

// itemCategoryHashes
const classItems = 49;
const weapon = 1;
const emblem = 19;
const armor = 20;
const ghost = 39;
const shader = 41;
const ship = 42;
const sparrow = 43;
const emotes = 44;
const mods1 = 56;
const mods2 = 59;
const clanBanner = 58;
const dummies = 3109687656;

const weaponModsOrnaments = 3124752623;
const armorModsOrnaments = 1742617626;
const armorModsOrnamentsHunter = 3683250363;
const armorModsOrnamentsTitan = 3229540061;
const armorModsOrnamentsWarlock = 3684181176;

const helmet = 45;
const arms = 46;
const chest = 47;
const legs = 48;
const classItem = 49;

const kineticWeapon = 2;
const energyWeapon = 3;
const powerWeapon = 4;

const legendary = 4008398120;
const exotic = 2759499571;
const uncommon = 2395677314;
const rare = 2127292149;
const common = 3340296461;

const xbox = 1;
const playstation = 2;
const pcBlizzard = 4;
const tigerDemon = 10;
const bungieNext = 254;

// Ignore "Invitation of the Nine" and "Nightfall Scorecard"
// when fetching Xur's items from Bungie.net API
const xurItemBlacklist = [
  4285666432,
  312904089,
];

const platforms = {
  [xbox]: "Xbox",
  [playstation]: "PlayStation",
  [pcBlizzard]: "PC (Battle.net)",
  [tigerDemon]: "TigerDemon",
  [bungieNext]: "BungieNext"
};

const classes = {
  [warlock]: "Warlock",
  [titan]: "Titan",
  [hunter]: "Hunter"
};

// Location names
const locationName = {
  0: "UNKNOWN",
  1: "THE TOWER",
  2: "EDZ",
  3: "IO",
  4: "TITAN",
  5: "NESSUS",
  6: "MARS",
  7: "MERCURY",
  8: "TANGLED SHORE",
  9: "THE MOON",
  10: "ROAMING THE \nUNIVERSE"
};

// Inventory size and item cost
const int inventorySize = 4;
const int engramPrice = 97;
const List<int> itemCost = [29, 23];

// Item constants
const classType = {0: "Titan", 1: "Hunter", 2: "Warlock", 3: "Unknown"};
const elementType = {0: "Kinetic", 1: "Void", 2: "Arc", 3: "Solar"};

const statBlacklist = [
  1480404414, // Attack
  1935470627, // Power
  3897883278, // Defense
  1885944937, // No Name
  3988418950, // Time to aim down sights
  1931675084, // Inventory size
];

const classItemStats = [
  2996146975,
  392767087,
  1943323491,
  144602215,
  1735777505,
  4244567218,
];

// The names of the gear stats
const destinyStatName = {
  2996146975: 'Mobility',
  392767087: 'Resilience',
  1943323491: 'Recovery',
  144602215: 'Intellect',
  1735777505: 'Discipline',
  4244567218: 'Strength',
};

// Rounds Per Minute,
// Magazine,
// Charge Time,
// Draw Time
const numericalWeaponStats = [
  4284893193,
  3871231066,
  2961396640,
  447667954,
  925767036,
];

const hiddenWeaponStats = [
  1345609583, // Aim Assistance
  2715839340, // Recoil Direction
  3555269338, // Zoom
];

// The names of the weapon stats
const weaponStatName = {
  4043523819: 'Impact',
  1240592695: 'Range',
  3614673599: 'Blast Radius',
  2523465841: 'Velocity',
  155624089: 'Stability',
  943549884: 'Handling',
  4188031367: 'Reload Speed',
  1591432999: 'Accuracy',
  2837207746: 'Swing Speed',
  209426660: 'Guard Resistance',
  3736848092: 'Guard Endurance',
  3022301683: 'Charge Rate',
  3597844532: 'Precision Damage',
  3907551967: 'Move Speed',
  1345609583: 'Aim Assistance',
  3988418950: 'Aim Speed',
  2715839340: 'Recoil Direction',
  3871231066: 'Magazine',
  4284893193: 'Rounds Per Minute',
  2961396640: 'Charge Time',
  447667954: 'Draw Time',
  1931675084: 'Inventory Size',
  925767036: 'Ammo Capacity',
  2762071195: 'Guard Efficiency',
  3555269338: 'Zoom', // Zoom
};

// Default Weapon Stats
const defaultWeaponStats = [
  4043523819,
  1240592695,
  155624089,
  943549884,
  4188031367,
  4284893193,
  3871231066
];
// Impact, Range, Stability, Handling, Reload Speed, RPM, Magazine

// Bow Weapon Stats
const bowWeaponStats = [
  4043523819,
  1591432999,
  155624089,
  943549884,
  4188031367,
  447667954,
  //3871231066
];
// Impact, Stability, Handling, Reload Speed, Draw Time, Magazine

// Fusion Weapon Stats
const fusionWeaponStats = [
  4043523819,
  1240592695,
  155624089,
  943549884,
  4188031367,
  2961396640,
  3871231066,
];
// Impact, Range, Stability, Handling, Charge Time, Reload Speed, Magazine

const swordWeaponStats = [
  4043523819,
  1240592695,
  2837207746,
  2762071195,
  209426660,
  925767036,
  3871231066,
];
// Impact, Range, Stability, Handling, Charge Time, Reload Speed, RPM, Magazine

// Launchers Weapon Stats
const launcherWeaponStats = [
  3614673599,
  2523465841,
  155624089,
  943549884,
  4188031367,
  4284893193,
  3871231066,
];
// Blast Radius, Velocity, Stability, Handling, Reload Speed, RPM, Magazine

const intrinsicTraitsHash = 3956125808;
