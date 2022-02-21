extends Area2D

#var color = Color.blue
#var pathPoints
#var counter = 0
#
#
#func setup(pathPoints,color):	
#	self.color = color
#	self.pathPoints = pathPoints	
#	self.global_position = pathPoints[0]
#	return self
#
#
#func _ready() -> void:
#	connect("body_entered",self,"obj_entered")
#
#func _process(delta: float) -> void:	
#	var wholePart = floor(counter)
#	var remaining = counter - wholePart	
#	global_position = pathPoints[wholePart] + (pathPoints[wholePart + 1] - pathPoints[wholePart]).normalized() * remaining	
#	counter += 0.5
#
#
#func _draw():	
#	draw_circle(position - global_position,6,color)
#
#
#func obj_entered(obj):
#	if obj.is_in_group("solid_block"): queue_free()
