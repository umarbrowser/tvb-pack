# tvb-pack

This is a super repo that brings together several Git repos of TVB,
intended to make it easier to get started with TVB.

## Usage

### Set up

There are two usage scenarios: 1) use only the official repos for
TVB 2) use your own forks of those repos. 

In the first case, you should fork this repo and clone it, e.g.
(replace `user` by your GitHub username):

```bash
git clone git@github.com:user/tvb-pack tvb
git submodule init
git submodule update
```

Be patient, in some cases the repos are quite large.

In the second case, you'll need to additionally, for each repo 
where you have your own fork, modify the `.gitmodules` file correctly
*just after* cloning `tvb-pack` and 
*before* performing the `submodule` commands in the listing above.

In case you have your own forks of each of the submodules, running

```
scripts/update-origins.sh username
```

will handle updating `.gitmodules` correctly. 

If the subsequent `git submodule update` produces errors like 

```
fatal: reference is not a tree: 03dc58f782c7ac4fe65cecbb9d459e95d8efff2c
Unable to checkout '03dc58f782c7ac4fe65cecbb9d459e95d8efff2c' in submodule path 'matlab'
```

then you'll need to update your forks from upstream and then re-run 
`git submodule update`.

Additionally, if you wish to have access to the upstream repo, i.e.
(`the-virtual-brain/tvb-*`) you'll need to add this explicitly in
the submodule. 

Lastly, if you merge from `upstream/tvb-pack`, you may have to update
`.gitsubmodules` to reflect your forks. We'll setup a script to make 
this easier.

### Virtual environments

Create a TVB-ready virtual environment with all the necessary packages with 

```
scripts/mkenv.sh my_env_path
```

Then, in order to activate it and place each of the submodule's contents in the
Python path

```
source scripts/env.sh my_env_path
```


## The submodule workflow

When you modify files tracked by the `tvb-pack` repo, use Git as
per usual. If you make changes to a submodule, you'll need to `cd`
into the submodule, Git your changes with respect to the submodule's
repository, `cd` up to the `tvb-pack` directory and update `tvb-pack`'s 
version of the submodule.

More details can be found at the Git SCM book's [description of 
Git submodules](http://git-scm.com/book/en/Git-Tools-Submodules).
