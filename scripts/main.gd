extends Node2D

var score = 0
var game_over = false
var game_started = false
var speed = 300.0
var spawn_timer = 0.0
var spawn_interval = 1.5

@onready var player = $Player
@onready var ui = $UI
@onready var test_label = $UI/TestLabel
@onready var obstacle_container = $ObstacleContainer
@onready var collectible_container = $CollectibleContainer

# 音效
var sound_collect: AudioStreamPlayer
var sound_hit: AudioStreamPlayer

func _ready():
	randomize()
	
	# 初始化音效
	setup_audio()
	
	ui.update_score(score)
	ui.show_message("Click to Start!\nUse Mouse to Move")
	
	# 更新测试标签
	if test_label:
		test_label.text = "Hello World! Game loaded at " + Time.get_datetime_string_from_system()

func setup_audio():
	sound_collect = AudioStreamPlayer.new()
	sound_collect.stream = load("res://assets/audio/collect.ogg")
	sound_collect.volume_db = -10
	add_child(sound_collect)
	
	sound_hit = AudioStreamPlayer.new()
	sound_hit.stream = load("res://assets/audio/hit.ogg")
	sound_hit.volume_db = -5
	add_child(sound_hit)

func _process(delta):
	if game_over:
		if Input.is_action_just_pressed("ui_accept"):
			restart_game()
		return
	
	# 等待开始
	if not game_started:
		if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			game_started = true
			ui.hide_message()
		return
	
	# 自动向右流动
	player.position.x += speed * delta
	
	# 玩家跟随鼠标/触摸
	var target_pos = get_global_mouse_position()
	target_pos.x = clamp(target_pos.x, 50, 1280 - 50)
	target_pos.y = clamp(target_pos.y, 50, 720 - 50)
	player.position = player.position.lerp(target_pos, 5 * delta)
	
	# 更新流动特效
	player.update_flow_trail()
	
	# 生成障碍物
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_obstacle()
		spawn_timer = 0.0
		# 逐渐增加难度
		spawn_interval = max(0.5, spawn_interval - 0.01)
		speed = min(600.0, speed + delta * 5)
	
	# 偶尔生成收集物
	if randf() < 0.02:
		spawn_collectible()
	
	# 清理屏幕外的对象
	cleanup_off_screen()
	
	# 更新UI
	ui.update_speed(speed)
	
	# 检查玩家是否撞到边界
	if player.position.x < 0 or player.position.y < 0 or player.position.y > 720:
		game_over = true
		ui.show_game_over(score)

func spawn_obstacle():
	var obstacle = preload("res://scenes/obstacle.tscn").instantiate()
	obstacle.position = Vector2(1400, randf_range(100, 620))
	obstacle.rotation_speed = randf_range(-2, 2)
	obstacle_container.add_child(obstacle)
	# 连接碰撞信号
	obstacle.hit.connect(_on_player_hit)

func spawn_collectible():
	var collectible = preload("res://scenes/collectible.tscn").instantiate()
	collectible.position = Vector2(1400, randf_range(100, 620))
	collectible_container.add_child(collectible)
	# 连接收集信号
	collectible.collected.connect(_on_player_collected)

func cleanup_off_screen():
	for obstacle in obstacle_container.get_children():
		if obstacle.position.x < -100:
			obstacle.queue_free()
	for collectible in collectible_container.get_children():
		if collectible.position.x < -100:
			collectible.queue_free()

func restart_game():
	game_over = false
	game_started = false
	score = 0
	speed = 300.0
	spawn_interval = 1.5
	spawn_timer = 0.0
	
	player.position = Vector2(200, 360)
	player.reset_flow()
	
	for obstacle in obstacle_container.get_children():
		obstacle.queue_free()
	for collectible in collectible_container.get_children():
		collectible.queue_free()
	
	ui.hide_game_over()
	ui.update_score(score)
	ui.show_message("Click to Start!\nUse Mouse to Move")

func _on_player_collected():
	score += 10
	ui.update_score(score)
	if sound_collect and sound_collect.playing == false:
		sound_collect.play()

func _on_player_hit(obstacle):
	game_over = true
	ui.show_game_over(score)
	if sound_hit:
		sound_hit.play()
