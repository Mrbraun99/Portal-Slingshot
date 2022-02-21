extends Node2D

enum TILES {
	PORTABLE_SURFACE,
	NON_PORTABLE_SURFACE,
	GREEN_LASER_H,
	GREEN_LASER_V,
	RED_LASER_H,
	RED_LASER_V	
}
const MAP_SIZE = Vector2(21,12)
const TILE_SIZE = 130
var objects = {
	"portable_surface" : preload("res://src/objects/portable_surface.tscn")	
}


func _ready() -> void:	
	for y in range(MAP_SIZE.y - 1,-1,-1):
		for x in range(MAP_SIZE.x):
			var tileID = $Grid.get_cell(x,-1- y)
			var obj = null
			
			match tileID:
				TILES.PORTABLE_SURFACE:
					obj = objects["portable_surface"].instance()
							
			if (obj != null):
				obj.global_position = Vector2((x * TILE_SIZE) + TILE_SIZE/2,(y * TILE_SIZE) + TILE_SIZE/2)
				$Objects.add_child(obj)
			
	$Grid.queue_free()
