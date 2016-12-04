# proj-cli

A command line tool for managing your project folders.

## Why

When you work on multiple projects, it's tedious typing `cd ~/Projects/my-app` all the time. Why not have a single `proj` command that handles opening project folders and more?

## Installation

Copy the following alias into your `~/.bashrc` or `~/.zshrc` file. Make sure to update `PROJECTS_DIR` if needed.

```bash
# Projects folder manager https://git.io/proj-cli
PROJECTS_DIR=~/Projects/
proj () { current=$(cut -d/ -f5 <<< "${PWD}");if [ $# -eq 0 ];then cd $PROJECTS_DIR;elif [ $1 == 'new' ] && [ $2 ];then firstChar=$(echo $2 | head -c 1);if [ $firstChar == '-' ] || [ $firstChar == '_' ];then mkdir "$PROJECTS_DIR$current$2" && proj "$current$2";else mkdir "$PROJECTS_DIR$2" && proj $2;fi;else firstChar=$(echo $1 | head -c 1);if [ $firstChar == '-' ] || [ $firstChar == '_' ];then cd "$PROJECTS_DIR$current$1";else cd "$PROJECTS_DIR$1";fi;fi;};if hash compdef 2>/dev/null;then _proj () { _files -W "$PROJECTS_DIR" -/;};compdef _proj proj;fi
```

Once added, simply open a new terminal window and the `proj` command should now be available.

## Usage

Here are the available commands and how to use them.

**Note**: Tab completion is only available in Zsh. I recommend installing [Oh My Zsh](http://ohmyz.sh/).

### `proj`

Goes to your projects folder. Try typing a space and then press Tab to list all of your projects.

### `proj my-app`

Goes to the `my-app` folder in your projects folder. Try pressing Tab to autocomplete the project name.

Also, if you have related projects like `my-app` and `my-app-api`, you can omit typing the prefix. For example, if you're currently in the `my-app` folder, instead of typing `proj my-app-api` you can type `proj -api` instead. This only works for projects separated by a dash or underscore.

### `proj new my-app-v2`

Creates the `my-app-v2` folder in your projects folder, and immediately goes to it.

You can omit the prefix here as well. For example, if you're in the `my-app` folder, you can run `proj new -v2` to create the `my-app-v2` folder.

## Compatibility

A Unix-like environment is required (Mac or Linux).

## Roadmap

- Turn this into an installable global package (probably via npm).
- Add Git shortcuts (e.g. `proj clone gh:user/repo`).
- Make a website.