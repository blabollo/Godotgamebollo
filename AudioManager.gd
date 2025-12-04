extends Node

@onready var arp = $ArpPlayer
@onready var bass = $BassPlayer
@onready var counter = $CounterPlayer
@onready var drums = $DrumsPlayer
@onready var melody = $MelodyPlayer
@onready var percs = $PercPlayer

var layers: Array
const LOOP_LENGTH := 5.517  # seconds per loop

var master_timer: SceneTreeTimer


func _ready():
    layers = [arp, bass, counter, drums, melody, percs]
    print("Children of AudioManager:", get_children())

    # Start all tracks muted except bass+arp
    for l in layers:
        l.volume_db = -80
        l.play()

    arp.volume_db = 0

    # Start master looping timer
    _start_master_loop()

    # Start initial menu music
    set_main_menu_music()


# --------------------
# Looping
# --------------------
func _start_master_loop():
    master_timer = get_tree().create_timer(LOOP_LENGTH, true)
    master_timer.timeout.connect(_restart_all_layers)


func _restart_all_layers():
    for l in layers:
        l.play()


# Start menu: only arp
func set_start_menu_music():
    fade_to(arp, 0)
    fade_to(bass, -80)
    fade_to(counter, -80)
    fade_to(melody, -80)
    fade_to(drums, -80)
    fade_to(percs, -80)

# Main menu: arp + bass
func set_main_menu_music():
    fade_to(arp, 0)
    fade_to(bass, 0)
    fade_to(counter, -80)
    fade_to(melody, -80)
    fade_to(drums, -80)
    fade_to(percs, -80)

# Level select: arp + bass + percs + melody
func set_level_select_music():
    fade_to(arp, 0)
    fade_to(bass, 0)
    fade_to(counter, 0)
    fade_to(melody, 0)
    fade_to(drums, -80)
    fade_to(percs, 0)

# Options (example)
func set_options_music():
    fade_to(arp, 0)
    fade_to(bass, 0)
    fade_to(counter, -10)
    fade_to(melody, -5)
    fade_to(drums, -80)
    fade_to(percs, -80)

# Credits (example)
func set_credits_music():
    fade_to(arp, 0)
    fade_to(melody, -3)
    fade_to(bass, -80)
    fade_to(counter, -80)
    fade_to(drums, -80)
    fade_to(percs, -80)
    
func set_full_music():
    fade_to(arp, 0)
    fade_to(melody, 0)
    fade_to(bass, 0)
    fade_to(counter, 0)
    fade_to(drums, 0)
    fade_to(percs, 0)



# --------------------
# Fade helper
# --------------------
func fade_to(player: AudioStreamPlayer, target_db: float, time: float = 1.5):
    var tween := create_tween()
    tween.tween_property(player, "volume_db", target_db, time)
