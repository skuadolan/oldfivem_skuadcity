Config = {}


Config.PriceRental            = 150      -- How much rental of a Motel Room apartment is - 0 = Free.
Config.Locale                 = 'en'    -- Only defaultly supports English, feel free to add addtional language support.
Config.SwitchCharacterSup     = true    -- Optional Please ensure you have added xXFriendlysXx Switch Character fix aswell.

Config.RoomMarker = {
    Owned = {r = 255, g = 0, b = 0},     -- Owned Motel Color
	          x = 0.5, y = 0.5, z = 0.7  -- Standard Size Circle
}

Config.Zones = {

    PinkCage = {
        Name = "Pink Cage Motel",
        Pos = {x = 324.55, y = -212.44, z = 54.15, color = 23, sprite = 475, size = 0.95},
        roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
        roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
        BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
        Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
        Menu = {x = 151.32, y = -1003.05, z = -99.0}, -- Room Options Menu
        Boundries = 26.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
        Rooms = {
            Room1 = {
                number = 1,
                instancename = "pcm1",
                entry = {x = 312.89, y = -218.63, z = 54.22},
                    },

            Room2 = {
                number = 2,
                instancename = "pcm2",
                entry = {x = 310.91, y = -217.95, z = 54.22},
                    },

             Room3 = {
                number = 3,
                instancename = "pcm3",
                entry = {x = 307.38, y = -216.65, z = 54.22},
                    },

             Room4 = {
                number = 4,
                instancename = "pcm4",
                entry = {x = 307.52, y = -213.37, z = 54.22},
                     },

             Room5 = {
                number = 5,
                instancename = "pcm5",
                entry = {x = 309.59, y = -208.01, z = 54.22},
                    },

             Room5a = {
                number = "5a",
                instancename = "pcm5a",
                entry = {x = 311.24, y = -203.36, z = 54.22},
                    },

             Room6 = {
                number = 6,
                instancename = "pcm6",
                entry = {x = 313.34, y = -198.13, z = 54.22},
                    },

             Room7 = {
                number = 7,
                instancename = "pcm7",
                entry = {x = 315.77, y = -194.86, z = 54.22},
                    },

             Room8 = {
                number = 8,
                instancename = "pcm8",
                entry = {x = 319.21, y = -196.27, z = 54.22},
                    },

             Room9 = {
                number = 9,
                instancename = "pcm9",
                entry = {x = 321.25, y = -196.96, z = 54.22},
                    },

             Room11 = {
                number = 11,
                instancename = "pcm11",
                entry = {x = 312.83, y = -218.79, z = 58.02},
                    },

            Room12 = {
                number = 12,
                instancename = "pcm12",
                entry = {x = 310.76, y = -218.09, z = 58.02},
                    },

             Room13 = {
                number = 13,
                instancename = "pcm13",
                entry = {x = 307.14, y = -216.6, z = 58.02},
                    },

             Room14 = {
                number = 14,
                instancename = "pcm14",
                entry = {x = 307.53, y = -213.4, z = 58.02},
                    },

             Room15 = {
                number = 15,
                instancename = "pcm15",
                entry = {x = 309.64, y = -207.92, z = 58.02},
                    },

             Room16 = {
                number = 16,
                instancename = "pcm16",
                entry = {x = 311.27, y = -203.4, z = 58.02},
                    },

             Room17 = {
                number = 17,
                instancename = "pcm17",
                entry = {x = 313.37, y = -198.13, z = 58.02},
                    },

             Room18 = {
                number = 18,
                instancename = "pcm18",
                entry = {x = 315.76, y = -194.78, z = 58.02},
                    },

             Room19 = {
                number = 19,
                instancename = "pcm19",
                entry = {x = 319.3, y = -196.21, z = 58.02},
                    },

             Room20 = {
                number = 20,
                instancename = "pcm20",
                entry = {x = 321.42, y = -196.93, z = 58.02},
             },

             -- Left Side

             Room21 = {
                number = 21,
                instancename = "pcm21",
                entry = {x = 329.47, y = -225.19, z = 54.22},
             },
             Room22 = {
                number = 22,
                instancename = "pcm22",
                entry = {x = 331.38, y = -225.93, z = 54.22},
             },
             Room23 = {
                number = 23,
                instancename = "pcm23",
                entry = {x = 334.97, y = -227.32, z = 54.22},
             },
             Room24 = {
                number = 24,
                instancename = "pcm24",
                entry = {x = 337.15, y = -224.77, z = 54.22},
             },
             Room25 = {
                number = 25,
                instancename = "pcm25",
                entry = {x = 339.21, y = -219.47, z = 54.22},
             },
             Room26 = {
                number = 26,
                instancename = "pcm26",
                entry = {x = 340.93, y = -214.86, z = 54.22},
             },
             Room27 = {
                number = 27,
                instancename = "pcm27",
                entry = {x = 342.94, y = -209.55, z = 54.22},
             },
             Room28 = {
                number = 28,
                instancename = "pcm28",
                entry = {x = 344.75, y = -204.98, z = 54.22},
             },
             Room29 = {
                number = 29,
                instancename = "pcm29",
                entry = {x = 346.73, y = -199.57, z = 54.22},
             },

             --

             Room30 = {
                number = 30,
                instancename = "pcm30",
                entry = {x = 329.34, y = -225.12, z = 58.02},
             },
             Room31 = {
                number = 31,
                instancename = "pcm31",
                entry = {x = 331.47, y = -225.89, z = 58.02},
             },
             Room32 = {
                number = 32,
                instancename = "pcm32",
                entry = {x = 334.97, y = -227.23, z = 58.02},
             },
             Room33 = {
                number = 33,
                instancename = "pcm33",
                entry = {x = 337.12, y = -224.7, z = 58.02},
             },
             Room34 = {
                number = 34,
                instancename = "pcm34",
                entry = {x = 339.16, y = -219.41, z = 58.02},
             },
             Room35 = {
                number = 35,
                instancename = "pcm35",
                entry = {x = 340.88, y = -214.93, z = 58.02},
             },
             Room36 = {
                number = 36,
                instancename = "pcm36",
                entry = {x = 342.89, y = -209.67, z = 58.02},
             },
             Room37 = {
                number = 37,
                instancename = "pcm37",
                entry = {x = 344.69, y = -205.05, z = 58.02},
             },
             Room38 = {
                number = 38,
                instancename = "pcm38",
                entry = {x = 346.74, y = -199.64, z = 58.02},
             }

    }
},
Bilingsgate = {
   Name = "Bilings Gate Motel",
   Pos = {x = 565.20, y = -1761.26, z = 29.17, color = 24, sprite = 475, size = 0.95},
   roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
   roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
   BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
   Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
   Menu = {x = 151.32, y = -1003.05, z = -99.0}, -- Room Options Menu
   Boundries = 26.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
   Rooms = {
       Room1 = {
           number = 1,
           instancename = "bgm1",
           entry = {x = 566.26, y = -1778.2, z = 29.35},
               },
      Room2 = {
         number = 2,
         instancename = "bgm2",
         entry = {x = 550.37, y = -1775.53, z = 29.31},
               },
      Room3 = {
         number = 3,
         instancename = "bgm3",
         entry = {x = 552.29, y = -1771.58, z = 29.31},
               },
Room4 = {
         number = 4,
         instancename = "bgm4",
         entry = {x = 554.67, y = -1766.37, z = 29.31},
               },
               Room5 = {
         number = 5,
         instancename = "bgm5",
         entry = {x = 557.67, y = -1759.73, z = 29.31},
               },
Room6 = {
         number = 6,
         instancename = "bgm6",
         entry = {x = 561.42, y = -1751.89, z = 29.28},
               },
Room7 = {
         number = 7,
         instancename = "bgm7",
         entry = {x = 560.1, y = -1777.2, z = 33.44},
               },
Room8 = {
         number = 8,
         instancename = "bgm8",
         entry = {x = 559.11, y = -1777.26, z = 33.44},
               },
Room10 = {
         number = 10,
         instancename = "bgm10",
         entry = {x = 550.11, y = -1770.58, z = 33.44},
               },
Room11 = {
         number = 11,
         instancename = "bgm11",
         entry = {x = 552.62, y = -1765.25, z = 33.44},
               },
Room12 = {
         number = 12,
         instancename = "bgm12",
         entry = {x = 555.7, y = -1758.66, z = 33.44},
               },
Room14 = {
         number = 14,
         instancename = "bgm14",
         entry = {x = 559.29, y = -1750.83, z = 33.44},
               },
Room15 = {
         number = 15,
         instancename = "bgm15",
         entry = {x = 561.7, y = -1747.36, z = 33.44},
               }
}
},
Motoa = {
   Name = "Motoa Motel",
   Pos = {x = 1122.91, y = 2655.80, z = 38.00, color = 25, sprite = 475, size = 0.95},
   roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
   roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
   BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
   Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
   Menu = {x = 151.32, y = -1003.05, z = -99.0}, -- Room Options Menu
   Boundries = 26.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
   Rooms = {
       Room1 = {
           number = 1,
           instancename = "mm1",
           entry = {x = 1142.42, y = 2654.74, z = 38.15},
               },
      Room2 = {
         number = 2,
         instancename = "mm2",
         entry = {x = 1142.36, y = 2651.14, z = 38.14},
               },
      Room3 = {
         number = 3,
         instancename = "mm3",
         entry = {x = 1142.32, y = 2643.63, z = 38.14},
               },
Room4 = {
         number = 4,
         instancename = "mm4",
         entry = {x = 1141.1, y = 2641.74, z = 38.14},
               },
               Room5 = {
         number = 5,
         instancename = "mm5",
         entry = {x = 1136.46, y = 2641.74, z = 38.14},
               },
Room6 = {
         number = 6,
         instancename = "mm6",
         entry = {x = 1132.71, y = 2641.73, z = 38.14},
               },
Room7 = {
         number = 7,
         instancename = "mm7",
         entry = {x = 1125.3, y = 2641.73, z = 38.14},
               },
Room8 = {
         number = 8,
         instancename = "mm8",
         entry = {x = 1121.34, y = 2641.75, z = 38.14},
               },
Room9 = {
         number = 9,
         instancename = "mm9",
         entry = {x = 1114.69, y = 2641.74, z = 38.14},
               },
Room10 = {
         number = 10,
         instancename = "mm10",
         entry = {x = 1107.16, y = 2641.71, z = 38.14},
               },
Room11 = {
   number = 11,
   instancename = "mm11",
   entry = {x = 1106.11, y = 2649.03, z = 38.14},
         },
Room12 = {
         number = 12,
         instancename = "mm12",
         entry = {x = 1106.11, y = 2652.95, z = 38.14},
               }
}
}



}