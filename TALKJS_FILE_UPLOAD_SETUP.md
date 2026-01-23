# TalkJS File Upload Setup Guide

## Current Status
✅ TalkJS is integrated and working
✅ Text messages are working
❌ File uploads need to be enabled in TalkJS dashboard

## Enable File Uploads in TalkJS Dashboard

### Step 1: Go to TalkJS Dashboard
1. Visit: https://talkjs.com/dashboard/
2. Log in with your account
3. Select your app: **tOHI158o**

### Step 2: Enable File Sharing
1. In the left sidebar, click on **"Settings"**
2. Look for **"File Sharing"** or **"Attachments"** section
3. Toggle **"Enable file sharing"** to ON
4. Configure allowed file types:
   - ✅ Images (PNG, JPG, GIF, etc.)
   - ✅ Documents (PDF, DOC, DOCX, etc.)
   - ✅ Archives (ZIP, RAR, etc.)
   - ✅ All file types (recommended)

### Step 3: Set File Size Limits
1. Set maximum file size (recommended: 50MB or higher)
2. Save settings

### Step 4: Enable Link Previews (Optional)
1. In Settings, look for **"Link Previews"**
2. Toggle ON to show rich previews for links
3. This will automatically detect and format URLs in messages

## File Upload Features

Once enabled, users will be able to:

### 📎 Attach Files
- Click the attachment icon (📎) in the chat input
- Select files from their device
- Supported types: Images, PDFs, ZIPs, Documents

### 🔗 Share Links
- Simply paste any URL in the message
- Links will be automatically clickable
- Examples:
  - `https://github.com/username/repo`
  - `https://figma.com/file/...`
  - `https://drive.google.com/...`

### 🖼️ Send Images
- Drag and drop images directly into chat
- Or use the attachment button
- Images will display inline with preview

### 📄 Send Documents
- PDFs, Word docs, Excel sheets
- ZIP files for code submissions
- Any document type you configure

## Testing File Uploads

After enabling in dashboard:

1. **Refresh your browser** (hard refresh: Ctrl+Shift+R or Cmd+Shift+R)
2. Open the team chat
3. Look for the attachment icon (📎) next to the message input
4. Click it and try uploading a file

## Troubleshooting

### File upload button not showing?
- Make sure you enabled file sharing in TalkJS dashboard
- Hard refresh your browser (Ctrl+Shift+R)
- Clear browser cache
- Check browser console for errors

### Files not uploading?
- Check file size (must be under your configured limit)
- Check file type is allowed
- Check browser console for errors
- Verify TalkJS dashboard settings are saved

### Links not clickable?
- Links should work automatically
- Make sure to paste the full URL including `https://`
- Example: `https://github.com/user/repo` (not `github.com/user/repo`)

## Current Configuration

Your app is configured with:
- **App ID**: `tOHI158o`
- **File Sharing**: Needs to be enabled in dashboard
- **Max File Size**: 50MB (configured in code, but dashboard setting takes precedence)
- **Allowed Types**: All types (images, PDFs, ZIPs, documents)

## Next Steps

1. ✅ Go to TalkJS dashboard
2. ✅ Enable file sharing
3. ✅ Set file size limits
4. ✅ Save settings
5. ✅ Refresh browser
6. ✅ Test file uploads

## Support

If you need help:
- TalkJS Documentation: https://talkjs.com/docs/
- TalkJS Support: support@talkjs.com
- Dashboard: https://talkjs.com/dashboard/

---

**Note**: File uploads are a TalkJS feature that must be enabled in your dashboard. The code is already configured to support it - you just need to enable it in your TalkJS account settings.
