class_name BuildingData
extends Resource

@export var name: String = "Debug Tower"
#@export building: Texture
#@export destroyedBuilding: Texture
@export var widthHeight:= Vector2(3,3) # in grid
@export var price: int = 50
@export var health: int = 200
@export var resistance:= Vector3(1, 1, 1) # x y z --> physical magical curse

# tower specific
@export var dmg:= Vector2i() # x y --> minDng maxDmg
@export var attackType:= Vector3() # 1 0 0 makes it physical, 0 1 0 makes it magic, 1 1 0 makes it both
@export var targetType:= Vector2() # 1 1 means that it can attack land & air respectively, more Vectors can be added later on
@export var rangeRadius: float # in grid
@export var attackSpeed: float # in second

# multiplers + buffs
@export var critRate: float
@export var critDmg: float
@export var onHitChance: float = 1.0
