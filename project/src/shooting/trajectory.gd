extends Node2D

const MAX_DRAG_DISTANCE = 150
const MAX_VELOCITY = 44
const POINT_COUNT = 75
var clickPosition = Vector2(0,0)
var referencePointColor = Color.darkslategray
var points
var player

export var playerNodePath : NodePath


func setup(clickPosition):	
	self.clickPosition = clickPosition	
	return self
	
	
func _ready() -> void:
	player = get_node(playerNodePath)
	
	
func _process(delta: float) -> void:
	points = []	

	var pos = player.global_position		
	var drag = Vector2(clickPosition - get_global_mouse_position())	
	
	var length = drag.length()
	var vel = drag.normalized() * Global.map(min(length,MAX_DRAG_DISTANCE),0,MAX_DRAG_DISTANCE,0,MAX_VELOCITY)	
	
	for i in POINT_COUNT:
		points.push_back(pos)		
		vel.y += 2
		pos += vel
	update()
	
	
func _draw() -> void:	
	for point in points: draw_circle(point - global_position,4,Color.black)	
	draw_circle(clickPosition - global_position,10,referencePointColor)
