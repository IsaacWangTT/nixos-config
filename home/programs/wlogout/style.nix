{
  programs.wlogout.style = ''
    window {
      font-family: "JetBrainsMono Nerd Font";
      font-size: 15px;
      color: #cdd6f4;
      background-color: rgba(30, 30, 46, 0.5);
    }

    button {
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
      border: none;
      background-color: rgba(30, 30, 46, 0);
      margin: 5px;
      transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
    }

    button:hover {
      background-color: rgba(49, 50, 68, 0.1);
    }

    button:focus {
      background-color: #cba6f7;
      color: #1e1e2e;
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
