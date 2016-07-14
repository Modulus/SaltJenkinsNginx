#What is this crap?
1. Saltstack setup with vagrant.
2. Consist of one saltstack master and two minions.

##What the hell is saltstack???!
Go here to figure this out: [saltstacks official documentation](https://docs.saltstack.com)

###How do i run this monstrosity
1. Clone this repo using https ie: "git clone https://github.com/Modulus/SaltJenkinsNginx.git"
2. Change (cd) into the recently cloned repo
3. Run "vagrant up"
4. Run "vagrant ssh master"

####Saltstates
Run sudo salt "\*" state.highstate to apply all states to minions/master

#####Something failed
First try rerunning the highstate form the last section. If this fails then...

If you get an error installing salt, you might have dns problems with your vagrant box_version
Try this: https://github.com/vagrant-landrush/landrush

---
TODO: Restart docker and jenkins for docker stuff to kickin
