extends Node2D  # or Sprite2D

@export var orbit_radius: float = 150.0  # larger distance from player
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 500.0

func _process(delta):
    var player_pos = get_parent().global_position
    var mouse_pos = get_global_mouse_position()

    # Angle from player to mouse
    var angle = (mouse_pos - player_pos).angle()

    # Position gun on circle around player
    global_position = player_pos + Vector2(cos(angle), sin(angle)) * orbit_radius

    # Rotate gun to face the mouse
    look_at(mouse_pos)

    # Optional horizontal flip
    if mouse_pos.x < global_position.x:
        scale.y = -1
    else:
        scale.y = 1

    # Shooting
    if Input.is_action_just_pressed("shoot") and bullet_scene:
        shoot_bullet()

# Shooting function
func shoot_bullet() -> void:
    var spawn_point = $BulletSpawn
    if spawn_point == null:
        push_error("BulletSpawn node not found!")
        return

    var bullet = bullet_scene.instantiate()
    bullet.global_position = spawn_point.global_position

    # Bullet direction based on gun rotation
    var direction = Vector2.RIGHT.rotated(global_rotation)
    bullet.velocity = direction * bullet_speed
    bullet.global_rotation = global_rotation

    get_tree().current_scene.add_child(bullet)
