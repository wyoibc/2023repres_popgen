# Introduction to Git & Github

# UNDER DEVELOPMENT


July 20, 2023

[Home](https://github.com/wyoibc/2023repres_popgen)

<br>


## Table of Contents

- [Overview](#Overview)
- [Create a Github account and repository](#Create-a-Github-account-and-repository)
- [Configuring Github on Beartooth](#Configuring-Github-on-Beartooth)
- [Git on Beartooth](#Git-on-Beartooth)



<br><br><br>
<br><br><br>


## Overview

[Git](https://git-scm.com/) is the most widely used version control system. Git tracks changes to files (including code scripts) and allows you to revert to older versions of files if necessary. This means that as you are working on code, you don't need to make and keep multiple versions of the same script in case any new changes break your pipeline. Having a single file with tracked changes is much easier than trying to keep track of multiple different versions of the same file or trying to remember to remember which of `script_v8_FIXED.R` or `script_v8_FINAL.R` is the correct script with your most recent edits.

[Github](https://github.com/) is the most commonly used Git repository hosting service (you can see a comparison of some others [here](https://www.git-tower.com/blog/git-hosting-services-compared/)). Github allows Git users to easily access their code from anywhere, share and collaborate on projects, and host websites. The tutorials for this workshop are all hosted in a Github repository, as you've likely already noticed.

I use Git + Github for code for all of my research papers, both to keep the code tracked and to share the code when publishing manuscripts. E.g., a paper I published in early 2023 links to [this Github repo](https://github.com/seanharrington256/Lgetula_gbs) so that anyone can see my code and replicate my analyses.



* Git is completely free and open source, Github is a for-profit company, and some features of Github can require a paid account. Most academic users will be able to get by with a free Github account without any issues.

<br>
<br>

## Create a Github account and repository

We'll start by creating a repository on Github. If you don't already have a Github account, go to [Github](https://github.com/), click `Sign up` in the upper right, create an account. If you already have an account, sign in. Once signed in, click on the `+` button in the upper right:


<img src="images/create_button_github.png" width="50%"/>

and then `New repository`. This should open a page that looks like this:

<img src="images/github_new_repo.png" width="70%"/>


In "Repository name" enter 2023popgen. This will obviously be the name of the repository, but will also be part of the web address to the Github page for the repository as well as the name of the directory for the git repository when you clone it to your own computer, Beartooth, or another server.

In Description, you can enter something like Repo for 2023 Popgen workshop. This should be relatively brief, more detail about the repository and files it contains will go into the Readme file. 

Below Description, you can select whether to make the repository public or private. If the repository contains files and code that you want to be made available to anyone, you should keep it public (e.g., code that accompanies a paper you've published). Private repositories are used if you have code that is proprietary or if you don't want others to know what you are working on. You can switch repositories between private and public after creation, so you can keep a repository private while working on analyses and then make it public for review and publication if you like.


We can leave the rest of the options at defaults and click `Create repository`. You should now have an empty Github repository. We’ll use Git on Beartooth to add the contents of this repository.



<br>
<br>

## Configuring Github on Beartooth

We need to do some work to link Beartooth to your Github account.

To start, you will need to make sure that you own and can access your `~/.ssh` directory, if you do not, you will need to email ARCC ([arcc-info@uwyo.edu](mailto:arcchelp@uwyo.edu)) and have them transfer ownership of that directory to you. You can check the ownership by running `ls -ld ~/.ssh`. You should see a series of letters and a number followed by your username twice if you own the directory or followed by `root` twice if the directory is owned by root. If you own the directory, you’re good to continue on.

You need to start by generating an ssh key pair that will allow our computer (or Beartooth in this case) to securely interact with Github. You can read more about ssh keys [here](https://wiki.archlinux.org/title/SSH_keys), we won't get into any details about them. To create the ssh key pair, run the following:

```
ssh-keygen -t rsa
```

It will ask where you want to create the file, with a default of `.ssh/id_rsa` within your home directory. Just hit enter without entering any text and the key will be created there.

Then it will ask you for a passphrase, which you can leave empty by just hitting enter both times when prompted. I’m not using a passphrase here, but you can if you want, just make sure to remember it, as you’ll be asked for it when you use the key.

Now we need to go copy the public key so that we can associate it with out Github account. I use `less ~/.ssh/id_rsa.pub` to look at the key and copy it (`q` quits less). Make sure you’re copying the **public key**, ending in .pub, not the private key.

On Github, in the top right click on the circle icon and go to `Settings`

<img src="images/github_settings.png" width="70%"/>


then on the left side of the page that takes you to, select `SSH and GPG keys`

<img src="images/Github_ssh_key_button.png" width="70%"/>

then click on `New SSH key`

<img src="images/new_key.png" width="70%"/>


Copy your public key into the `key` box and give it an informative title to differentiate it from other keys you may add from your own or other computers, then click `Add SSH key`. The key is now added to Github.




<br>
<br>


## Git on Beartooth



Now that Github is set up, we'll start using Git on Beartooth. Git is already installed on Beartooth and should also come installed on Mac and Linux operating systems, but will [need to be installed on Windows](https://gitforwindows.org/) (unless this has changed recently, which is possible).






<br>
<br>

## Notes during development

Mention google drive as an option for writing papers, etc.



<br><br><br>
<br><br><br>


[Home](https://github.com/wyoibc/2023repres_popgen)

<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>

