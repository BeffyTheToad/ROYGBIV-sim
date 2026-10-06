extends Node

var player_scene := load("res://scenes/player.tscn")
var player = false
var player_pos := Vector2(640,0)
var player_velocity := Vector2(0,0)

var layers_left := 25
