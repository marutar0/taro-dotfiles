# ------------------------------------------------------------------------
# ghqのパスにあるリポジトリを選択
# ------------------------------------------------------------------------
function repository-select () {
  local mode=$1
  local selected_dir=$(ghq list | peco)
  if [ -n "$selected_dir" ]; then
    if [ "$mode" = "change" ]; then
      echo "cd ${selected_dir}"
      cd $GHQ_PATH/${selected_dir}
    fi
    if [ "$mode" = "open" ]; then
      echo "open ${selected_dir}"
      code $GHQ_PATH/${selected_dir}
    fi
    if [ "$mode" = "opencontainer" ]; then
      echo "devcontainer open ${selected_dir}"
      devcontainer open $GHQ_PATH/${selected_dir}
    fi
  fi
}