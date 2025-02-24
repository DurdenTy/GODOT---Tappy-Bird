extends Node

const GAME = preload("res://scenes/game.tscn")
const MAIN_SCENE = preload("res://scenes/main/main_scene.tscn")
const LOADING_SCREEN = preload("res://scenes/transition/loading_screen.tscn")

const SCROLL_SPEED: float = 200.0
var Score: int = 0

signal on_plane_died
signal on_score_update

var next_scene: PackedScene


func load_next_scene(ns: PackedScene):
	next_scene = ns
	get_tree().change_scene_to_packed(LOADING_SCREEN)

func load_game_scene():
	load_next_scene(GAME)
	
func load_main_scene():
	load_next_scene(MAIN_SCENE)
