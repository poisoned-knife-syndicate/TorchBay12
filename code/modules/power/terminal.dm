// the underfloor wiring terminal for the APC
// autogenerated when an APC is placed
// all conduit connects go to this object instead of the APC
// using this solves the problem of having the APC in a wall yet also inside an area

/obj/machinery/power/terminal
	name = "terminal"
	icon = 'icons/obj/machines/apc.dmi'
	icon_state = "term"
	desc = "It's an underfloor wiring terminal for power equipment."
	level = ATOM_LEVEL_UNDER_TILE
	layer = ABOVE_EXPOSED_WIRE_LAYER
	var/obj/item/stock_parts/power/terminal/master
	anchored = TRUE

/obj/machinery/power/terminal/New()
	..()
	var/turf/T = src.loc
	if(level==ATOM_LEVEL_UNDER_TILE) hide(!T.is_plating())
	return

/obj/machinery/power/terminal/proc/master_machine()
	var/obj/machinery/machine = master && master.loc
	if(istype(machine))
		return machine

/obj/machinery/power/terminal/hide(do_hide)
	if(do_hide && level == ATOM_LEVEL_UNDER_TILE)
		layer = WIRE_TERMINAL_LAYER
	else
		reset_plane_and_layer()

/obj/machinery/power/terminal/connect_to_network()
	. = ..()
	var/obj/machinery/machine = master_machine()
	if(machine)
		machine.power_change()

/obj/machinery/power/terminal/disconnect_from_network()
	. = ..()
	var/obj/machinery/machine = master_machine()
	if(machine)
		machine.power_change()
