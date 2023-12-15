#!/usr/bin/bash

# uncomment for debugging, otherwise leave commented out, we don't
# want to provide output from this script to users to confuse them
# set -x

# Generate passwd file based on current uid, needed for fedpkg
grep -v "^$(id -u)" /etc/passwd > "${HOME}/passwd"
printf "$(id -u):x:$(id -u):0:Sandcastle:${HOME}:/bin/bash\n" >> "${HOME}/passwd"
export LD_PRELOAD=libnss_wrapper.so
export NSS_WRAPPER_PASSWD="${HOME}/passwd"
export NSS_WRAPPER_GROUP=/etc/group
