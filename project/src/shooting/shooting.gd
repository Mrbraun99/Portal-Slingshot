extends Node2D

class Trajectory:
	const MAX_DRAG_DISTANCE = 150
	const MAX_VELOCITY = 44
	const POINT_COUNT = 75
	
	var enabled = false
	var points = []
	var referencePoint = Vector2(0,0)


var trajectory = Trajectory.new()
var projectile = preload("res://src/shooting/projectile.tscn")
var sPortalColor = Color.blue
var player


func _ready() -> void:
	player = get_node("../Player")
	

func _process(delta: float) -> void:
	if trajectory.enabled:
		trajectory.points = []
		
		var pos = player.global_position		
		var drag = Vector2(trajectory.referencePoint - get_global_mouse_position())	
	
		var length = drag.length()
		var vel = drag.normalized() * Global.map(min(length,trajectory.MAX_DRAG_DISTANCE),0,trajectory.MAX_DRAG_DISTANCE,0,trajectory.MAX_VELOCITY)	
	
		for i in trajectory.POINT_COUNT:
			trajectory.points.push_back(pos)		
			vel.y += 2
			pos += vel		
		
	update()
	
	
func _draw():
	if trajectory.enabled:
		for point in trajectory.points: draw_circle(point - global_position,4,Color.black)	
		draw_circle(trajectory.referencePoint - global_position,10,sPortalColor)


func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and Input.is_mouse_button_pressed(BUTTON_RIGHT): return	
	
	if event is InputEventMouseButton:
		if (event.button_index != BUTTON_LEFT and event.button_index != BUTTON_RIGHT): return
		match event.pressed:
			true:
				match event.button_index:
					BUTTON_LEFT:
						sPortalColor = Color.blue
					BUTTON_RIGHT:
						sPortalColor = Color.orange					
				
				trajectory.enabled = true
				trajectory.referencePoint = get_global_mouse_position()								
			false:		
				match event.button_index:
					BUTTON_LEFT:
						if sPortalColor == Color.orange : return
					BUTTON_RIGHT:
						if sPortalColor == Color.blue : return			
						
				trajectory.enabled = false
