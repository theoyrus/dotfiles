# Enable TMUX Server Persistent Session

```
stow tmux
```

Then get plugin downloaded to `'~/.tmux/plugins` directory. 
And execute this command with general user, **Remember** don't use root!
```
systemctl --user start tmux-server.service
```
Check the service is running or not with
```
systemctl --user status tmux-server.service
```

Yes, now you can use tmux session persistent when ssh closed and relogin.