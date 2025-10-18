Find and complete tasks from the project's todo.md file. This command searches for tasks with or without checkboxes, adds checkboxes where missing, and works through them systematically.

## Steps:
1. Check if todo.md exists in the current directory
2. Find all tasks (both with and without checkboxes)
3. Add checkboxes to tasks that don't have them
4. Work through each unchecked task to complete it
5. Update the todo.md file to mark completed tasks as checked

First, let's check for todo.md and analyze all tasks:
```bash
if [ -f "todo.md" ]; then
  echo "Found todo.md file"
  echo "=== Current tasks ==="
  cat todo.md
  echo ""
  echo "=== Tasks without checkboxes ==="
  grep -n "^- \|^* \|^1\. \|^2\. \|^3\. \|^4\. \|^5\. \|^6\. \|^7\. \|^8\. \|^9\. " todo.md | grep -v "\[ \]" | grep -v "\[x\]" || echo "No tasks without checkboxes found"
  echo ""
  echo "=== Unchecked tasks ==="
  grep -n "\[ \]" todo.md || echo "No unchecked tasks found"
else
  echo "No todo.md file found in current directory"
fi
```

If tasks exist without checkboxes, I'll first add checkboxes to them. Then I'll work through all unchecked tasks systematically. Each task will be:
1. Analyzed to understand what needs to be done
2. Completed using the appropriate tools
3. Marked as completed in the todo.md file (changing [ ] to [x])

Let me read the todo.md file to see what tasks need completion or checkbox addition:
```bash
cat todo.md
```