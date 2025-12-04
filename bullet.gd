extends Node2D

@export var velocity: Vector2 = Vector2.ZERO

func _process(delta):
    global_position += velocity * delta
