extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    MusicManager.set_full_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
