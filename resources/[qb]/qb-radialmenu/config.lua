Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Config = {}

Config.MenuItems = {
    {
        id = 'citizen',
        title = 'Burger Interactie',
        icon = '#citizen',
        items = {
            {
                id    = 'givelc',
                title = 'Geef ID-kaart',
                icon = '#idkaart',
                type = 'server',
                event = 'inventory:server:ShowIdRadial',
                shouldClose = true,
            },
            {
                id    = 'givedl',
                title = 'Geef Rijbewijs',
                icon = '#rijbewijs',
                type = 'client',
                event = 'qb-radialmenu:client:giveidkaart',
                shouldClose = true,
            },
            {
                id    = 'givenum',
                title = 'Geef Nummer',
                icon = '#nummer',
                type = 'client',
                event = 'qb-radialmenu:client:giveidkaart',
                shouldClose = true,
            },
            {
                id    = 'givebank',
                title = 'Geef Bank nr.',
                icon = '#banknr',
                type = 'client',
                event = 'qb-radialmenu:client:giveidkaart',
                shouldClose = true,
            },
            {
                id = 'illegalactions',
                title = 'Illegale Actie\'s',
                icon = '#illegal',
                items = {
                    {
                        id    = 'cornerselling',
                        title = 'Corner Selling',
                        icon = '#cornerselling',
                        type = 'client',
                        event = 'qb-drugs:client:cornerselling',
                        shouldClose = true,
                    }
                }
            }
        }
    },
    {
        id = 'general',
        title = 'Algemeen',
        icon = '#general',
        items = {
            {
                id = 'house',
                title = 'Huis Interactie',
                icon = '#house',
                items = {
                    {
                        id    = 'givehousekey',
                        title = 'Geef Huis Sleutel',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'qb-houses:client:giveHouseKey',
                        shouldClose = true,
                        items = {},
                    },
                    {
                        id    = 'togglelock',
                        title = 'Toggle Deurslot',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'qb-houses:client:toggleDoorlock',
                        shouldClose = true,
                    },
                    {
                        id    = 'decoratehouse',
                        title = 'Decoreer huis',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'qb-houses:client:decorate',
                        shouldClose = true,
                    },            
                    {
                        id = 'houseLocations',
                        title = 'Interactie Locaties',
                        icon = '#house',
                        items = {
                            {
                                id    = 'setstash',
                                title = 'Stash Instellen',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setoutift',
                                title = 'Outfit Instellen',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setlogout',
                                title = 'Logout Instellen',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'qb-houses:client:setLocation',
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
        }
    },
    {
        id = 'vehicle',
        title = 'Voertuig Interactie',
        icon = '#vehicle',
        items = {
            {
                id    = 'givekey',
                title = 'Geef Voertuig Sleutel',
                icon = '#vehiclekey',
                type = 'client',
                event = 'qb-radialmenu:client:playerCheck',
                shouldClose = false,
                items = {},
            },
            {
                id    = 'getintrunk',
                title = 'Kofferbak [In/Uit]',
                icon = '#vehiclekey',
                type = 'client',
                event = 'qb-smallresources:trunk:client:getInTrunk',
                shouldClose = true,
            },
            {
                id    = 'vehicledoors',
                title = 'Voertuig Deuren',
                icon = '#vehicledoors',
                items = {
                    {
                        id    = 'door0',
                        title = 'Links Voor',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door4',
                        title = 'Motorkap',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door1',
                        title = 'Rechts Voor',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door3',
                        title = 'Rechts Achter',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door5',
                        title = 'Kofferbak',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door2',
                        title = 'Links Achter',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                }
            },
        }
    },
    {
        id = 'jobinteractions',
        title = 'Werk Interactie',
        icon = '#vehicle',
        items = {},
    },
}

Config.JobInteractions = {
    ["doctor"] = {
        {
            id    = 'statuscheck',
            title = 'Onderzoek Persoon',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'treatwounds',
            title = 'Genees Wonden',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true,
        },
        {
            id    = 'reviveplayer',
            title = 'Help Omhoog',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true,
        },
    },
    ["ambulance"] = {
        {
            id    = 'statuscheck',
            title = 'Onderzoek Persoon',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'treatwounds',
            title = 'Genees Wonden',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true,
        },
    },
    ["taxi"] = {
        {
            id    = 'togglemeter',
            title = 'Meter Oppoppen',
            icon = '#general',
            type = 'client',
            event = 'qb-taxi:client:toggleMeter',
            shouldClose = true,
        },
        {
            id    = 'togglemouse',
            title = 'Meter Bedienen',
            icon = '#general',
            type = 'client',
            event = 'qb-taxi:client:toggleMuis',
            shouldClose = true,
        },
    },
    ["police"] = {
        {
            id    = 'statuscheck',
            title = 'Onderzoek Persoon',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'checkstatus',
            title = 'Status Check',
            icon = '#general',
            type = 'client',
            event = 'police:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'handcuff',
            title = 'Boeien',
            icon = '#general',
            type = 'client',
            event = 'police:client:CuffPlayer',
            shouldClose = true,
        },
        {
            id    = 'escort',
            title = 'Escorteren',
            icon = '#general',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true,
        },
        {
            id    = 'playerinvehicle',
            title = 'Zet in voertuig',
            icon = '#general',
            type = 'client',
            event = 'police:client:PutPlayerInVehicle',
            shouldClose = true,
        },
        {
            id    = 'searchplayer',
            title = 'Fouilleren',
            icon = '#general',
            type = 'client',
            event = 'police:client:SearchPlayer',
            shouldClose = true,
        },
        {
            id    = 'jailplayer',
            title = 'Gevangenis',
            icon = '#general',
            type = 'client',
            event = 'police:client:JailPlayer',
            shouldClose = true,
        },
        {
            id    = 'billplayer',
            title = 'Boete',
            icon = '#general',
            type = 'client',
            event = 'police:client:BillPlayer',
            shouldClose = true,
        },
    },
}