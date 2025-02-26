# Git presentation

In this presentation I want to share an intuition for how git works.

I want you to be able to visualize how the tree "grows" while you create `commits`, and changes when you `merge`, or even `reset` and `rebase`.

![most git users do not understand git, and just delete the repo and clone again when they get stuck](https://imgs.xkcd.com/comics/git.png)

## The basics

an empty tree:
```sh
git init
```

create a file:
```sh
echo "# Title" >> readme.md
```

the staging area:
```sh
git add readme.md
```
At this point git now has an idea of the contents of the file named `readme.md`.


a node:
```sh
git commit -m "first commit"
```

### Lets talk about the commit

Contents of a commit:
    
> <span style="color: yellow;">commit 0b21e560f5c5fdc844d5b916072e70cada58d583 (</span><span style="color: #66f;">**HEAD**</span> -> <span style="color: green;">**main**</span><span style="color: yellow;">)</span>  
> <span style="color: green;">Author: only1thor &lt;&gt;</span>  
> <span style="color: #66f;">Date: Thu Feb 20 10:07:33 2025 +0100</span>
> 
>>    legger til første linje
> 
> **diff --git a/Readme.md b/Readme.md**  
> **index cf8977e..d6b9466 100644**  
> **--- a/Readme.md**  
> **+++ b/Readme.md**  
> <span style="color: #66f;">@@ -1 +1,3 @@</span>  
> <span> # Tittel</span>  
> <span style="color: green;">+</span>  
> <span style="color: green;">+linje 1</span>






<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



# rado notes
- use local folder as remote. 
- check out deleteme/{gittest,gitremote}