extends Node2D

const IDLE_DURATION = 0.5

export var move_to = Vector2.LEFT*50000000
export var speed = 8.0

var follow = Vector2.ZERO

onready var ball = $Ball
onready var tween = $MoveTween

func _ready():
	_init_tween()

func _init_tween():
	var duration = move_to.length() / float(speed*128)
	tween.interpolate_property(self, "follow", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.start()

func _physics_process(delta):
	ball.position = ball.position.linear_interpolate(follow,0.075)


