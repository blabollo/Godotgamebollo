extends Control

func _on_start_button_pressed():
    # Transition to main menu: add bass
    MusicManager.set_main_menu_music()
    get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_level_select_button_pressed():
    # Transition to level select: add percs + melody
    MusicManager.set_level_select_music()
    get_tree().change_scene_to_file("res://Level_Select.tscn")

func _on_options_button_pressed():
    MusicManager.set_options_music()
    get_tree().change_scene_to_file("res://Options.tscn")

func _on_credits_button_pressed():
    MusicManager.set_credits_music()
    get_tree().quit()
    
func _ready():
    MusicManager.set_main_menu_music()
