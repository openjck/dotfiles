# Automatically start Zellij.
#
# See the following for more information:
# https://zellij.dev/documentation/integration.html#bash
eval "$(zellij setup --generate-auto-start bash)"

# Set up Zellij completion.
eval "$(zellij setup --generate-completion bash)"
