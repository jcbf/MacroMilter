  #!/bin/bash
  sudo chmod +x /home/travis/build/sbidy/MacroMilter/travis/readmail.py
  sudo echo "test: |/home/travis/build/sbidy/MacroMilter/travis/readmail.py" >> /etc/aliases
  sudo newaliases
  sudo cat /etc/aliases
