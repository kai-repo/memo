# Prefix key settings
unbind C-b
set -g prefix C-g
bind C-g send-prefix

# Screen splitting
bind \\ split-window -h
bind - split-window -v

set -g display-panes-time 2000

setw -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
# Mac
bind-key -T copy-mode-vi 'y' send -X copy-selection

# Linux
# bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip -selection clipboard -in"

set -s escape-time 0

# vim-like pane switching
bind k select-pane -U
bind j select-pane -D
bind h select-pane -L
bind l select-pane -R

# vim-like pane resizing
bind -r C-k resize-pane -U 5
bind -r C-j resize-pane -D 5
bind -r C-h resize-pane -L 5
bind -r C-l resize-pane -R 5
