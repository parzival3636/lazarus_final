# Git Commit Guide - Push to New Repository

## 📋 Prerequisites

Before starting, make sure you have:
- Git installed on your system
- GitHub/GitLab account
- Created a new empty repository on GitHub/GitLab

## 🚀 Step-by-Step Instructions

### Step 1: Navigate to Project Directory

```bash
cd HM065_Lazarus
```

### Step 2: Check Git Status

```bash
# Check if git is already initialized
git status
```

If you see "not a git repository", initialize it:

```bash
git init
```

### Step 3: Check Current Remote (if any)

```bash
git remote -v
```

If there's an old remote, remove it:

```bash
git remote remove origin
```

### Step 4: Add All Changes

```bash
# Add all files
git add .

# Or add specific files/folders
git add backend/
git add frontend/
git add *.sql
git add *.md
```

### Step 5: Create Commit

```bash
git commit -m "feat: Add team assignment system with TalkJS chat and file sharing

Major Features:
- Enhanced application view with top 3 ranking and multi-select
- Complete team assignment workflow (create, assign, manage)
- TalkJS real-time chat integration for team communication
- File and link sharing system with sync across team members
- Navigation improvements for easy access
- Professional UI with gradients, badges, and icons

Technical Changes:
- Added team_assignment_views.py with full CRUD operations
- Created TalkJS chat component with proper message alignment
- Implemented FileSharing component with backend sync
- Fixed checkbox selection bug (added developer_id field)
- Added database schemas for teams and file sharing
- Updated navbar with team assignment links

Bug Fixes:
- Fixed checkbox selection affecting all items
- Fixed TalkJS container mounting issues
- Fixed FileSharing field name mismatches
- Added null checks to prevent crashes"
```

### Step 6: Add New Remote Repository

Replace `YOUR_USERNAME` and `YOUR_REPO_NAME` with your actual values:

```bash
# For GitHub
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Or for GitLab
git remote add origin https://gitlab.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Or for SSH (if you have SSH keys set up)
git remote add origin git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git
```

### Step 7: Verify Remote

```bash
git remote -v
```

You should see:
```
origin  https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git (fetch)
origin  https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git (push)
```

### Step 8: Push to New Repository

```bash
# Push to main branch
git push -u origin main

# Or if your default branch is master
git push -u origin master

# If you get an error about branch name, create and push main branch
git branch -M main
git push -u origin main
```

### Step 9: Verify on GitHub/GitLab

Go to your repository URL and verify all files are uploaded.

## 🔧 Troubleshooting

### Issue: "failed to push some refs"

```bash
# Pull first (if remote has README or other files)
git pull origin main --allow-unrelated-histories

# Then push again
git push -u origin main
```

### Issue: "Permission denied"

Make sure you're authenticated:

```bash
# For HTTPS, you'll be prompted for username/password
# For SSH, make sure your SSH key is added to GitHub/GitLab
```

### Issue: Large files error

If you have large files (>100MB), you might need Git LFS:

```bash
git lfs install
git lfs track "*.pkl"
git lfs track "*.safetensors"
git add .gitattributes
git commit -m "Add Git LFS tracking"
git push -u origin main
```

## 📝 Alternative: Create .gitignore First

Before committing, create a `.gitignore` file to exclude unnecessary files:

```bash
# Create .gitignore
cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
*.egg-info/
.env

# Node
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.pnpm-debug.log*
dist/
build/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Database
*.sqlite3
*.db

# Logs
*.log
EOF

# Then add and commit
git add .gitignore
git commit -m "Add .gitignore"
```

## 🎯 Quick Command Summary

```bash
# Full workflow
cd HM065_Lazarus
git init
git add .
git commit -m "feat: Add team assignment system with TalkJS chat and file sharing"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

## 📚 Additional Git Commands

### View commit history
```bash
git log --oneline
```

### Create a new branch
```bash
git checkout -b feature/new-feature
```

### Check what will be committed
```bash
git diff --cached
```

### Undo last commit (keep changes)
```bash
git reset --soft HEAD~1
```

## ✅ Verification Checklist

After pushing, verify:
- [ ] All source files are present
- [ ] Documentation files (.md) are uploaded
- [ ] SQL schema files are included
- [ ] Frontend and backend folders are complete
- [ ] No sensitive data (API keys, passwords) in commits
- [ ] .gitignore is working correctly
- [ ] README.md is visible on repository homepage

## 🔐 Security Note

Before committing, make sure to:
1. Remove any API keys or secrets from code
2. Check `.env` files are in `.gitignore`
3. Review `talkjs.config.js` - consider using environment variables
4. Check for any hardcoded passwords or tokens

## 📞 Need Help?

If you encounter issues:
1. Check Git documentation: https://git-scm.com/doc
2. GitHub guides: https://guides.github.com/
3. Stack Overflow: https://stackoverflow.com/questions/tagged/git

---

**Ready to commit!** Follow the steps above to push your code to the new repository.
