data = `pacman -Qu`
puts data.lines.count > 0 ? "#{data.lines.count} package#{data.lines.count > 1 ? 's' : nil}" : "System is up-to-date"
