#!/usr/bin/env bash
#  ╔═╗╔╦╗╦╦  ╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║╣ ║║║║║  ║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╩ ╩╩╩═╝╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Emilia
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 40
		bspc config bottom_padding 1
		bspc config normal_border_color "#414868"
		bspc config active_border_color "#c0caf5"
		bspc config focused_border_color "#bb9af7"
		bspc config presel_feedback_color "#7aa2f7"
		bspc config left_padding 1
		bspc config right_padding 1
		bspc config window_gap 5
}

# Launch the bar
launch_bars() {
		polybar -q emi-bar -c "${rice_dir}"/config.ini &
}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
launch_bars
