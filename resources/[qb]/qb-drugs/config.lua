Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = Config or {}

Config.Dealers = {
    [1] = {
        ["name"] = "Tony",
        ["coords"] = {
            ["x"] = -152.41,
            ["y"] = -1623.93,
            ["z"] = 36.84,
        },
        ["time"] = {
            ["min"] = 22,
            ["max"] = 4,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weapon_snspistol",
                price = 3500,
                amount = 2,
                info = {},
                type = "item",
                slot = 2,
                minrep = 200,
            },
        }
    },
    [2] = {
        ["name"] = "Garry",
        ["coords"] = {
            ["x"] = -960.01,
            ["y"] = -1109.62,
            ["z"] = 2.15,
        },
        ["time"] = {
            ["min"] = 15,
            ["max"] = 22,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weapon_snspistol",
                price = 3500,
                amount = 2,
                info = {},
                type = "item",
                slot = 2,
                minrep = 200,
            },
        }
    },
    [3] = {
        ["name"] = "Fred",
        ["coords"] = {
            ["x"] = -1569.36,
            ["y"] = -233.13,
            ["z"] = 49.46,
        },
        ["time"] = {
            ["min"] = 22,
            ["max"] = 10,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weapon_snspistol",
                price = 3500,
                amount = 2,
                info = {},
                type = "item",
                slot = 2,
                minrep = 200,
            },
        }
    },
    [4] = {
        ["name"] = "Viktor",
        ["coords"] = {
            ["x"] = 202.04,
            ["y"] = -149.02,
            ["z"] = 65.47,
        },
        ["time"] = {
            ["min"] = 22,
            ["max"] = 10,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weapon_snspistol",
                price = 3500,
                amount = 2,
                info = {},
                type = "item",
                slot = 2,
                minrep = 200,
            },
        }
    },
    [5] = {
        ["name"] = "Julio",
        ["coords"] = {
            ["x"] = 1654.95,
            ["y"] = 4862.17,
            ["z"] = 41.99,
        },
        ["time"] = {
            ["min"] = 15,
            ["max"] = 22,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weapon_snspistol",
                price = 3500,
                amount = 2,
                info = {},
                type = "item",
                slot = 2,
                minrep = 200,
            },
        }
    },
    [6] = {
        ["name"] = "Ricardo",
        ["coords"] = {
            ["x"] = 15.25,
            ["y"] = 3688.94,
            ["z"] = 40.19,
        },
        ["time"] = {
            ["min"] = 15,
            ["max"] = 22,
        },
        ["products"] = {
            [1] = {
                name = "weed_white-widow",
                price = 15,
                amount = 150,
                info = {},
                type = "item",
                slot = 1,
                minrep = 0,
            },
            [2] = {
                name = "weapon_snspistol",
                price = 3500,
                amount = 2,
                info = {},
                type = "item",
                slot = 2,
                minrep = 200,
            },
        }
    },
}

Config.CornerSellingDrugsList = {
    "weed_white-widow",
    "weed_skunk",
    "weed_purple-haze",
    "weed_og-kush",
    "weed_amnesia",
    "weed_ak47",
}

Config.DeliveryLocations = {
    [1] = {
        ["label"] = "Stripclub",
        ["coords"] = {
            ["x"] = 106.24,
            ["y"] = -1280.32,
            ["z"] = 29.24,
        }
    },
    [2] = {
        ["label"] = "Vinewood Video",
        ["coords"] = {
            ["x"] = 223.98,
            ["y"] = 121.53,
            ["z"] = 102.76,
        }
    },
    [3] = {
        ["label"] = "Vinewood Video",
        ["coords"] = {
            ["x"] = 223.98,
            ["y"] = 121.53,
            ["z"] = 102.76,
        }
    },
    [4] = {
        ["label"] = "Resort",
        ["coords"] = {
            ["x"] = -1245.63,
            ["y"] = 376.21,
            ["z"] = 75.34,
        }
    },
    [5] = {
        ["label"] = "Bahama Mamas",
        ["coords"] = {
            ["x"] = -1383.1,
            ["y"] = -639.99,
            ["z"] = 28.67,
        }
    },
}

Config.CornerSellingZones = {
    [1] = {
        ["coords"] = {
            ["x"] = -1415.53,
            ["y"] = -1041.51,
            ["z"] = 4.62,
        },
        ["time"] = {
            ["min"] = 12,
            ["max"] = 18,
        },
    },
}

Config.DeliveryItems = {
    [1] = {
        ["item"] = "weed_brick",
        ["minrep"] = 0,
    },
}