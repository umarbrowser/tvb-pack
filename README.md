# tvb-pack

This is a super repo that brings together several Git repos of TVB,
intended to make it easier to get started with TVB.

## Usage

There are two usage scenarios: 1) use only the official repos for
TVB 2) use your own forks of those repos. 

In the first case, you should fork this repo and clone it, e.g.
(replace `user` by your GitHub username):

```bash
git clone git@github.com:user/tvb-pack tvb
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
```

Be patient, in some cases the repos are quite large.

In the second case, you'll need to additionally, for each repo 
where you have your own fork, modify the .gitsubmodules file correctly
*just after* cloning `tvb-pack` and 
*before* performing the `submodule` commands in the listing above.

## Contents


