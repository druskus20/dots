#!/bin/sh

## Clean the lsp log file retaining the last 1000 lines

LSP_LOG_DIR=~/.local/state/nvim/lsp.log
tail -n 1000 $LSP_LOG_DIR > $LSP_LOG_DIR.tmp && mv $LSP_LOG_DIR.tmp $LSP_LOG_DIR 

