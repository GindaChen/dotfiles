DEBIAN_FRONTEND=noninteractive apt-get install openssh-server -y;
mkdir -p ~/.ssh;
cd $_;
chmod 700 ~/.ssh;
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBDEH1+00FfY6d8ZmFIEqTw9ExbvnOpzuGmAAG1H4h6r juc049@ucsd.edu' > authorized_keys;
chmod 700 authorized_keys;
service ssh start;

