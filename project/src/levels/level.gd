extends Node2D

const MAP_SIZE = Vector2(21,12)
const TILE_SIZE = 130
const PORTABLE_SURFACE = 0
const NON_PORTABLE_SURFACE = 1
const GREEN_LASER_H = 2
const GREEN_LASER_V = 3
const RED_LASER_H = 4
const RED_LASER_V = 5
const ENERGY_FIELD = 6
var objects = {
	"portable_surface" : preload("res://src/objects/portable_surface.tscn")	
}


func _ready() -> void:	
	for y in range(MAP_SIZE.y - 1,-1,-1):
		for x in range(MAP_SIZE.x):
			var tileID = $Grid.get_cell(x,-1- y)
			var obj = null
			
			match tileID:
				PORTABLE_SURFACE:
					obj = objects["portable_surface"].instance()
							
			if (obj != null):
				obj.global_position = Vector2((x * TILE_SIZE) + TILE_SIZE/2,(y * TILE_SIZE) + TILE_SIZE/2)
				$Objects.add_child(obj)
			
	$Grid.queue_free()
