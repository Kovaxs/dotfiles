# Only run on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # needed for brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi


. "$HOME/.local/bin/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kovaxs/.lmstudio/bin"
# End of LM Studio CLI section

