{
  neofetch = ''
    print_info()
    {
      info "$(color 7)  " distro
      info "$(color 3)  " kernel
      info "$(color 2)  " packages
      info "$(color 9)  " shell
      info "$(color 10)  " de
      info "$(color 1)  " term
      info "$(color 11) 󰍛 " memory
      # info cols
    }
    os_arch="off"
    uptime_shorthand="tiny"
    shell_version="off"
    cpu_speed="off"
    cpu_cores="off"
    gtk_shorthand="on"
    separator=" •"
    ascii_distro="nixos_small"
    ascii_colors=(4 6 7 12 14 15)
  '';
}
