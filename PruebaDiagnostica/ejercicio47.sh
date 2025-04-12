#!/bin/bash
archivo="$1"

grep -v '^\s*#' "$archivo"
