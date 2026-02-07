class_name unitData
extends Resource

@export var name: String
#@export building: Texture
#@export destroyedBuilding: Texture
@export var widthHeight:= Vector2i(1,1) # in grid
@export var speed: int = 200
@export var health: int = 20
@export var resistance:= Vector3(1, 1, 1) # x y z --> physical magical curse

# turning isTower on, makes the building a tower
@export var canShoot: bool = false
@export var dmg:= Vector2() # x y --> minDng maxDmg
@export var attackType:= Vector3() # 1 0 0 makes it physical, 0 1 0 makes it magic, 1 1 0 makes it both
#@export var targetType:= String (???)
#@export var AIType:= String (???) MAYBE RESOURCE OR ENUM

# multiplers
@export var rangeRadius: int # in grid
@export var attackSpeed: float # in second
@export var critRate: float
@export var critDmg: float
@export var onHitChance: float = 1.0
