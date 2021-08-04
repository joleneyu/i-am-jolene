Title: Side Project - Build Personal Blog I
Date: 2021-07-26 14:04
Modified: 2021-08-04 17:05
Category: Build up your own blog
Tags: pelican, python, git
Slug: side-project-1
Authors: Jolene Yu


The website you are browsing at is my first side project which leveraged with static site generator - Pelican. This blog is about initial steps of how to install Pelican and some lesson-learned while I was building up mine.

Pelican is powered by python and requires no database or server-side logic which is easier for beginners.

### Before start:

1. Get python, pip3, git installed  
2. Choose a Pelican theme you like (here is the one I used https://github.com/nairobilug/pelican-alchemy)  
3. Create a new repository at GitHub or any other git repository management for this project. (Strongly recommend to use GitHub, because this tutorial has further setups for GitHub Pages and GitHub Actions) 

### When you are ready with these prerequisites, let's jump to how to kickstart a website.

1. Install pelican  
>$ pip install pelican

2. Install Markdown if you plan on using Markdown as a markup format
>$ pip install Markdown

3. Create a directory to house the site content and configuration files, which can be located any place you prefer
>$ mkdir ~/Desktop/yoursitename  
>$ cd ~/Desktop/yoursitename

4. Run the pelican-quickstart command, which will ask some questions about your site (Those settings can be changed anytime after in the configuration file, so don't worry too much here!)
>$ pelican-quickstart

5. Follow the theme installtion instruction, which is avaiable in the GitHub repository README.md, and add the theme folder as a submodule
>$ mkdir themes  
>$ git submodule add https://github.com/nairobilug/pelican-alchemy themes/pelican-alchemy

6. Now you are ready to generate and serve your site locally at http://localhost:8000
>$ make devserver  

After this tutorial, you should see a locally served template site like this! Don't worry if your site is missing some images or menu settings, we can figure those things out later!  

Don't forget to use git to snyc your local repository with remote one. You can always fall back to the old version if you messed up some settings later.   

<img alt="This one is just a literal element" src="{static}/images/default.png" data-action="zoom" width="100%">


### Lesson-Learned Time:  
1. The tutorial looks quite straight-forward, but sometimes when I don't understand something 100%, I choose to look for more information on google which is time-consuming. I advise just to try it out. Hit a command and see what terminal says.

2. When you are not sure about some setting, make smaller changes instead of multiple changes at same time. Make steps smaller, make identify problems quicker.

3. Use .gitignore wisely. I'm using VS code as my code editor, and it showed I have some uncommit/unstaged changes even if I didn't change anything. I found out .DS_Store was the problem. It's safe to untrack this file. I saved a lot of effort for context switching after I put it to .gitignore.

4. Submoudle is another repository from the site repository, it needs to sync seperately.

