_: {
  security = {
    polkit = {
      enable = true;
      enablePkexecWrapper = true;
    };
    rtkit.enable = true;
    pam.loginLimits = [
      {
        domain = "*";
        type = "soft";
        item = "nofile";
        value = "8192";
      }
    ];
  };

  security.pam.services.ghost-shell = {
    unixAuth = true;

    fprintAuth = false;
    u2f.enable = false;
  };
}
