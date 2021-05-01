local ActorInventory = require "engine.interface.ActorInventory"

ActorInventory.equipdolls.gnolemdolly = { w=48, h=48, itemframe="ui/equipdoll/itemframe48.png", itemframe_sel="ui/equipdoll/itemframe-sel48.png", ix=3, iy=3, iw=42, ih=42, doll_x=116, doll_y=168+64, doll_w=128, doll_h=128,
	list={
		MAINHAND = {{weight=1, x=48, y=120, subshift="left"}},
		OFFHAND = {{weight=2, x=48, y=192, subshift="left"}},
		BODY = {{weight=4, x=48, y=264, subshift="left"}},
		GEM = {{weight=5, x=48, y=408, subshift="left"}, {weight=6, x=124, y=408, text="bottom", subshift="left"}},
		LITE = {{weight=7, x=188, y=408, subshift="right"}},
		TOOL = {{weight=8, x=264, y=408, subshift="right", text="bottom"}},
		FEET = {{weight=9, x=264, y=336}},
		BELT = {{weight=10, x=264, y=264}},
		HANDS = {{weight=11, x=264, y=192}},
		CLOAK = {{weight=12, x=264, y=120}},
		HEAD = {{weight=13, x=150, y=35, subshift="left", text="bottom"}},
}}