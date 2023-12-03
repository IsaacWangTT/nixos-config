{
  programs.wlogout.style = ''
    * {
      font-family: "JetBrainsMono Nerd Font";
      font-size: 15px;
      font-weight: bold;
    }

    window {
      background-color: #1e1e2e;
    }

    button {
      background-size: 20%;
      border: 2px solid #6c7086;
      border-radius: 3rem;
      background-color: #313244;
      margin: 10px;
      color: #cdd6f4;
    }

    button:hover,
    button:focus {
      background-color: #89b4fa;
    }

    #lock {
      background-image: image(url("./icons/lock.png"));
    }

    #hibernate {
      background-image: image(url("./icons/hibernate.png"));
    }

    #logout {
      background-image: image(url("./icons/logout.png"));
    }

    #shutdown {
      background-image: image(url("./icons/shutdown.png"));
    }

    #suspend {
      background-image: image(url("./icons/suspend.png"));
    }

    #reboot {
      background-image: image(url("./icons/reboot.png"));
    }
  '';
}
