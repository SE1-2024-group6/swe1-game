extends HSlider


@export
var bus_name: String

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	
func _on_value_changed(slider_value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(slider_value)
	)
	
	if bus_name == "sfx":
		Global.sfx_volume = slider_value
		
	if bus_name == "music":
		Global.music_volume = slider_value
		
	if bus_name == "Master":
		Global.master_volume = slider_value
		
	Utils.save_settings()
# NOTE: might need to use value instead of slider_value if this doesnt work, I was getting a caution message
# I went ahead and touched it up and it should be fine, but worth noting (Juan)
