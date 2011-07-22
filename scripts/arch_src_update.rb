class Updater

  def get_deps package
    info = `pacman -Si #{package}`
    if info =~ /Depends On\s*:\s*(.*)$/
      $1.split.each { |dep| dep.sub! /\=.*$/, '' } || []
    end
  end

  def add_pkg? pkg
    @upd_pac.include?(pkg) && !@src_array.include?(pkg) && !@src_dep_array.include?(pkg)
  end

  def initialize
    `srcpac`
    @src_array, @src_dep_array, @upd_pac, @src_pac = [], [], [], []
    system "sudo srcpac -Sy"
    @upd_pac = `pacman -Qu`.lines.to_a
    @upd_pac.each { |l| l.sub! /\s.*$/, '' }
    @upd_pac.each { |l| l.chomp! }
    `touch ~/.arch_source_packages` unless File.exist? '~/.arch_source_packages'
    @src_pac = `cat ~/.arch_source_packages`.lines.to_a

    @src_pac.each do |pkg|
      pkg.chomp!

      if pkg =~ /\+$/
        pkg.gsub! /\+$/, ''
        @src_dep_array << pkg if add_pkg? pkg
      else
        @src_array << pkg if add_pkg? pkg
      end

      get_deps(pkg).each do |dep|
        @src_array << dep if add_pkg? dep
      end
    end

    if @src_dep_array.count > 0
      system "sudo srcpac -Subm #{@src_dep_array.join ' '} --noconfirm"
    end

    if @src_array.count > 0
      system "sudo srcpac -Sub #{@src_array.join ' '} --noconfirm"
    end

    system "yaourt -Su --aur --noconfirm"
  end
end

Updater.new
#TODO dont duplicate packages in deps and normal build (builds with deps and after that builds from config file)
