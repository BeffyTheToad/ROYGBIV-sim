extends Node

var player_scene := load("res://scenes/player.tscn")
var player = false
var player_pos := Vector2(640,0)
var player_velocity := Vector2(0,0)

var layers_left := 10
var garage_hp := 10000
var garage_sprite_current := load("res://assets/Garage Stage 0.png")
var garage_sprite_x := 640
