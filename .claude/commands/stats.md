Show project statistics including file counts, git info, and recent activity.

## Steps:
1. Count total files in the project
2. Show git status and recent commits
3. Display file type breakdown

Count files and show git status:
```bash
find . -type f | wc -l
git status --short
git log --oneline -5
```

Show file type breakdown:
```bash
find . -type f | sed 's/.*\.//' | sort | uniq -c | sort -nr | head -10
```