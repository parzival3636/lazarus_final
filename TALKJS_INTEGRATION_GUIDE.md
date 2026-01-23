# TalkJS Integration Guide

## Overview

TalkJS has been integrated into your project to provide a professional, real-time chat system with file sharing capabilities. This guide will help you set up and use TalkJS in your application.

## Features

✅ **Real-time Messaging** - Instant message delivery
✅ **File Uploads** - Support for images, PDFs, ZIPs, and documents
✅ **Persistent History** - All messages automatically stored by TalkJS
✅ **Message Alignment** - Sender messages on right, others on left
✅ **Team Chats** - Multi-participant conversations
✅ **One-on-One Chats** - Private conversations
✅ **Access Control** - Users only see conversations they're part of
✅ **Professional UI** - Clean, modern interface
✅ **Clickable Links** - Automatic link detection

## Setup Instructions

### Step 1: Get Your TalkJS App ID

1. Go to [TalkJS Dashboard](https://talkjs.com/dashboard/)
2. Sign up for a free account (or log in)
3. Create a new app
4. Copy your **App ID** from the dashboard

### Step 2: Configure TalkJS

Open `frontend/src/config/talkjs.config.js` and replace the placeholder:

```javascript
export const TALKJS_APP_ID = 'YOUR_TALKJS_APP_ID'; // Replace with your actual App ID
```

With your actual App ID:

```javascript
export const TALKJS_APP_ID = 't1234567'; // Your real App ID
```

### Step 3: Test the Integration

1. Start your frontend server:
   ```bash
   cd frontend
   npm run dev
   ```

2. Navigate to: `http://localhost:5173/chat-example`

3. You should see the TalkJS chat interface with example data

4. Try:
   - Sending text messages
   - Uploading files (images, PDFs, ZIPs)
   - Switching between team and one-on-one chat
   - Sending links (they'll be clickable)

## File Structure

```
frontend/src/
├── config/
│   └── talkjs.config.js          # TalkJS configuration (ADD YOUR APP ID HERE)
├── utils/
│   └── talkjsHelpers.js          # Helper functions for TalkJS
├── components/
│   ├── TalkJSChat.jsx            # Main chat component
│   ├── TalkJSChat.css            # Chat styles
│   └── TalkJSChatExample.jsx     # Example usage (for testing)
```

## Usage in Your Application

### Team Chat Example

Replace the chat section in `CompanyTeamAssignments.jsx` or `DeveloperTeamAssignments.jsx`:

```jsx
import TalkJSChat from './TalkJSChat';
import { getTeamConversationId } from '../utils/talkjsHelpers';

// In your component:
const teamConversationId = getTeamConversationId(selectedAssignment.id);

const teamConversationData = {
  subject: `${selectedAssignment.team_name} - ${selectedAssignment.project_title}`,
  welcomeMessage: `Welcome to ${selectedAssignment.team_name}!`,
  projectId: selectedAssignment.project_id,
  teamName: selectedAssignment.team_name
};

// Get all team members including company
const allParticipants = [
  ...selectedAssignment.members.map(member => ({
    id: member.developer_id,
    name: member.name,
    email: member.email,
    user_type: 'developer'
  })),
  {
    id: user.id,
    name: user.name || user.email,
    email: user.email,
    user_type: 'company'
  }
];

// Render TalkJS Chat
<TalkJSChat
  currentUser={user}
  conversationId={teamConversationId}
  conversationType="team"
  participants={allParticipants}
  conversationData={teamConversationData}
  height="600px"
/>
```

### One-on-One Chat Example

```jsx
import TalkJSChat from './TalkJSChat';

// In your component:
const conversationId = `chat_${currentUser.id}_${otherUser.id}`;

<TalkJSChat
  currentUser={currentUser}
  conversationId={conversationId}
  conversationType="one_on_one"
  otherUser={otherUser}
  conversationData={{
    subject: `Chat with ${otherUser.name}`,
    projectId: projectId
  }}
  height="500px"
/>
```

## Connecting Real User Data

The `formatUserForTalkJS` function in `utils/talkjsHelpers.js` is where you connect your real authentication data:

```javascript
export const formatUserForTalkJS = (user) => {
  return {
    id: user.id || user.user_id || user.uid,
    name: user.name || `${user.first_name} ${user.last_name}`.trim() || user.email,
    email: user.email,
    role: user.user_type || user.role || USER_ROLES.DEVELOPER,
    photoUrl: user.photo_url || user.avatar || null,
    companyName: user.company_name || null,
    skills: user.skills || []
  };
};
```

Modify this function to match your user object structure.

## Component Props

### TalkJSChat Component

| Prop | Type | Required | Description |
|------|------|----------|-------------|
| `currentUser` | Object | Yes | Currently logged-in user |
| `conversationId` | String | Yes | Unique conversation ID |
| `conversationType` | String | Yes | 'team' or 'one_on_one' |
| `participants` | Array | Conditional | Required for team chats |
| `otherUser` | Object | Conditional | Required for one-on-one chats |
| `conversationData` | Object | No | Additional metadata |
| `height` | String | No | Chat height (default: '600px') |

### User Object Structure

```javascript
{
  id: 'user_123',              // Required: Unique user ID
  name: 'John Doe',            // Required: Display name
  email: 'john@example.com',   // Required: Email
  user_type: 'company',        // Required: 'company' or 'developer'
  photo_url: 'https://...',    // Optional: Profile photo
  company_name: 'Tech Corp',   // Optional: Company name
  skills: ['React', 'Node']    // Optional: Skills array
}
```

## File Upload Support

TalkJS automatically handles file uploads. Supported file types:

- **Images**: JPG, PNG, GIF, SVG, WebP
- **Documents**: PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX
- **Archives**: ZIP, RAR
- **Text**: TXT, CSV, JSON
- **Code**: JS, JSX, TS, TSX, PY, etc.

Maximum file size: **50MB** (configurable in `talkjs.config.js`)

## Message Features

### Automatic Features
- ✅ Clickable links
- ✅ Image previews
- ✅ File download buttons
- ✅ Emoji support
- ✅ Read receipts
- ✅ Typing indicators
- ✅ Message timestamps
- ✅ Sender names

### Message Alignment
- **Your messages**: Right side, purple gradient background
- **Other messages**: Left side, white background with border
- **System messages**: Centered, yellow background

## Customization

### Styling

Edit `frontend/src/components/TalkJSChat.css` to customize:

```css
/* Change message bubble colors */
.talkjs-chat-container [class*="MessageRow--me"] [class*="MessageBubble"] {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
}

/* Change header color */
.talkjs-chat-container [class*="Header"] {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
}
```

### Configuration

Edit `frontend/src/config/talkjs.config.js`:

```javascript
export const TALKJS_CONFIG = {
  enableFileSharing: true,
  maxFileSize: 50 * 1024 * 1024, // 50MB
  allowedFileTypes: [
    'image/*',
    'application/pdf',
    // Add more types...
  ]
};
```

## Integration Checklist

- [ ] Install TalkJS: `npm install talkjs`
- [ ] Get TalkJS App ID from dashboard
- [ ] Add App ID to `talkjs.config.js`
- [ ] Test with example page (`/chat-example`)
- [ ] Replace dummy data with real user data
- [ ] Integrate into CompanyTeamAssignments component
- [ ] Integrate into DeveloperTeamAssignments component
- [ ] Test file uploads (images, PDFs, ZIPs)
- [ ] Test message alignment (sender vs receiver)
- [ ] Test conversation persistence (refresh page)
- [ ] Customize styles to match your brand
- [ ] Test access control (users only see their chats)

## Replacing Existing Chat

To replace the current basic chat with TalkJS:

### In CompanyTeamAssignments.jsx:

1. Import TalkJS components:
```jsx
import TalkJSChat from './TalkJSChat';
import { getTeamConversationId } from '../utils/talkjsHelpers';
```

2. Replace the chat section (around line 300):
```jsx
{/* OLD CHAT - Remove this entire section */}
<div className="team-chat-container">
  {/* ... old chat code ... */}
</div>

{/* NEW TALKJS CHAT - Add this */}
<TalkJSChat
  currentUser={user}
  conversationId={getTeamConversationId(selectedAssignment.id)}
  conversationType="team"
  participants={[
    ...selectedAssignment.members.map(m => ({
      id: m.developer_id,
      name: m.name,
      email: m.email,
      user_type: 'developer'
    })),
    {
      id: user.id,
      name: user.name || user.email,
      email: user.email,
      user_type: 'company'
    }
  ]}
  conversationData={{
    subject: `${selectedAssignment.team_name} - ${selectedAssignment.project_title}`,
    teamName: selectedAssignment.team_name,
    projectId: selectedAssignment.project_id
  }}
  height="600px"
/>
```

### In DeveloperTeamAssignments.jsx:

Same process - replace the chat section with TalkJSChat component.

## Troubleshooting

### "TalkJS is not configured" Error
- Make sure you've added your App ID to `talkjs.config.js`
- Check that the App ID is correct (starts with 't')
- Restart your development server after changing config

### Chat Not Loading
- Check browser console for errors
- Verify TalkJS package is installed: `npm list talkjs`
- Ensure currentUser has required fields (id, name, email)
- Check that conversationId is unique and consistent

### Files Not Uploading
- Check file size (default max: 50MB)
- Verify file type is allowed in config
- Check browser console for errors
- Ensure TalkJS App ID is valid

### Messages Not Persisting
- Verify conversationId is the same on reload
- Check that user IDs are consistent
- Ensure TalkJS session is created properly

### Styling Issues
- Clear browser cache
- Check CSS specificity (use `!important` if needed)
- Inspect elements to see TalkJS class names
- Verify CSS file is imported

## Advanced Features

### System Messages

Send automated system messages:

```javascript
import { sendSystemMessage } from '../utils/talkjsHelpers';

// After creating conversation
sendSystemMessage(conversation, 'Project deadline updated to March 15th');
```

### Custom User Properties

Add custom data to users:

```javascript
const talkUser = new Talk.User({
  id: user.id,
  name: user.name,
  email: user.email,
  custom: {
    department: 'Engineering',
    location: 'San Francisco',
    timezone: 'PST'
  }
});
```

### Conversation Metadata

Add custom data to conversations:

```javascript
conversation.setAttributes({
  custom: {
    projectId: 'proj_123',
    priority: 'high',
    deadline: '2024-03-15'
  }
});
```

## Support & Resources

- **TalkJS Documentation**: https://talkjs.com/docs/
- **TalkJS Dashboard**: https://talkjs.com/dashboard/
- **React Integration Guide**: https://talkjs.com/docs/Getting_Started/Frameworks/React/
- **File Uploads**: https://talkjs.com/docs/Features/File_Sharing/
- **Customization**: https://talkjs.com/docs/Features/Themes/

## Next Steps

1. **Get your TalkJS App ID** and add it to the config
2. **Test the example page** at `/chat-example`
3. **Replace dummy data** with your real user data
4. **Integrate into your team assignment pages**
5. **Customize the UI** to match your brand
6. **Test thoroughly** with real users

Your chat system is now ready for production use with real-time messaging, file sharing, and persistent message history!
