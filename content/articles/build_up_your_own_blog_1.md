Title: Build Up Your Own Blog - Step by Step (1)
Date: 2021-07-25 14:04
Modified: 2021-08-04 17:05
Category: side project
Tags: pelican, python, git  
Slug: side-project-1
Authors: Jolene Yu


The website you are browsing is my first side project which leveraged a static site generator - Pelican. This blog is about  steps on how to install Pelican and some lesson-learned while I was building up mine site. [Here is the repo for this project](https://github.com/joleneyu/i-am-jolene)

Pelican is powered by python and requires no database or server-side logic which is easier for beginners.

### Before you start:

1. Have python, pip3, and git installed  
2. Choose a Pelican theme you like ([here is the one I used](https://github.com/nairobilug/pelican-alchemy))  
3. Create a new repository at GitHub or any other git repository management for this project. (Strongly recommend to use GitHub, because this tutorial has further steps for GitHub Pages and GitHub Actions) 

### When you are ready with the prerequisites, let's jump to how to kickstart a website.

Install pelican  
```html
$ pip3 install pelican
```
Install Markdown if you plan on using Markdown as a markup format
```html
$ pip3 install Markdown
```
Create a directory to house the site content and configuration files, which can be located any place you prefer
```html
$ mkdir ~/Desktop/yoursitename  
$ cd ~/Desktop/yoursitename
```
Run the pelican-quickstart command, which will ask some questions about your site (Those settings can be changed anytime after in the configuration file, so don't worry too much here!)
```html
$ pelican-quickstart
```
Follow the theme installtion instruction, which is avaiable in the GitHub repository README.md, and add the theme folder as a submodule
```html
$ mkdir themes  
$ git submodule add https://github.com/nairobilug/pelican-alchemy themes/pelican-alchemy
```
Now you are ready to generate and serve your site locally at [http://localhost:8000](http://localhost:8000)
```html
$ make devserver  
```
After this tutorial, you should see a locally served template site like this! Don't worry if your site is missing some images or menu settings, we can figure those things out later!  

Don't forget to use git to sync your local repository with the remote one. You can always find the old version if you messed up some settings later.   

<img alt="This one is just a literal element" src="{static}/images/default.png" data-action="zoom" width="100%">


### Lessons-Learned:  
1. The tutorial looks quite straight-forward, sometimes when I don't understand something 100%, I look for more information on google which is time-consuming. I advise trying it out first. Hit a command and see what the terminal says.

2. When you are not sure about some settings, make smaller changes instead of multiple changes at the same time. Make small changes, this makes identifying problems quicker.

3. Use .gitignore wisely. I'm using VS code as my code editor, and it shows when I have some uncommit/unstaged changes even if I didn't change anything. I found out .DS_Store was the problem, and it's safe to untrack this file. I saved a lot of effort for context switching after I put it to .gitignore.

4. Submodule is another repository from the site repository, it needs to sync seperately.

