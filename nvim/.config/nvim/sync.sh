#!/usr/bin/sh
# Sync packer's packages and recompile 

#mkdir -p $CONFIG/undo $CONFIG/spell $CONFIG/autoload
rm -rf $XDG_CONFIG_HOME/nvim/lua
nvim +"au User PackerComplete qa" +PackerSync # +"silent TSUpdateSync"
