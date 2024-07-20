extends CharacterBody2D

const SPEED = 400
const JUMPFORCE = -300
const GRAVITY = 450
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y = 0
	position.y = 0
	position.x = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += GRAVITY * delta;
	if Input.is_action_just_pressed("Jump"):
		var jumpMultiplier = min(max(inverse_lerp(-280.0, 250.0, position.y), 0.0), 1.0)
		print("jump_mul: %s" %jumpMultiplier);
		var velMultiplier = 1.0 - min(max(inverse_lerp(0, JUMPFORCE, velocity.y), 0.0), 1.0)
		print("vel_mul: %s" %velMultiplier);
		velocity.y += JUMPFORCE * jumpMultiplier * velMultiplier
	if (position.y >= 380):
		_ready();
	velocity.x = SPEED
	move_and_slide()
