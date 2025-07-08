_: {
  home.file.".ssh/allowed_signers".text = "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMbeK/pYB1KBpBCZIUIR+uY6/nnoV+lBgUPzhZsqdY5x";

  programs.git.extraConfig = {
    commit.gpgsign = true;
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    gpg.format = "ssh";
    user.signingkey = "~/.ssh/key.pub";
  };
}
