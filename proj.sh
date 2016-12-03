# Project folder manager
# https://git.io/proj-cli

# Change this if needed
PROJECTS_DIR=~/Projects/

# proj command
proj () {
  current=$(cut -d/ -f5 <<< "${PWD}")
  if [ $# -eq 0 ]; then
    cd $PROJECTS_DIR
  elif [ $1 == 'new' ] && [ $2 ]; then
    firstChar=$(echo $2 | head -c 1)
    if [ $firstChar == '-' ] || [ $firstChar == '_' ]; then
      mkdir "$PROJECTS_DIR$current$2" && proj "$current$2"
    else
      mkdir "$PROJECTS_DIR$2" && proj $2
    fi
  else
    firstChar=$(echo $1 | head -c 1)
    if [ $firstChar == '-' ] || [ $firstChar == '_' ]; then
      cd "$PROJECTS_DIR$current$1"
    else
      cd "$PROJECTS_DIR$1"
    fi
  fi
}

# Add command completion for proj command
if hash compdef 2>/dev/null; then
  _proj () { _files -W "$PROJECTS_DIR" -/; }
  compdef _proj proj
fi