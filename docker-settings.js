{
"docker-settings": [
    {
	"type": "directoryMap",
	"source": "$pwd/",
	"destination": "/home/emacs-user/docker-emacs-repo"
    },
    {
	"type": "directoryMap",
	"source": "$pwd/working-directory",
	"destination": "/home/emacs-user/source"
    },
    {
	"type": "directoryMap",
	"source": "$pwd/emacs-config/.emacs.d",
	"destination":"/home/emacs-user/.emacs.d"
    },
    {
	"type": "directoryMap",
	"source": "$HOME/Dropbox",
	"destination": "/home/emacs-user/Dropbox"
    },
    {
	"type": "directoryMap",
	"source": "$HOME/.ssh",
	"destination": "/home/emacs-user/.ssh"
    },
    {
	"type": "environmentVariable",
	"key": "DISPLAY",
	"value": "host.docker.internal:0.0"
    },
    {
	"type": "gitGlobalConfig",
	"key": "user.name",
	"value": "Jack Christopher Gammon"
    },
        {
	"type": "gitGlobalConfig",
	"key": "user.email",
	"value": "spiffyRAM@gmail.com"
    }
]
}
