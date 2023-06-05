# 🕵️ Troubleshoot Virtual Machine Scale Sets
This README contains a collection of solutions for common troubleshooting scenarios that may arise when using Azure Virtual Machine Scale Sets.

## Permission denied (publickey)
- If you encounter the error message ```Permission denied (publickey)``` when attempting to log in, try **upgrading** the instance in your VM scale set.

## WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
- If you encounter the error message below when attempting to log in, try removing the IP address from the ```.ssh/known_hosts file```.
```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:4rTvTTS+OPtbS5679451wbbOr98sFeSddaRe+E2ZkM9.
Please contact your system administrator.
```

