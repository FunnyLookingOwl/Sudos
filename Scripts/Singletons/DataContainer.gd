extends Node

var levels = {
	'level1' : "res://Scenes/Levels/Level1.scn",
	'level2' : "res://Scenes/Levels/Level2.scn",
	'level3' : "res://Scenes/Levels/Level3.scn"
}
var finished_levels = {
	'level1' : false,
	'level2' : false,
	'level3' : false
}

func ProgressReset(): 
	finished_levels["level1"] = false
	finished_levels["level2"] = false
	finished_levels["level3"] = false
	score = 0

var is_player_flipped : bool = false
var score : int = 0
