#!/bin/bash
# generate-changelog.sh
# Generates CHANGELOG.md from git log (last 10 commits)

OUTPUT="CHANGELOG.md"
REPO_URL=$(git remote get-url origin 2>/dev/null | sed -e 's/\/\/[^@]*@/\/\//' -e 's/\.git$//')

echo "# Changelog" > "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Auto-generated from git history." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Group commits by type
for type in feat fix docs refactor chore; do
  COMMITS=$(git log --oneline --no-merges --format="%h %s" | grep "^.\{7\} ${type}:" | head -10)
  if [ -n "$COMMITS" ]; then
    echo "## ${type}" >> "$OUTPUT"
    while IFS= read -r line; do
      HASH=$(echo "$line" | cut -d' ' -f1)
      MSG=$(echo "$line" | cut -d' ' -f2-)
      if [ -n "$REPO_URL" ]; then
        echo "- [$MSG]($REPO_URL/commit/$HASH)" >> "$OUTPUT"
      else
        echo "- $MSG ($HASH)" >> "$OUTPUT"
      fi
    done <<< "$COMMITS"
    echo "" >> "$OUTPUT"
  fi
done

echo "✅ $OUTPUT updated."
