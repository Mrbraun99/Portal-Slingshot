extends Node2D

var portalColor = Color.blue
var projectile = preload("res://src/shooting/projectile.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if (event.button_index != BUTTON_LEFT and event.button_index != BUTTON_RIGHT): return
		match event.pressed:
			true:
				$Trajectory.visible = true
				$Trajectory.setup(get_global_mouse_position())				
				
				match event.button_index:
					BUTTON_LEFT:
						portalColor = Color.blue
					BUTTON_RIGHT:
						portalColor = Color.orange		
					
				$Trajectory.referencePointColor = portalColor					
			false:				
				$Trajectory.visible = false										
				$Projectiles.add_child(projectile.instance().setup($Trajectory.points,portalColor))	
	update()
