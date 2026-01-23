# Quick Setup Guide - Team Assignment Feature

## Step 1: Database Setup (Supabase)

1. Open your Supabase project dashboard
2. Go to SQL Editor
3. Copy and paste the contents of `TEAM_ASSIGNMENT_SCHEMA.sql`
4. Click "Run" to execute the SQL
5. Verify tables are created in the Table Editor

## Step 2: Backend (Already Done!)

The backend is ready to go. The new endpoints are automatically registered:
- ✅ `team_assignment_views.py` created
- ✅ URLs registered in `projects/urls.py`
- ✅ All API endpoints available at `/api/projects/team-assignments/`

## Step 3: Frontend (Already Done!)

The frontend components are ready:
- ✅ `EnhancedProjectApplications.jsx` - Enhanced application view
- ✅ `CompanyTeamAssignments.jsx` - Company team management
- ✅ `DeveloperTeamAssignments.jsx` - Developer team view
- ✅ Routes added to `App.jsx`
- ✅ Navigation links updated in dashboards

## Step 4: Test the Feature

### Test as Company:

1. **Login as a company**
   ```
   Navigate to: http://localhost:5173/login
   ```

2. **View applications with new layout**
   ```
   Go to: My Projects → Select a project → View Applications
   You should see:
   - Top 3 section with highlighted cards
   - All applicants section below
   - Checkboxes for selection
   ```

3. **Create a team**
   ```
   - Select 2+ developers
   - Click "Create Team"
   - Enter team name
   - Confirm
   - Navigate to "Team Assignments" to see it
   ```

4. **Assign single developer**
   ```
   - Select exactly 1 developer
   - Click "Assign to Single Developer"
   - Confirm
   ```

5. **Track submissions**
   ```
   Go to: Dashboard → Team Assignments
   - View all assignments
   - Click on an assignment
   - See submission status for each member
   - View submitted links
   - Use team chat
   ```

### Test as Developer:

1. **Login as a developer**
   ```
   Navigate to: http://localhost:5173/login
   ```

2. **View team assignments**
   ```
   Go to: Dashboard → My Team Assignments
   You should see:
   - All team and solo assignments
   - Submission status
   - Deadline countdowns
   ```

3. **Submit Figma**
   ```
   - Click on an assignment
   - Enter Figma URL
   - Click "Submit Figma"
   - Status updates to "Submitted"
   ```

4. **Submit project**
   ```
   - Enter GitHub URL
   - Enter Live Project URL
   - Enter Documentation URL
   - Click "Submit Project"
   - Status updates to "Submitted"
   ```

5. **Use team chat**
   ```
   - Scroll to chat section
   - Send messages to team and company
   - See system notifications
   ```

## API Endpoints Reference

### Create Team Assignment
```bash
POST http://localhost:8000/api/projects/team-assignments/create_team_assignment/
Authorization: Bearer {token}
Content-Type: application/json

{
  "project_id": "uuid",
  "team_name": "Dream Team",
  "developer_ids": ["uuid1", "uuid2", "uuid3"]
}
```

### Assign Single Developer
```bash
POST http://localhost:8000/api/projects/team-assignments/assign_single_developer/
Authorization: Bearer {token}
Content-Type: application/json

{
  "project_id": "uuid",
  "developer_id": "uuid"
}
```

### Get Company Assignments
```bash
GET http://localhost:8000/api/projects/team-assignments/get_team_assignments/
Authorization: Bearer {token}
```

### Get Developer Assignments
```bash
GET http://localhost:8000/api/projects/team-assignments/get_developer_team_assignments/
Authorization: Bearer {token}
```

### Submit Figma
```bash
POST http://localhost:8000/api/projects/team-assignments/{assignment_id}/submit_figma/
Authorization: Bearer {token}
Content-Type: application/json

{
  "figma_url": "https://figma.com/..."
}
```

### Submit Project
```bash
POST http://localhost:8000/api/projects/team-assignments/{assignment_id}/submit_project/
Authorization: Bearer {token}
Content-Type: application/json

{
  "submission_links": {
    "github": "https://github.com/...",
    "live": "https://myproject.com",
    "documentation": "https://docs.myproject.com",
    "other": "https://other-link.com"
  }
}
```

### Get Team Chat
```bash
GET http://localhost:8000/api/projects/team-assignments/{assignment_id}/get_team_chat/
Authorization: Bearer {token}
```

### Send Team Message
```bash
POST http://localhost:8000/api/projects/team-assignments/{assignment_id}/send_team_message/
Authorization: Bearer {token}
Content-Type: application/json

{
  "message": "Hello team!"
}
```

## Verification Checklist

- [ ] Database tables created in Supabase
- [ ] Backend server running without errors
- [ ] Frontend dev server running
- [ ] Can view applications with top 3 section
- [ ] Can select multiple developers
- [ ] Can create team assignment
- [ ] Can assign single developer
- [ ] Company can view team assignments
- [ ] Company can see submission status
- [ ] Company can access team chat
- [ ] Developer can view their assignments
- [ ] Developer can submit Figma
- [ ] Developer can submit project
- [ ] Developer can use team chat
- [ ] Deadlines display correctly
- [ ] Submission links are accessible

## Troubleshooting

### Backend Issues

**Error: Module not found**
```bash
# Make sure you're in the backend directory
cd backend
python manage.py runserver
```

**Error: Table does not exist**
```bash
# Run the SQL schema in Supabase SQL Editor
# Copy contents of TEAM_ASSIGNMENT_SCHEMA.sql
```

### Frontend Issues

**Error: Component not found**
```bash
# Make sure all components are in src/components/
# Check imports in App.jsx
```

**Error: Cannot read property of undefined**
```bash
# Check if API is returning data
# Open browser console for detailed errors
# Verify authentication token is valid
```

### Database Issues

**Error: Permission denied**
```bash
# Check RLS policies in Supabase
# Verify user authentication
# Check if user has correct role
```

## Next Steps

After setup is complete:

1. **Test with real data**
   - Create actual projects
   - Have developers apply
   - Create teams and assignments
   - Test full submission workflow

2. **Customize as needed**
   - Adjust deadline durations
   - Modify UI styling
   - Add additional fields
   - Enhance chat features

3. **Monitor performance**
   - Check database query performance
   - Monitor API response times
   - Review user feedback

## Support

For issues or questions:
1. Check `TEAM_ASSIGNMENT_FEATURE.md` for detailed documentation
2. Review the code comments in the new files
3. Check browser console for frontend errors
4. Check Django logs for backend errors
5. Verify Supabase logs for database issues

## Summary

You now have a complete team assignment system with:
- ✅ Top 3 applicant highlighting
- ✅ Multi-select for team creation
- ✅ Single developer assignment
- ✅ Submission tracking (Figma + Project)
- ✅ Team chat functionality
- ✅ Company and developer dashboards
- ✅ Deadline management
- ✅ Full API integration

The ML matcher code remains untouched and continues to work as before!
