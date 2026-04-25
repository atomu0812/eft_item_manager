# frozen_string_literal: true

puts "Seeding start..."

ItemTask.delete_all
ItemHideout.delete_all
UserItem.delete_all
Task.delete_all
Hideout.delete_all
Item.delete_all

def find_or_create_item(name)
  Item.find_or_create_by!(name: name)
end

def find_or_create_task(name)
  Task.find_or_create_by!(name: name)
end

def find_or_create_hideout(name)
  Hideout.find_or_create_by!(name: name)
end

def register_task_requirement(item_name:, task_name:, required_quantity:)
  item = find_or_create_item(item_name)
  task = find_or_create_task(task_name)

  item_task = ItemTask.find_or_initialize_by(item: item, task: task)
  item_task.required_quantity = required_quantity
  item_task.save!
end

def register_hideout_requirement(item_name:, hideout_name:, required_quantity:)
  item = find_or_create_item(item_name)
  hideout = find_or_create_hideout(hideout_name)

  item_hideout = ItemHideout.find_or_initialize_by(item: item, hideout: hideout)
  item_hideout.required_quantity = required_quantity
  item_hideout.save!
end

# =========================================================
# Hideout
# =========================================================
register_hideout_requirement(item_name: "Advanced current converter", hideout_name: "Solar Power", required_quantity: 1)
register_hideout_requirement(item_name: "Alkaline cleaner for heat exchangers", hideout_name: "Heating Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "Analog thermometer", hideout_name: "Booze Generator", required_quantity: 2)
register_hideout_requirement(item_name: "Aramid fiber fabric", hideout_name: "Rest Space Lv2", required_quantity: 10)
register_hideout_requirement(item_name: "Aseptic bandage", hideout_name: "Medstation Lv1", required_quantity: 2)
register_hideout_requirement(item_name: "Awl", hideout_name: "Stash Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "BakeEzy cook book", hideout_name: "Library", required_quantity: 1)
register_hideout_requirement(item_name: "Bolts", hideout_name: "Hideout Aggregate", required_quantity: 53)
register_hideout_requirement(item_name: "Bottle of Fierce Hatchling moonshine", hideout_name: "Scav Case", required_quantity: 3)
register_hideout_requirement(item_name: "Bottle of OLOLO Multivitamins", hideout_name: "Medstation Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Bottle of saline solution", hideout_name: "Medstation Lv2", required_quantity: 6)
register_hideout_requirement(item_name: "Bronze lion figurine", hideout_name: "Scav Case", required_quantity: 3)
register_hideout_requirement(item_name: "Bulbex cable cutter", hideout_name: "Generator Lv2", required_quantity: 1)
register_hideout_requirement(item_name: "Bundle of wires", hideout_name: "Hideout Aggregate", required_quantity: 41)
register_hideout_requirement(item_name: "CPU fan", hideout_name: "Hideout Aggregate", required_quantity: 35)
register_hideout_requirement(item_name: "Can of white salt", hideout_name: "Cultist Circle", required_quantity: 4)
register_hideout_requirement(item_name: "Car battery", hideout_name: "Generator Lv2", required_quantity: 1)
register_hideout_requirement(item_name: "Cat figurine", hideout_name: "Hall of Fame Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Chainlet", hideout_name: "Library", required_quantity: 2)
register_hideout_requirement(item_name: "Classic matches", hideout_name: "Hideout Aggregate", required_quantity: 3)
register_hideout_requirement(item_name: "Construction measuring tape", hideout_name: "Cultist Circle", required_quantity: 3)
register_hideout_requirement(item_name: "Corrugated hose", hideout_name: "Hideout Aggregate", required_quantity: 30)
register_hideout_requirement(item_name: "Cricket lighter", hideout_name: "Hideout Aggregate", required_quantity: 6)
register_hideout_requirement(item_name: "Damaged hard drive", hideout_name: "Hideout Aggregate", required_quantity: 8)
register_hideout_requirement(item_name: "Diary", hideout_name: "Library", required_quantity: 5)
register_hideout_requirement(item_name: "Disposable syringe", hideout_name: "Medstation Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Dry fuel", hideout_name: "Hideout Aggregate", required_quantity: 5)
register_hideout_requirement(item_name: "Duct tape", hideout_name: "Hideout Aggregate", required_quantity: 22)
register_hideout_requirement(item_name: "DVD drive", hideout_name: "Intelligence Center Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Electric drill", hideout_name: "Hideout Aggregate", required_quantity: 8)
register_hideout_requirement(item_name: "Electric motor", hideout_name: "Hideout Aggregate", required_quantity: 7)
register_hideout_requirement(item_name: "Energy-saving lamp", hideout_name: "Hideout Aggregate", required_quantity: 56)
register_hideout_requirement(item_name: "Esmarch tourniquet", hideout_name: "Medstation Lv2", required_quantity: 10)
register_hideout_requirement(item_name: "Factory plan map", hideout_name: "Hall of Fame Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Fleece fabric", hideout_name: "Hideout Aggregate", required_quantity: 16)
register_hideout_requirement(item_name: "Gas mask air filter", hideout_name: "Air Filtering Unit", required_quantity: 5)
register_hideout_requirement(item_name: "Gold skull ring", hideout_name: "Scav Case", required_quantity: 6)
register_hideout_requirement(item_name: "Golden neck chain", hideout_name: "Scav Case", required_quantity: 8)
register_hideout_requirement(item_name: "Golden rooster figurine", hideout_name: "Scav Case", required_quantity: 2)
register_hideout_requirement(item_name: "Hand drill", hideout_name: "Stash Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "Horse figurine", hideout_name: "Library", required_quantity: 1)
register_hideout_requirement(item_name: "Hunting matches", hideout_name: "Heating Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "Insulating tape", hideout_name: "Hideout Aggregate", required_quantity: 12)
register_hideout_requirement(item_name: "Intelligence folder", hideout_name: "Intelligence Center Lv2", required_quantity: 4)
register_hideout_requirement(item_name: "KEKTAPE duct tape", hideout_name: "Hideout Aggregate", required_quantity: 8)
register_hideout_requirement(item_name: "Leatherman Multitool", hideout_name: "Workbench Lv1", required_quantity: 2)
register_hideout_requirement(item_name: "Light bulb", hideout_name: "Hideout Aggregate", required_quantity: 24)
register_hideout_requirement(item_name: "Lucky Scav Junk box", hideout_name: "Scav Case", required_quantity: 1)
register_hideout_requirement(item_name: "Magnet", hideout_name: "Illumination Lv2", required_quantity: 1)
register_hideout_requirement(item_name: "Medical bloodset", hideout_name: "Medstation Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "Medical tools", hideout_name: "Medstation Lv2", required_quantity: 3)
register_hideout_requirement(item_name: "Metal cutting scissors", hideout_name: "Gym", required_quantity: 2)
register_hideout_requirement(item_name: "Metal spare parts", hideout_name: "Hideout Aggregate", required_quantity: 29)
register_hideout_requirement(item_name: "Military cable", hideout_name: "Solar Power", required_quantity: 10)
register_hideout_requirement(item_name: "Military corrugated tube", hideout_name: "Air Filtering Unit", required_quantity: 10)
register_hideout_requirement(item_name: "Military power filter", hideout_name: "Hideout Aggregate", required_quantity: 20)
register_hideout_requirement(item_name: "PAID AntiRoach spray", hideout_name: "Cultist Circle", required_quantity: 1)
register_hideout_requirement(item_name: "Pack of nails", hideout_name: "Hideout Aggregate", required_quantity: 23)
register_hideout_requirement(item_name: "Pack of screws", hideout_name: "Hideout Aggregate", required_quantity: 36)
register_hideout_requirement(item_name: "Phase control relay", hideout_name: "Hideout Aggregate", required_quantity: 25)
register_hideout_requirement(item_name: "Phased array element", hideout_name: "Solar Power", required_quantity: 6)
register_hideout_requirement(item_name: "Pile of meds", hideout_name: "Medstation Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Pipe grip wrench", hideout_name: "Booze Generator", required_quantity: 1)
register_hideout_requirement(item_name: "Pliers Elite", hideout_name: "Workbench Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "Power cord", hideout_name: "Hideout Aggregate", required_quantity: 24)
register_hideout_requirement(item_name: "Power supply unit", hideout_name: "Bitcoin Farm Lv1", required_quantity: 20)
register_hideout_requirement(item_name: "Pressure gauge", hideout_name: "Booze Generator", required_quantity: 2)
register_hideout_requirement(item_name: "Printed circuit board", hideout_name: "Hideout Aggregate", required_quantity: 15)
register_hideout_requirement(item_name: "Radiator helix", hideout_name: "Booze Generator", required_quantity: 5)
register_hideout_requirement(item_name: "Roller Submariner gold wrist watch", hideout_name: "Scav Case", required_quantity: 4)
register_hideout_requirement(item_name: "Round pliers", hideout_name: "Vents Lv2", required_quantity: 1)
register_hideout_requirement(item_name: "Screw nuts", hideout_name: "Hideout Aggregate", required_quantity: 12)
register_hideout_requirement(item_name: "Secure Flash drive", hideout_name: "Intelligence Center Lv2", required_quantity: 3)
register_hideout_requirement(item_name: "Set of files Master", hideout_name: "Stash Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "Sewing kit", hideout_name: "Lavatory Lv2", required_quantity: 3)
register_hideout_requirement(item_name: "Shustrilo sealing foam", hideout_name: "Hideout Aggregate", required_quantity: 3)
register_hideout_requirement(item_name: "Silicone tube", hideout_name: "Booze Generator", required_quantity: 10)
register_hideout_requirement(item_name: "Slim diary", hideout_name: "Library", required_quantity: 5)
register_hideout_requirement(item_name: "Soap", hideout_name: "Lavatory Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Spark plug", hideout_name: "Generator Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "SurvL Survivor Lighter", hideout_name: "Cultist Circle", required_quantity: 1)
register_hideout_requirement(item_name: "T-Shaped plug", hideout_name: "Hideout Aggregate", required_quantity: 10)
register_hideout_requirement(item_name: "Tech manual", hideout_name: "Library", required_quantity: 9)
register_hideout_requirement(item_name: "Toilet paper", hideout_name: "Lavatory Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Toolset", hideout_name: "Hideout Aggregate", required_quantity: 8)
register_hideout_requirement(item_name: "Toothpaste", hideout_name: "Lavatory Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "Topographic survey maps", hideout_name: "Intelligence Center Lv1", required_quantity: 1)
register_hideout_requirement(item_name: "TP-200 TNT brick", hideout_name: "Illumination Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "Tube of Poxeram cold welding", hideout_name: "Hideout Aggregate", required_quantity: 8)
register_hideout_requirement(item_name: "VPX Flash Storage Module", hideout_name: "Bitcoin Farm Lv2", required_quantity: 2)
register_hideout_requirement(item_name: "WD-40 (100ml)", hideout_name: "Hideout Aggregate", required_quantity: 7)
register_hideout_requirement(item_name: "Weapon parts", hideout_name: "Shooting Range Lv1", required_quantity: 8)
register_hideout_requirement(item_name: "WI-FI Camera", hideout_name: "Cultist Circle", required_quantity: 4)
register_hideout_requirement(item_name: "Working LCD", hideout_name: "Solar Power", required_quantity: 4)
register_hideout_requirement(item_name: "Wrench", hideout_name: "Hideout Aggregate", required_quantity: 5)
register_hideout_requirement(item_name: "Xenomorph sealing foam", hideout_name: "Hideout Aggregate", required_quantity: 7)

# =========================================================
# Prapor
# =========================================================
register_task_requirement(item_name: "MP-133 12ga pump-action shotgun", task_name: "Debut", required_quantity: 2)
register_task_requirement(item_name: "AK-74 5.45x39 6L31 60-round magazine", task_name: "Ice Cream Cones", required_quantity: 3)
register_task_requirement(item_name: "MS2000 Marker", task_name: "BP Depot", required_quantity: 4)
register_task_requirement(item_name: "Lower half-mask", task_name: "The Punisher - Part 2", required_quantity: 7)
register_task_requirement(item_name: "Bars A-2607 95Kh18 knife", task_name: "The Punisher - Part 4", required_quantity: 5)
register_task_requirement(item_name: "Kalashnikov AK-74 5.45x39 assault rifle", task_name: "The Punisher - Part 5", required_quantity: 1)
register_task_requirement(item_name: "Colt M4A1 5.56x45 assault rifle Carbine", task_name: "The Punisher - Part 5", required_quantity: 1)
register_task_requirement(item_name: "Makarov PM 9x18PM pistol", task_name: "The Punisher - Part 5", required_quantity: 2)
register_task_requirement(item_name: "RSP-30 reactive signal cartridge (Green)", task_name: "Belka and Strelka", required_quantity: 1)

# =========================================================
# Therapist
# =========================================================
register_task_requirement(item_name: "Salewa first aid kit", task_name: "Shortage", required_quantity: 3)
register_task_requirement(item_name: "Gas analyzer", task_name: "Sanitary Standards - Part 2", required_quantity: 2)
register_task_requirement(item_name: "Morphine injector", task_name: "Painkiller", required_quantity: 4)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Health Care Privacy - Part 1", required_quantity: 3)
register_task_requirement(item_name: "Gunpowder \"Kite\"", task_name: "Health Care Privacy - Part 5", required_quantity: 1)
register_task_requirement(item_name: "Can of beef stew (Small)", task_name: "General Wares", required_quantity: 1)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Abandoned Cargo", required_quantity: 7)

# =========================================================
# Skier
# =========================================================
register_task_requirement(item_name: "BNTI Module-3M body armor", task_name: "Supplier", required_quantity: 1)
register_task_requirement(item_name: "TOZ-106 20ga bolt-action shotgun", task_name: "Supplier", required_quantity: 1)
register_task_requirement(item_name: "Secure Flash drive", task_name: "What's on the Flash Drive?", required_quantity: 2)
register_task_requirement(item_name: "USEC Dogtag", task_name: "Friend from the West - Part 1", required_quantity: 7)
register_task_requirement(item_name: "Dollars", task_name: "Friend from the West - Part 2", required_quantity: 5000)
register_task_requirement(item_name: "WI-FI Camera", task_name: "The Walls Have Eyes", required_quantity: 3)

# =========================================================
# Peacekeeper
# =========================================================
register_task_requirement(item_name: "SV-98 7.62x54R bolt-action sniper rifle", task_name: "Fishing Gear", required_quantity: 1)
register_task_requirement(item_name: "Leatherman Multitool", task_name: "Fishing Gear", required_quantity: 1)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Tigr Safari", required_quantity: 3)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Scrap Metal", required_quantity: 3)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Humanitarian Supplies", required_quantity: 2)
register_task_requirement(item_name: "MRE ration pack", task_name: "Humanitarian Supplies", required_quantity: 5)
register_task_requirement(item_name: "MS2000 Marker", task_name: "The Cult - Part 2", required_quantity: 4)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Spa Tour - Part 2", required_quantity: 2)
register_task_requirement(item_name: "WD-40 (100ml)", task_name: "Spa Tour - Part 3", required_quantity: 1)
register_task_requirement(item_name: "Clin window cleaner", task_name: "Spa Tour - Part 3", required_quantity: 2)
register_task_requirement(item_name: "Ox bleach", task_name: "Spa Tour - Part 3", required_quantity: 2)
register_task_requirement(item_name: "Corrugated hose", task_name: "Spa Tour - Part 3", required_quantity: 2)
register_task_requirement(item_name: "Dollars", task_name: "Spa Tour - Part 6", required_quantity: 8000)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Cargo X - Part 4", required_quantity: 1)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Wet Job - Part 2", required_quantity: 1)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Revision - Reserve", required_quantity: 5)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Revision - Lighthouse", required_quantity: 4)
register_task_requirement(item_name: "M.U.L.E. stimulant injector", task_name: "Samples", required_quantity: 1)
register_task_requirement(item_name: "\"Obdolbos\" cocktail injector", task_name: "Samples", required_quantity: 1)
register_task_requirement(item_name: "Meldonin injector", task_name: "Samples", required_quantity: 1)
register_task_requirement(item_name: "AHF1-M stimulant injector", task_name: "Samples", required_quantity: 1)
register_task_requirement(item_name: "P22 (Product 22) stimulant injector", task_name: "Samples", required_quantity: 1)
register_task_requirement(item_name: "L1 (Norepinephrine) injector", task_name: "Samples", required_quantity: 1)
register_task_requirement(item_name: "3-(b-TG) stimulant injector", task_name: "Samples", required_quantity: 1)

# =========================================================
# Mechanic - regular task items
# =========================================================
register_task_requirement(item_name: "PC CPU", task_name: "Signal - Part 2", required_quantity: 3)
register_task_requirement(item_name: "Rechargeable battery", task_name: "Signal - Part 2", required_quantity: 3)
register_task_requirement(item_name: "Printed circuit board", task_name: "Signal - Part 2", required_quantity: 3)
register_task_requirement(item_name: "Broken GPhone smartphone", task_name: "Signal - Part 2", required_quantity: 3)
register_task_requirement(item_name: "Signal Jammer", task_name: "Signal - Part 3", required_quantity: 3)
register_task_requirement(item_name: "Toolset", task_name: "Capacity Check", required_quantity: 3)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Black Swan", required_quantity: 3)
register_task_requirement(item_name: "Signal Jammer", task_name: "Broadcast - Part 1", required_quantity: 1)
register_task_requirement(item_name: "Toolset", task_name: "Farming - Part 1", required_quantity: 2)
register_task_requirement(item_name: "Power cord", task_name: "Farming - Part 2", required_quantity: 2)
register_task_requirement(item_name: "T-Shaped plug", task_name: "Farming - Part 2", required_quantity: 4)
register_task_requirement(item_name: "Printed circuit board", task_name: "Farming - Part 2", required_quantity: 2)
register_task_requirement(item_name: "Malboro Cigarettes", task_name: "Bad Habit", required_quantity: 5)
register_task_requirement(item_name: "Strike Cigarettes", task_name: "Bad Habit", required_quantity: 5)
register_task_requirement(item_name: "Wilston cigarettes", task_name: "Bad Habit", required_quantity: 5)

# =========================================================
# Mechanic - Gunsmith
# =========================================================
register_task_requirement(item_name: "MP-133 12ga pump-action shotgun", task_name: "Gunsmith - Part 1", required_quantity: 1)
register_task_requirement(item_name: "MP-133/153 plastic pistol grip", task_name: "Gunsmith - Part 1", required_quantity: 1)
register_task_requirement(item_name: "MP-133 custom plastic forestock with rails", task_name: "Gunsmith - Part 1", required_quantity: 1)
register_task_requirement(item_name: "Delta-tek Sprut mount for pump-action shotguns", task_name: "Gunsmith - Part 1", required_quantity: 1)
register_task_requirement(item_name: "NcSTAR Tactical blue laser LAM-module", task_name: "Gunsmith - Part 1", required_quantity: 1)

register_task_requirement(item_name: "Kalashnikov AKS-74U 5.45x39 assault rifle", task_name: "Gunsmith - Part 2", required_quantity: 1)
register_task_requirement(item_name: "AKS-74U Zenit B-11 handguard", task_name: "Gunsmith - Part 2", required_quantity: 1)
register_task_requirement(item_name: "AK-74 5.45x39 6L31 60-round magazine", task_name: "Gunsmith - Part 2", required_quantity: 1)

register_task_requirement(item_name: "HK MP5 9x19 submachine gun (Navy 3 Round Burst)", task_name: "Gunsmith - Part 3", required_quantity: 1)
register_task_requirement(item_name: "HK MP5SD B&T tri-rail ring mount", task_name: "Gunsmith - Part 3", required_quantity: 1)
register_task_requirement(item_name: "NcSTAR Tactical blue laser LAM-module", task_name: "Gunsmith - Part 3", required_quantity: 1)
register_task_requirement(item_name: "HK MP5 9x19 X Products X-5 50-round drum magazine", task_name: "Gunsmith - Part 3", required_quantity: 1)
register_task_requirement(item_name: "HK MP5SD 9x19 upper receiver", task_name: "Gunsmith - Part 3", required_quantity: 1)
register_task_requirement(item_name: "HK MP5SD 9x19 sound suppressor", task_name: "Gunsmith - Part 3", required_quantity: 1)
register_task_requirement(item_name: "HK MP5SD polymer handguard", task_name: "Gunsmith - Part 3", required_quantity: 1)

register_task_requirement(item_name: "Molot Arms Simonov OP-SKS 7.62x39 carbine", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "SKS TAPCO Intrafuse chassis", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "SKS TAPCO Intrafuse buffer tube", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "High Standard M4SS Stock", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "SKS Hexagon 7.62x39 sound suppressor", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "OP-SKS dovetail mount", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "NPZ USP-1 \"Tulpan\" 4x scope", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "SKS TAPCO Intrafuse kit SAW-Style pistol grip", task_name: "Gunsmith - Part 4", required_quantity: 1)
register_task_requirement(item_name: "SKS 7.62x39 TAPCO 6610 20-round magazine", task_name: "Gunsmith - Part 4", required_quantity: 1)

register_task_requirement(item_name: "Remington Model 870 12ga pump-action shotgun", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "M870 12ga 508mm barrel", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "ME Cylinder 12ga muzzle adapter", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "GK-02 12ga muzzle brake", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "M870 Magpul MOE handguard", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "M870 Magpul SGA polymer stock", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "Magpul M-LOK 4.1 inch rail", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "KAC vertical foregrip", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "Magpul M-LOK 2.5 inch rail", task_name: "Gunsmith - Part 5", required_quantity: 1)
register_task_requirement(item_name: "NcSTAR Tactical blue laser LAM-module", task_name: "Gunsmith - Part 5", required_quantity: 1)

register_task_requirement(item_name: "AKM", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "AK Magpul MOE AKM handguard", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "SilencerCo Hybrid 46 Direct Thread Mount adapter", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "SilencerCo Hybrid 46 multi-caliber sound silencer", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "AK Akademia Bastion dust cover", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "SIG Sauer ROMEO7 1x30 reflex sight", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "Magpul M-LOK 4.1 inch rail", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "Fortis Shift tactical foregrip", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "AK 7.62x39 Magpul PMAG 30 GEN M3 30-round magazine (Black)", task_name: "Gunsmith - Part 6", required_quantity: 1)
register_task_requirement(item_name: "AK Zenit RP-1 charging handle", task_name: "Gunsmith - Part 6", required_quantity: 1)

register_task_requirement(item_name: "Colt M4A1 5.56x45 assault rifle", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "AR-15 5.56x45 10.3 inch barrel", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "AR-15 Windham Weaponry Rail Gas Block", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "AR-15 SureFire WarComp 5.56x45 flash hider", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "SureFire SOCOM556-MINI MONSTER 5.56x45 sound suppressor", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "AR-15 Magpul MOE SL carbine length M-LOK handguard", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "SIG Sauer ROMEO7 1x30 reflex sight", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "AR-15 DoubleStar ACE ARFX Skeleton Stock", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "Magpul M-LOK 4.1 inch rail", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "KAC vertical foregrip", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "AR-15 5.56x45 SureFire MAG5-60 STANAG 60-round magazine", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "5.56x45 Magpul PMAG D-60 STANAG 60-round magazine", task_name: "Gunsmith - Part 7", required_quantity: 1)
register_task_requirement(item_name: "5.56x45 SureFire MAG5-100 STANAG 100-round magazine", task_name: "Gunsmith - Part 7", required_quantity: 1)

register_task_requirement(item_name: "Kalashnikov AKS-74N 5.45x39 assault rifle", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "AKS-74/AKS-74U Zenit PT Lock", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "AK Zenit PT-3 \"Klassika\" stock", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "AK Zenit RK-3 pistol grip", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "AK Zenit B-33 dust cover", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "AK Zenit B-30 handguard with B-31S upper handguard rail", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "AK Zenit DTK-1 7.62x39/5.45x39 muzzle brake-compensator", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "Zenit RK-0 tactical foregrip", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "Zenit Klesch-2IKS IR illuminator with laser", task_name: "Gunsmith - Part 8", required_quantity: 1)
register_task_requirement(item_name: "AK-12 5.45x39 30-round magazine", task_name: "Gunsmith - Part 8", required_quantity: 1)

register_task_requirement(item_name: "SIG P226R 9x19 pistol", task_name: "Gunsmith - Part 9", required_quantity: 1)
register_task_requirement(item_name: "P226 Stainless Elite pistol slide", task_name: "Gunsmith - Part 9", required_quantity: 1)
register_task_requirement(item_name: "P226 Stainless Elite Wooden pistol grip", task_name: "Gunsmith - Part 9", required_quantity: 1)
register_task_requirement(item_name: "P226 9x19 20-round extended magazine", task_name: "Gunsmith - Part 9", required_quantity: 1)
register_task_requirement(item_name: "NcSTAR Tactical blue laser LAM-module", task_name: "Gunsmith - Part 9", required_quantity: 1)
register_task_requirement(item_name: "P226 9x19 threaded barrel", task_name: "Gunsmith - Part 9", required_quantity: 1)
register_task_requirement(item_name: "P226 TJ's Custom 9x19 compensator", task_name: "Gunsmith - Part 9", required_quantity: 1)

register_task_requirement(item_name: "Kalashnikov AK-105 5.45x39 assault rifle", task_name: "Gunsmith - Part 10", required_quantity: 1)
register_task_requirement(item_name: "AK Akademia Bastion dust cover", task_name: "Gunsmith - Part 10", required_quantity: 1)
register_task_requirement(item_name: "SIG Sauer ROMEO7 1x30 reflex sight", task_name: "Gunsmith - Part 10", required_quantity: 1)
register_task_requirement(item_name: "AKS-74U PBS-4 5.45x39 sound suppressor", task_name: "Gunsmith - Part 10", required_quantity: 1)
register_task_requirement(item_name: "AK-74 Hexagon 5.45x39 sound suppressor", task_name: "Gunsmith - Part 10", required_quantity: 1)
register_task_requirement(item_name: "AK-74 TGP-A 5.45x39 sound suppressor", task_name: "Gunsmith - Part 10", required_quantity: 1)
register_task_requirement(item_name: "AK-74 5.45x39 6L31 60-round magazine", task_name: "Gunsmith - Part 10", required_quantity: 1)

# =========================================================
# Ragman
# =========================================================
register_task_requirement(item_name: "MS2000 Marker", task_name: "A Fuel Matter", required_quantity: 2)
register_task_requirement(item_name: "Ushanka ear flap hat", task_name: "Dressed to Kill", required_quantity: 2)
register_task_requirement(item_name: "Kinda cowboy hat", task_name: "Dressed to Kill", required_quantity: 2)
register_task_requirement(item_name: "Ghost balaclava", task_name: "Gratitude", required_quantity: 1)
register_task_requirement(item_name: "Shemagh (Green)", task_name: "Gratitude", required_quantity: 1)
register_task_requirement(item_name: "RayBench Hipster Reserve sunglasses", task_name: "Gratitude", required_quantity: 1)
register_task_requirement(item_name: "Round frame sunglasses", task_name: "Gratitude", required_quantity: 1)
register_task_requirement(item_name: "DVL-10 Mag", task_name: "Break the Deal", required_quantity: 1)
register_task_requirement(item_name: "ELCAN SpecterDR 1x/4x scope", task_name: "Break the Deal", required_quantity: 1)
register_task_requirement(item_name: "ELCAN SpecterDR 1x/4x scope (FDE)", task_name: "Break the Deal", required_quantity: 1)
register_task_requirement(item_name: "Goshan cargo manifests", task_name: "Database - Part 1", required_quantity: 1)
register_task_requirement(item_name: "OLI cargo manifests", task_name: "Database - Part 1", required_quantity: 1)
register_task_requirement(item_name: "IDEA cargo manifests", task_name: "Database - Part 1", required_quantity: 1)
register_task_requirement(item_name: "OLI cargo route documents", task_name: "Database - Part 2", required_quantity: 1)
register_task_requirement(item_name: "Lobaev Arms DVL-10 7.62x51 bolt-action sniper rifle Urbana", task_name: "Break the Deal", required_quantity: 1)

# =========================================================
# Jaeger
# =========================================================
register_task_requirement(item_name: "Iskra ration pack", task_name: "Acquaintance", required_quantity: 3)
register_task_requirement(item_name: "Pack of instant noodles", task_name: "Acquaintance", required_quantity: 2)
register_task_requirement(item_name: "Can of beef stew (Large)", task_name: "Acquaintance", required_quantity: 2)
register_task_requirement(item_name: "Iskra ration pack", task_name: "The Survivalist Path - Thrifty", required_quantity: 2)
register_task_requirement(item_name: "Bottle of water (0.6L)", task_name: "The Survivalist Path - Thrifty", required_quantity: 2)
register_task_requirement(item_name: "Salty Dog beef sausage", task_name: "The Delicious Sausage", required_quantity: 1)
register_task_requirement(item_name: "Secure Flash drive", task_name: "Shady Business", required_quantity: 3)

puts "Seeding completed!"
puts "Items: #{Item.count}"
puts "Tasks: #{Task.count}"
puts "Hideouts: #{Hideout.count}"
puts "ItemTasks: #{ItemTask.count}"
puts "ItemHideouts: #{ItemHideout.count}"