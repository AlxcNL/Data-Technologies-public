## Install

### Manjaro

#### Update pacman
```bash
sudo pacman -Syu 
sudo pacman -S --needed base-devel git
```

#### Install mongodb
```bash
pamac build mongodb-bin
pamac build mongodb-tools-bin
pamac build mongodb-compass
```

## Service commands
```bash
sudo systemctl start mongodb
sudo systemctl stop mongodb
sudo systemctl enable mongodb
```

## Commands
```sh
db.sentences.createIndex( { fr: "text", nl: "text" } )
db.sentences.find( { $text: { $search: "\"est\"" } } )
db.lyrics.createIndex( { fr: "text" } )
db.lyrics.find( { $text: { $search: "ans" } } )
```

## References
(https://www.geeksforgeeks.org/how-to-install-mongodb-on-arch-based-linux-distributionsmanjaro/)<br>
(https://aur.archlinux.org/packages/mongodb-compass)<br>
https://gist.github.com/litanur/eec8ff295ff7d616626cd8a6c0d2659e<br>
(https://kamisu66.com/2022/07/24/How-to-install-mongoDB-on-Arch-Linux-Manjaro/#%E2%91%A1-Install-mongosh-bin-Dependency)<br>