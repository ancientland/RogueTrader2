// Events are sent to the program by the computer.
// Always include a parent call when overriding an event.

/// Called when the ID card is removed from computer. ID is removed AFTER this proc.
/datum/computer_file/program/proc/event_idremoved(background)

/// Called when the cogitator fails due to power loss. Override when program wants to specifically react to power loss.
/datum/computer_file/program/proc/event_powerfailure(background)

/// Called when the network connectivity fails. Cogitator does necessary checks and only calls this when requires_ntnet_feature and similar variables are not met.
/datum/computer_file/program/proc/event_networkfailure(background)
	if(!computer)
		return
	computer.kill_program_remote(src, TRUE)
	if(background)
		computer.visible_error("Network connectivity lost - process [filename].[filetype] (PID [rand(100,999)]) terminated.")
	else
		computer.visible_error("FATAL NETWORK ERROR - NTNet connection lost. Please try again later. If problem persists, please contact your local mechanicum.")
		computer.update_host_icon()
