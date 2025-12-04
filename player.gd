# Player.gd
extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = 400.0
@export var gravity: float = 900.0

@export var player_id: int = 0

func _physics_process(delta):
    var velocity = self.velocity  # use built-in velocity

    # Horizontal input
    var input_direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    velocity.x = input_direction * speed

    # Gravity & Jump
    if not is_on_floor():
        velocity.y += gravity * delta
    else:
        if Input.is_action_just_pressed("ui_up"):
            velocity.y = -jump_velocity

    # Apply velocity and move
    self.velocity = velocity
    move_and_slide()  # no arguments needed in Godot 4
