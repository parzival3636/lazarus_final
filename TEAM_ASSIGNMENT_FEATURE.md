# Team Assignment Feature Documentation

## Overview
This feature adds comprehensive team management and project assignment capabilities to the platform. Companies can now create teams or assign projects to individual developers, with full submission tracking and team chat functionality.

## Features

### 1. Enhanced Application View
- **Top 3 Section**: Displays the top 3 highest-scoring applicants prominently
- **All Applicants Section**: Shows remaining applicants with their scores
- **Multi-Select**: Checkbox selection for creating teams or single assignments
- **Score-Based Sorting**: Applications automatically sorted by match score

### 2. Team Creation
- Select multiple developers from applications
- Create a named team
- Automatic chat group creation
- Submission tracking for all team members
- Deadlines: 7 days for Figma, 30 days for final project

### 3. Single Developer Assignment
- Select exactly one developer
- Direct project assignment
- Individual chat and submission tracking
- Same deadline structure as teams

### 4. Company Dashboard Features
- View all team assignments
- Track submission status for each team member
- See who has submitted Figma designs
- See who has submitted final projects
- Access submission links (GitHub, live project, documentation)
- Team chat interface

### 5. Developer Dashboard Features
- View all team assignments (both team and solo)
- See team members for team projects
- Submit Figma designs with URL
- Submit final project with multiple links:
  - GitHub repository
  - Live project URL
  - Documentation
  - Other links
- Team chat interface
- Deadline tracking with days remaining

## Backend Implementation

### New Files Created
1. **`backend/projects/team_assignment_views.py`**
   - `TeamAssignmentViewSet` - Main viewset for team management
   - Endpoints:
     - `create_team_assignment/` - Create team with multiple developers
     - `assign_single_developer/` - Assign to one developer
     - `get_team_assignments/` - Get company's assignments
     - `get_developer_team_assignments/` - Get developer's assignments
     - `submit_figma/` - Developer submits Figma
     - `submit_project/` - Developer submits final project
     - `get_team_chat/` - Get chat messages
     - `send_team_message/` - Send chat message

### Database Schema
**Tables Created** (see `TEAM_ASSIGNMENT_SCHEMA.sql`):
1. `team_assignments` - Main assignment records
2. `team_assignment_members` - Team member details and submissions
3. `team_chats` - Chat groups for teams
4. `team_chat_messages` - Individual chat messages

### URL Configuration
Updated `backend/projects/urls.py` to include:
```python
router.register(r'team-assignments', TeamAssignmentViewSet, basename='team-assignment')
```

## Frontend Implementation

### New Components Created

1. **`EnhancedProjectApplications.jsx`**
   - Replaces the standard application view
   - Shows top 3 applicants in highlighted section
   - Shows all other applicants below
   - Multi-select checkboxes
   - Team creation modal
   - Single assignment button

2. **`CompanyTeamAssignments.jsx`**
   - Company view for all team assignments
   - Submission status tracking
   - Team member details
   - Submission links display
   - Team chat interface

3. **`DeveloperTeamAssignments.jsx`**
   - Developer view for their assignments
   - Figma submission form
   - Project submission form with multiple link types
   - Team member list
   - Deadline countdown
   - Team chat interface

### Routes Added
```javascript
// Company routes
/dashboard/company/projects/:projectId/applications - Enhanced application view
/dashboard/company/assignments - Team assignments dashboard

// Developer routes
/dashboard/developer/team-assignments - Developer assignments dashboard
```

## API Endpoints

### Team Assignment Endpoints
```
POST /api/projects/team-assignments/create_team_assignment/
Body: {
  project_id: UUID,
  team_name: string,
  developer_ids: [UUID]
}

POST /api/projects/team-assignments/assign_single_developer/
Body: {
  project_id: UUID,
  developer_id: UUID
}

GET /api/projects/team-assignments/get_team_assignments/
Returns: Array of team assignments with member details

GET /api/projects/team-assignments/get_developer_team_assignments/
Returns: Array of developer's team assignments

POST /api/projects/team-assignments/{id}/submit_figma/
Body: {
  figma_url: string
}

POST /api/projects/team-assignments/{id}/submit_project/
Body: {
  submission_links: {
    github: string,
    live: string,
    documentation: string,
    other: string
  }
}

GET /api/projects/team-assignments/{id}/get_team_chat/
Returns: { messages: Array }

POST /api/projects/team-assignments/{id}/send_team_message/
Body: {
  message: string
}
```

## Setup Instructions

### 1. Database Setup
Run the SQL schema in your Supabase dashboard:
```bash
# Execute TEAM_ASSIGNMENT_SCHEMA.sql in Supabase SQL Editor
```

### 2. Backend Setup
No additional setup needed - the new views are automatically registered via the router.

### 3. Frontend Setup
The new components are already imported in `App.jsx`. Just ensure your frontend is running:
```bash
cd frontend
npm install
npm run dev
```

## Usage Flow

### For Companies

1. **View Applications**
   - Navigate to project applications
   - See top 3 matches highlighted
   - See all other applicants below

2. **Create Team**
   - Select multiple developers using checkboxes
   - Click "Create Team"
   - Enter team name
   - Confirm creation

3. **Assign Single Developer**
   - Select exactly one developer
   - Click "Assign to Single Developer"
   - Confirm assignment

4. **Track Progress**
   - Go to "Team Assignments" dashboard
   - View all assignments
   - Click on assignment to see details
   - Check submission status for each member
   - View submitted links
   - Chat with team

### For Developers

1. **View Assignments**
   - Navigate to "My Team Assignments"
   - See all team and solo assignments
   - View deadline countdowns

2. **Submit Figma**
   - Click on assignment
   - Enter Figma URL in submission form
   - Click "Submit Figma"

3. **Submit Project**
   - Enter GitHub repository URL
   - Enter live project URL
   - Enter documentation URL
   - Add any other links
   - Click "Submit Project"

4. **Communicate**
   - Use team chat to communicate with company and team members
   - Receive system notifications about submissions

## Data Structure

### Team Assignment Object
```javascript
{
  id: UUID,
  project_id: UUID,
  company_id: UUID,
  team_name: string,
  figma_deadline: timestamp,
  submission_deadline: timestamp,
  is_team: boolean,
  project_title: string,
  members: [
    {
      developer_id: UUID,
      name: string,
      email: string,
      figma_submitted: boolean,
      figma_url: string,
      project_submitted: boolean,
      submission_links: {
        github: string,
        live: string,
        documentation: string,
        other: string
      }
    }
  ]
}
```

### Chat Message Object
```javascript
{
  id: UUID,
  chat_id: UUID,
  sender_id: UUID,
  sender_name: string,
  message: string,
  message_type: 'text' | 'system' | 'file',
  created_at: timestamp
}
```

## Security

- Row Level Security (RLS) enabled on all tables
- Companies can only view/manage their own assignments
- Developers can only view/update their own submissions
- Chat access restricted to team members and company
- All API endpoints require authentication

## Future Enhancements

Potential improvements:
1. File upload support for submissions
2. Milestone tracking within projects
3. Team performance analytics
4. Automated deadline reminders
5. Video call integration
6. Code review features
7. Payment integration per team member
8. Team rating system

## Troubleshooting

### Common Issues

1. **"Project already assigned" error**
   - Each project can only be assigned once
   - Check if assignment already exists

2. **Chat not loading**
   - Ensure chat was created during assignment
   - Check RLS policies in Supabase

3. **Submission not saving**
   - Verify deadline hasn't passed
   - Check authentication token
   - Ensure required fields are filled

4. **Developer not seeing assignment**
   - Verify developer was added to team_assignment_members
   - Check RLS policies

## Notes

- The ML matcher code remains untouched as requested
- All existing functionality is preserved
- The feature is fully integrated with the existing authentication system
- Deadlines are automatically calculated (7 days for Figma, 30 days for project)
- System messages are automatically sent to chat on key events
