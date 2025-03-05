extends Node
class_name FSM
#credit Bitlytic for FSM implementation

var states = {}
var initial_state: State
var state_cur: State

func ChangeState(next_state_str: String):
	if state_cur:
		state_cur.Exit()
	var next_state = states.get(next_state_str)
	state_cur = next_state
	if state_cur:
		state_cur.Enter()

func _ready():
	if get_children().size() < 1:
		printerr("Found no children in FSM")
	for state:State in get_children():
		states[state.name] = state
		state.changed.connect(ChangeState)
	if initial_state:
		ChangeState(initial_state.name)

func _process(delta):
	if state_cur:
		state_cur.Update(delta)
