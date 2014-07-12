#!/usr/bin/env ruby -wKU
golden_ratio = (1 + Math.sqrt(5)) / 2
puts((golden_ratio ** 32 / Math.sqrt(5)).to_i)
