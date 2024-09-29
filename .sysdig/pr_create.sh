#!/bin/bash
set -o pipefail

input_file="$1"
token="$2"

gh auth login --with-token <<<"$token"

pull_number=$(jq --raw-output .pull_request.number "$GITHUB_EVENT_PATH")
comment=$(cat <<EOF
This PR has triggered the rules:

$(jq .output "$input_file" | sort | uniq )


Please review the alerts generated by Falco [Falco](https://falco.org) to understand the behaviour of each trigger on the json below:

\`\`\`
$(cat "$input_file")
\`\`\`
EOF
)

comment=${comment:0:65536}
gh pr comment $pull_number -b "$comment"