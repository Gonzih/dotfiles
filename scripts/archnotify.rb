data = `pacman -Qu`
puts data.lines.count > 0 ? "#{data.lines.count} packages" : "System is up-to-date"
