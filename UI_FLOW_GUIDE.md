# UI Flow Guide - Team Assignment Feature

## Visual Flow Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    COMPANY WORKFLOW                          │
└─────────────────────────────────────────────────────────────┘

1. VIEW APPLICATIONS (Enhanced View)
   ┌──────────────────────────────────────────────────┐
   │  🏆 Top 3 Matches                                │
   │  ┌────────────────┐ ┌────────────────┐ ┌───────┐│
   │  │ #1 Developer   │ │ #2 Developer   │ │ #3... ││
   │  │ Score: 95%     │ │ Score: 92%     │ │ 89%   ││
   │  │ [✓] Select     │ │ [✓] Select     │ │ [ ]   ││
   │  └────────────────┘ └────────────────┘ └───────┘│
   │                                                   │
   │  All Applicants (15)                             │
   │  ┌────────────────┐ ┌────────────────┐          │
   │  │ Developer 4    │ │ Developer 5    │          │
   │  │ Score: 85%     │ │ Score: 82%     │          │
   │  │ [ ] Select     │ │ [✓] Select     │          │
   │  └────────────────┘ └────────────────┘          │
   │                                                   │
   │  [3 developers selected]                         │
   │  [Create Team (3)] [Assign Single] [Clear]      │
   └──────────────────────────────────────────────────┘
                          ↓
2. CREATE TEAM MODAL
   ┌──────────────────────────────────────────────────┐
   │  Create Team                                      │
   │  Creating a team with 3 developer(s)             │
   │                                                   │
   │  Team Name: [Dream Team____________]             │
   │                                                   │
   │  [Cancel]  [Create Team]                         │
   └──────────────────────────────────────────────────┘
                          ↓
3. TEAM ASSIGNMENTS DASHBOARD
   ┌──────────────────────────────────────────────────┐
   │  Team Assignments                                 │
   │                                                   │
   │  ┌────────────────────────────────────────────┐  │
   │  │ Dream Team                                  │  │
   │  │ Project: E-commerce Platform                │  │
   │  │ Type: 👥 Team                               │  │
   │  │ Members: 3                                  │  │
   │  │                                             │  │
   │  │ Submissions:                                │  │
   │  │ Figma: 2/3                                  │  │
   │  │ Project: 1/3                                │  │
   │  │                                             │  │
   │  │ [View Details]                              │  │
   │  └────────────────────────────────────────────┘  │
   └──────────────────────────────────────────────────┘
                          ↓
4. TEAM DETAILS VIEW
   ┌──────────────────────────────────────────────────┐
   │  ← Back to All Assignments                       │
   │                                                   │
   │  Dream Team                                       │
   │  Project: E-commerce Platform                    │
   │  Figma Deadline: Jan 30, 2026                    │
   │  Submission Deadline: Feb 22, 2026               │
   │                                                   │
   │  Team Members                                     │
   │  ┌──────────────┐ ┌──────────────┐ ┌──────────┐ │
   │  │ John Doe     │ │ Jane Smith   │ │ Bob Lee  │ │
   │  │ john@...     │ │ jane@...     │ │ bob@...  │ │
   │  │              │ │              │ │          │ │
   │  │ Figma: ✓     │ │ Figma: ✓     │ │ Figma: ⏳│ │
   │  │ [View]       │ │ [View]       │ │          │ │
   │  │              │ │              │ │          │ │
   │  │ Project: ✓   │ │ Project: ⏳  │ │ Project:⏳│
   │  │ • GitHub     │ │              │ │          │ │
   │  │ • Live       │ │              │ │          │ │
   │  │ • Docs       │ │              │ │          │ │
   │  └──────────────┘ └──────────────┘ └──────────┘ │
   │                                                   │
   │  Team Chat                                        │
   │  ┌────────────────────────────────────────────┐  │
   │  │ System • 2 days ago                        │  │
   │  │ Welcome to the team 'Dream Team'!          │  │
   │  │                                            │  │
   │  │ John Doe • 1 day ago                       │  │
   │  │ Figma design submitted: https://...        │  │
   │  │                                            │  │
   │  │ Company • 1 hour ago                       │  │
   │  │ Great work on the designs!                 │  │
   │  └────────────────────────────────────────────┘  │
   │  [Type a message...] [Send]                      │
   └──────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────┐
│                   DEVELOPER WORKFLOW                         │
└─────────────────────────────────────────────────────────────┘

1. MY TEAM ASSIGNMENTS
   ┌──────────────────────────────────────────────────┐
   │  My Team Assignments                              │
   │                                                   │
   │  ┌────────────────────────────────────────────┐  │
   │  │ Dream Team                                  │  │
   │  │ Project: E-commerce Platform                │  │
   │  │ Company: TechCorp Inc.                      │  │
   │  │ Type: 👥 Team                               │  │
   │  │                                             │  │
   │  │ My Status:                                  │  │
   │  │ Figma: ✓ Submitted                          │  │
   │  │ Project: ⏳ Pending                         │  │
   │  │                                             │  │
   │  │ Figma due: 5 days                           │  │
   │  │ Project due: 28 days                        │  │
   │  │                                             │  │
   │  │ [View Details]                              │  │
   │  └────────────────────────────────────────────┘  │
   │                                                   │
   │  ┌────────────────────────────────────────────┐  │
   │  │ Solo - Mobile App                           │  │
   │  │ Project: Mobile App Development             │  │
   │  │ Company: StartupXYZ                         │  │
   │  │ Type: 👤 Solo                               │  │
   │  │                                             │  │
   │  │ My Status:                                  │  │
   │  │ Figma: ⏳ Pending                           │  │
   │  │ Project: ⏳ Pending                         │  │
   │  │                                             │  │
   │  │ [View Details]                              │  │
   │  └────────────────────────────────────────────┘  │
   └──────────────────────────────────────────────────┘
                          ↓
2. ASSIGNMENT DETAILS
   ┌──────────────────────────────────────────────────┐
   │  ← Back to All Assignments                       │
   │                                                   │
   │  Dream Team                                       │
   │  Project: E-commerce Platform                    │
   │  Company: TechCorp Inc.                          │
   │  Type: 👥 Team Assignment                        │
   │                                                   │
   │  ┌─────────────────────┬─────────────────────┐   │
   │  │ Figma Deadline:     │ Project Deadline:   │   │
   │  │ Jan 30, 2026        │ Feb 22, 2026        │   │
   │  │ 5 days remaining    │ 28 days remaining   │   │
   │  └─────────────────────┴─────────────────────┘   │
   │                                                   │
   │  Team Members                                     │
   │  [John Doe] [Jane Smith] [Bob Lee]               │
   │                                                   │
   │  ┌─────────────────────┬─────────────────────┐   │
   │  │ Figma Submission    │ Project Submission  │   │
   │  │                     │                     │   │
   │  │ ✓ Submitted         │ GitHub URL:         │   │
   │  │ View Submission     │ [____________]      │   │
   │  │                     │                     │   │
   │  │                     │ Live Project URL:   │   │
   │  │                     │ [____________]      │   │
   │  │                     │                     │   │
   │  │                     │ Documentation URL:  │   │
   │  │                     │ [____________]      │   │
   │  │                     │                     │   │
   │  │                     │ Other Links:        │   │
   │  │                     │ [____________]      │   │
   │  │                     │                     │   │
   │  │                     │ [Submit Project]    │   │
   │  └─────────────────────┴─────────────────────┘   │
   │                                                   │
   │  Team Chat                                        │
   │  ┌────────────────────────────────────────────┐  │
   │  │ [Chat messages...]                         │  │
   │  └────────────────────────────────────────────┘  │
   │  [Type a message...] [Send]                      │
   └──────────────────────────────────────────────────┘
```

## Key UI Elements

### Application Cards (Enhanced View)

#### Top 3 Cards
```
┌────────────────────────────────────────┐
│ #1                            [✓]      │  ← Rank badge & checkbox
│                                        │
│ John Doe                               │
│ Senior Full Stack Developer            │
│ john@example.com                       │
│                                        │
│              95%                       │  ← Large score
│         Excellent Match                │
│                                        │
│ AI Match Analysis                      │
│ ┌──────────┬──────────┬──────────┐    │
│ │ Skill    │ Exp Fit  │ Portfolio│    │
│ │ 98%      │ 95%      │ 92%      │    │
│ └──────────┴──────────┴──────────┘    │
│                                        │
│ ✓ Matching Skills                      │
│ [React] [Node.js] [MongoDB]            │
│                                        │
│ ✗ Missing Skills                       │
│ [GraphQL]                              │
│                                        │
│ [View Full Profile]                    │
└────────────────────────────────────────┘
```

#### Regular Cards
```
┌────────────────────────────────────────┐
│                              [✓]       │  ← Checkbox only
│ Jane Smith                             │
│ Frontend Developer                     │
│ jane@example.com                       │
│                                        │
│              82%                       │
│          Good Match                    │
│                                        │
│ [View Full Profile]                    │
└────────────────────────────────────────┘
```

### Selection Bar
```
┌──────────────────────────────────────────────────────┐
│ 3 developer(s) selected                              │
│                                                      │
│ [Clear Selection] [Assign Single] [Create Team (3)] │
└──────────────────────────────────────────────────────┘
```

### Team Creation Modal
```
┌────────────────────────────────────┐
│  Create Team                       │
│                                    │
│  Creating a team with 3 developers │
│                                    │
│  Team Name                         │
│  [________________________]        │
│                                    │
│  [Cancel]  [Create Team]           │
└────────────────────────────────────┘
```

### Submission Status Indicators

#### Pending
```
⏳ Pending
```

#### Submitted
```
✓ Submitted
[View]  ← Link to submission
```

#### With Links
```
✓ Submitted
• GitHub
• Live Project
• Documentation
```

### Chat Interface
```
┌────────────────────────────────────────┐
│ System • 2 days ago                    │  ← System message
│ Welcome to the team!                   │
├────────────────────────────────────────┤
│ John Doe • 1 day ago                   │  ← User message
│ Figma design submitted                 │
├────────────────────────────────────────┤
│ Company • 1 hour ago                   │  ← Company message
│ Great work!                            │
└────────────────────────────────────────┘
[Type a message...] [Send]
```

### Deadline Display
```
┌─────────────────────┐
│ Figma Deadline:     │
│ Jan 30, 2026        │
│ 5 days remaining    │  ← Color: Orange if < 7 days
└─────────────────────┘
```

## Color Scheme

### Status Colors
- **Pending**: Orange (#f59e0b)
- **Submitted**: Green (#10b981)
- **Overdue**: Red (#ef4444)

### Card Borders
- **Top 3**: Blue (#3b82f6) - 2px
- **Selected**: Light Blue (#f0f9ff) background
- **Regular**: Gray (#e5e7eb) - 1px

### Badges
- **#1 Rank**: Gold (#fbbf24)
- **#2 Rank**: Silver (#d1d5db)
- **#3 Rank**: Bronze (#f59e0b)

### Score Badges
- **Excellent (80%+)**: Green
- **Good (60-79%)**: Blue
- **Fair (<60%)**: Orange

## Responsive Behavior

### Desktop (>1024px)
- Applications: 1 column, full width
- Team members: 3 columns grid
- Chat: Side by side with submissions

### Tablet (768-1024px)
- Applications: 1 column
- Team members: 2 columns grid
- Chat: Below submissions

### Mobile (<768px)
- Applications: 1 column, stacked
- Team members: 1 column, stacked
- Chat: Full width, below everything

## Interaction States

### Hover States
- Cards: Slight shadow increase
- Buttons: Background color darkens
- Links: Underline appears

### Active States
- Selected cards: Blue background
- Pressed buttons: Scale down slightly

### Disabled States
- Already assigned: Gray out, no hover
- Past deadline: Red border, disabled submit

## Loading States

### Initial Load
```
Loading applications...
```

### Submitting
```
[Submitting...] ← Button shows loading
```

### Chat Loading
```
Loading messages...
```

## Empty States

### No Applications
```
┌────────────────────────────────┐
│  No applications yet for this  │
│  project.                      │
└────────────────────────────────┘
```

### No Assignments
```
┌────────────────────────────────┐
│  No team assignments yet.      │
└────────────────────────────────┘
```

### No Messages
```
┌────────────────────────────────┐
│  No messages yet. Start the    │
│  conversation!                 │
└────────────────────────────────┘
```

## Navigation Flow

```
Company Dashboard
    ↓
My Projects
    ↓
View Applications (Enhanced)
    ↓
[Create Team] → Team Assignments Dashboard
    ↓
Team Details → Chat & Submissions

Developer Dashboard
    ↓
My Team Assignments
    ↓
Assignment Details
    ↓
Submit Work & Chat
```

## Key User Actions

### Company Actions
1. Select developers (checkbox)
2. Create team (button + modal)
3. Assign single (button)
4. View team details (button)
5. Check submissions (view)
6. Send messages (chat)

### Developer Actions
1. View assignments (list)
2. Open assignment (button)
3. Submit Figma (form + button)
4. Submit project (form + button)
5. Send messages (chat)
6. View team members (list)

This UI provides a clean, intuitive interface for managing team assignments with clear visual hierarchy and status indicators.
