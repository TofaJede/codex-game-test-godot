extends Area2D

export var speed := 600
var direction := Vector2.ZERO
var note_sound : AudioStream

onready var audio_player := $AudioStreamPlayer2D

func _ready():
    audio_player.stream = note_sound
    connect("body_entered", self, "_on_body_entered")

func _physics_process(delta):
    position += direction * speed * delta

func _on_body_entered(body):
    audio_player.play()
    queue_free()
