# How to Access Team Assignments

## For Companies

After creating a team assignment, you can access it through multiple ways:

### Option 1: Navigation Bar (Top Menu)
1. Log in to your company account
2. Look at the top navigation bar
3. Click on **"Team Assignments"** (between "Active Projects" and "Find Developers")
4. You'll see all your team assignments with chat and submission tracking

### Option 2: Dashboard Quick Actions
1. Go to your Company Dashboard
2. Look at the right sidebar under "Quick Actions"
3. Click on **"Team Assignments"**
4. This takes you to the same team assignments page

### Option 3: Direct URL
- Navigate directly to: `http://localhost:5173/dashboard/company/assignments`

## For Developers

After being assigned to a team, you can access it through:

### Option 1: Navigation Bar (Top Menu)
1. Log in to your developer account
2. Look at the top navigation bar
3. Click on **"Team Assignments"** (between "Projects" and "Portfolio")
4. You'll see all teams you're part of with chat and submission forms

### Option 2: Dashboard Quick Actions
1. Go to your Developer Dashboard
2. Look at the right sidebar under "Quick Actions"
3. Click on **"My Team Assignments"**
4. This takes you to the team assignments page

### Option 3: Direct URL
- Navigate directly to: `http://localhost:5173/dashboard/developer/team-assignments`

## What You'll See

### Company View
- List of all team assignments you've created
- Team member details and submission status
- Figma submission tracking (URLs and images)
- Project submission tracking (GitHub, Live URL, ZIP, Documents)
- Team chat interface
- Deadline management (edit deadlines)

### Developer View
- List of all teams you're part of
- Team member information
- Deadline countdown
- Figma submission form (URL + image upload)
- Project submission form (GitHub, Live URL, ZIP, Documents)
- Team chat interface
- Submission status tracking

## Troubleshooting

### "No team assignments yet" message?
**For Companies:**
1. Make sure you've created a team assignment from the Enhanced Applications page
2. Go to "My Projects" → Select a project → View Applications → Select developers → Create Team

**For Developers:**
1. You need to be selected by a company first
2. Check if you have any pending applications
3. Wait for a company to assign you to a team

### Can't see the navigation link?
1. Make sure you're logged in
2. Refresh the page (Ctrl+R or Cmd+R)
3. Clear browser cache if needed
4. Check that you're using the correct user type (company vs developer)

### Team assignment exists but not showing?
1. Refresh the page
2. Log out and log back in
3. Check browser console for errors (F12)
4. Verify the team was created successfully in the database

## Navigation Flow

### Creating a Team (Company)
1. Dashboard → My Projects
2. Click on a project
3. Click "View Applications"
4. Select developers using checkboxes
5. Click "Create Team" or "Assign Single Developer"
6. Enter team name (for teams)
7. Team is created!

### Accessing the Team (Company)
1. Click "Team Assignments" in top nav OR
2. Dashboard → Quick Actions → "Team Assignments"
3. Click "View Details" on any team
4. Access chat, view submissions, edit deadlines

### Accessing the Team (Developer)
1. Click "Team Assignments" in top nav OR
2. Dashboard → Quick Actions → "My Team Assignments"
3. Click "View Details" on any assignment
4. Submit Figma, submit project, chat with team

## Features Available

### Company Features
✅ View all team assignments
✅ Track submission status for each member
✅ View Figma URLs and images
✅ View all project submission links
✅ Edit deadlines (Figma and Project)
✅ Chat with team members
✅ See team member details

### Developer Features
✅ View all team assignments
✅ See team members (for team assignments)
✅ Submit Figma designs (URL + images)
✅ Submit project (GitHub, Live URL, ZIP, etc.)
✅ Chat with company and team
✅ See deadline countdown
✅ Track your submission status

## Quick Tips

1. **Bookmark the page**: Add the team assignments page to your bookmarks for quick access
2. **Use the navbar**: The top navigation bar is always visible and provides quick access
3. **Check notifications**: System messages in chat notify about submissions and deadline changes
4. **Refresh after actions**: After creating a team, refresh to see it in the list
5. **Multiple teams**: You can have multiple team assignments - they all show in the list

## Need Help?

If you're still having trouble accessing team assignments:
1. Check that the backend server is running (port 8000)
2. Check that the frontend server is running (port 5173)
3. Verify you're logged in with the correct account
4. Check browser console for errors
5. Try logging out and back in
