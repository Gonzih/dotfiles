def get_deps package
  info = `pacman -Si #{package}`
  if info =~ /Depends On\s*:\s*(.*)$/
    $1.split.each { |dep| dep.sub! /\=.*$/, '' } || []
  end
end

begin
  `srcpac`
  system "sudo srcpac -Sy"
  upd_pac = `pacman -Qu`.lines.to_a
  upd_pac.each { |l| l.sub! /\s.*$/, '' }
  upd_pac.each { |l| l.chomp! }
  `touch ~/.arch_source_packages` unless File.exist? '~/.arch_source_packages'
  src_pac = `cat ~/.arch_source_packages`.lines.to_a
  src_command, src_dep_command = '', ''

  src_pac.each do |pkg|
    pkg.chomp!
    if pkg =~ /\+$/
      pkg.gsub! /\+$/, ''
      src_dep_command += "#{pkg} " if upd_pac.include? pkg
      get_deps(pkg).each do |dep|
        src_command += "#{dep} " if upd_pac.include? dep
      end
    else
      src_command += "#{pkg} " if upd_pac.include? pkg
    end
  end

  if src_dep_command.length > 0
    system "sudo srcpac -Subm #{src_dep_command}"
  end

  if src_command.length > 0
    system "sudo srcpac -Sub #{src_command}"
  end

  system "yaourt -Su --aur --noconfirm"
rescue Exception => ex
  puts ex.message
end
