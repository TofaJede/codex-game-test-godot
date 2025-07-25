extends KinematicBody2D

export var speed := 200
var current_instrument := "trumpet"

onready var projectile_scene := preload("res://scenes/Projectile.tscn")

func _physics_process(delta):
    var velocity := Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    if Input.is_action_pressed("move_down"):
        velocity.y += 1
    if Input.is_action_pressed("move_up"):
        velocity.y -= 1
    if velocity != Vector2.ZERO:
        velocity = velocity.normalized() * speed
    move_and_slide(velocity)
    look_at(get_global_mouse_position())
    if Input.is_action_just_pressed("fire"):
        fire()

func fire():
    var projectile = projectile_scene.instance()
    projectile.global_position = global_position
    projectile.direction = (get_global_mouse_position() - global_position).normalized()
    projectile.note_sound = load("res://sounds/trumpet_c_note.ogg")
    get_parent().add_child(projectile)
