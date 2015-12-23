
(error
 :msg
"
Error: Cowardly refusing to `sudo brew install`
You can use brew with sudo, but only if the brew executable is owned by root.
However, this is both not recommended and completely unsupported so do so at
"
 :cmd
"sudo brew install"
 :solve
"
sudo chown -R root /usr/local
# これだけでよさそう？
sudo chown root /usr/local/bin/brew
")
