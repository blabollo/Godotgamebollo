extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
    MusicManager.set_level_select_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_back_button_pressed() -> void:
   get_tree().change_scene_to_file("res://mainmenu.tscn")


func _on_level_1_pressed() -> void:
    get_tree().change_scene_to_file("res://Level1.tscn")
