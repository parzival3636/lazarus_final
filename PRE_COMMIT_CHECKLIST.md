# Pre-Commit Checklist ✅

Before pushing to your new repository, please verify the following:

## 🔐 Security Check

- [ ] **Remove sensitive data**
  - [ ] Check `.env` files are in `.gitignore`
  - [ ] No API keys in code (Supabase keys, TalkJS App ID should be in config)
  - [ ] No passwords or tokens hardcoded
  - [ ] No personal information in commits

- [ ] **Review configuration files**
  - [ ] `backend/.env` is NOT committed (should be in .gitignore)
  - [ ] `frontend/src/config/talkjs.config.js` - Consider using env variables
  - [ ] Database credentials are secure

## 📁 Files to Include

- [ ] **Backend files**
  - [ ] All Python source files
  - [ ] `requirements.txt`
  - [ ] Django settings (without secrets)
  - [ ] Migration files
  - [ ] ML model files (if not too large)

- [ ] **Frontend files**
  - [ ] All React components
  - [ ] CSS files
  - [ ] `package.json` and `package-lock.json`
  - [ ] Configuration files
  - [ ] Public assets

- [ ] **Documentation**
  - [ ] README.md (or README_NEW.md renamed to README.md)
  - [ ] COMMIT_SUMMARY.md
  - [ ] GIT_COMMIT_GUIDE.md
  - [ ] All feature documentation (.md files)

- [ ] **Database schemas**
  - [ ] SUPABASE_SCHEMA.sql
  - [ ] TEAM_ASSIGNMENT_SCHEMA.sql
  - [ ] FILE_SHARING_SCHEMA.sql

- [ ] **Configuration**
  - [ ] .gitignore file
  - [ ] .gitattributes (if using Git LFS)

## 🚫 Files to Exclude (via .gitignore)

- [ ] **Python**
  - [ ] `__pycache__/` directories
  - [ ] `*.pyc` files
  - [ ] `venv/` or `env/` directories
  - [ ] `.env` files
  - [ ] `db.sqlite3`

- [ ] **Node.js**
  - [ ] `node_modules/` directory
  - [ ] `dist/` or `build/` directories
  - [ ] `.env.local` files

- [ ] **IDE**
  - [ ] `.vscode/` (except extensions.json if needed)
  - [ ] `.idea/`
  - [ ] `*.swp`, `*.swo` files

- [ ] **OS**
  - [ ] `.DS_Store` (Mac)
  - [ ] `Thumbs.db` (Windows)

## 🧪 Testing

- [ ] **Backend tests**
  - [ ] Run `python manage.py test`
  - [ ] All tests passing

- [ ] **Frontend tests**
  - [ ] Run `npm run build` to check for errors
  - [ ] No console errors in browser

- [ ] **Features working**
  - [ ] Application ranking displays correctly
  - [ ] Team creation works
  - [ ] TalkJS chat loads and sends messages
  - [ ] File sharing uploads and displays files
  - [ ] Navigation links work

## 📝 Documentation

- [ ] **README is complete**
  - [ ] Installation instructions
  - [ ] Configuration steps
  - [ ] Usage examples
  - [ ] API documentation
  - [ ] Tech stack listed

- [ ] **Comments in code**
  - [ ] Complex logic is commented
  - [ ] API endpoints documented
  - [ ] Component props documented

## 🔧 Configuration

- [ ] **Environment setup documented**
  - [ ] Backend .env template provided
  - [ ] Frontend config instructions clear
  - [ ] Database setup steps included

- [ ] **Dependencies listed**
  - [ ] `requirements.txt` is up to date
  - [ ] `package.json` includes all dependencies
  - [ ] Version numbers specified

## 🎯 Git Preparation

- [ ] **Repository ready**
  - [ ] New repository created on GitHub/GitLab
  - [ ] Repository URL copied
  - [ ] Access permissions set

- [ ] **Git configured**
  - [ ] Git username set: `git config user.name "Your Name"`
  - [ ] Git email set: `git config user.email "your@email.com"`

- [ ] **Commit message prepared**
  - [ ] Clear and descriptive
  - [ ] Follows conventional commits format
  - [ ] Lists major features

## 📊 File Size Check

- [ ] **Large files identified**
  - [ ] ML models (*.pkl, *.safetensors) - Consider Git LFS if >100MB
  - [ ] Video files (*.mp4) - Consider external hosting
  - [ ] Database files - Should be in .gitignore

- [ ] **Git LFS setup** (if needed)
  - [ ] `git lfs install`
  - [ ] Track large files: `git lfs track "*.pkl"`
  - [ ] `.gitattributes` committed

## 🚀 Final Steps

- [ ] **Review changes**
  - [ ] Run `git status` to see what will be committed
  - [ ] Run `git diff` to review changes
  - [ ] No unwanted files included

- [ ] **Backup**
  - [ ] Create a backup of current code
  - [ ] Save important configuration separately

- [ ] **Ready to commit**
  - [ ] All checklist items completed
  - [ ] Confident in commit

## 📋 Quick Command Reference

```bash
# Check what will be committed
git status

# Review changes
git diff

# Add all files
git add .

# Commit with message
git commit -m "Your message"

# Add remote
git remote add origin YOUR_REPO_URL

# Push to repository
git push -u origin main
```

## ⚠️ Important Notes

1. **Once pushed, it's public** (if public repo) - Double-check sensitive data
2. **Large files** - GitHub has 100MB file size limit
3. **Commit history** - Can't easily remove committed secrets
4. **Branch name** - Default might be `main` or `master`

## ✅ Ready to Commit?

If all items are checked, you're ready to push to your new repository!

Follow the steps in `GIT_COMMIT_GUIDE.md` to complete the process.

---

**Good luck with your commit! 🚀**
