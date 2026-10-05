extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.2

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if is_on_floor():
		if direction == -1:
			animated_sprite.flip_h = true
			animated_sprite.play("run")
		elif direction == 1:
			animated_sprite.flip_h = false
			animated_sprite.play("run")
		elif direction == 0:
			animated_sprite.play("idle")
	else:
		animated_sprite.play("jump")

	move_and_slide()
