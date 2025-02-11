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













# rado notes
- use local folder as remote. 
- check out deleteme/{gittest,gitremote}