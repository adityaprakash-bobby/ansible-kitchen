# ansible-kitchen


#### Troubleshoot:

1. Ensure you have `ruby-dev` or `ruby-devel` packages installed.

2. If such an error occurs, perform the following:
```bash
gcc -I. -I/usr/include -I/usr/include/ruby/backward -I/usr/include -I.   -fPIC -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions
-fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -mtune=generic -fasynchronous-unwind-tables
-fstack-clash-protection -fcf-protection -fPIC -m64 -o bcrypt_pbkdf.o -c bcrypt_pbkdf.c
gcc: fatal error: cannot read spec file ‘/usr/lib/rpm/redhat/redhat-hardened-cc1’: No such file or directory
compilation terminated.
```
**Solution** : `sudo dnf install redhat-rpm-config`