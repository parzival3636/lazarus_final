-- Team Assignment Schema for Supabase
-- This schema supports both team and single developer assignments

-- Team Assignments Table
CREATE TABLE IF NOT EXISTS team_assignments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    company_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    team_name TEXT NOT NULL,
    figma_deadline TIMESTAMPTZ NOT NULL,
    submission_deadline TIMESTAMPTZ NOT NULL,
    is_team BOOLEAN DEFAULT true,
    deadline_updated_by UUID REFERENCES auth.users(id),
    deadline_updated_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Team Assignment Members Table
CREATE TABLE IF NOT EXISTS team_assignment_members (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    team_assignment_id UUID NOT NULL REFERENCES team_assignments(id) ON DELETE CASCADE,
    developer_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    figma_submitted BOOLEAN DEFAULT false,
    figma_url TEXT,
    figma_images JSONB DEFAULT '[]'::jsonb,  -- Array of image URLs
    figma_submitted_at TIMESTAMPTZ,
    project_submitted BOOLEAN DEFAULT false,
    submission_links JSONB DEFAULT '{}'::jsonb,  -- {github, zip_file, documents: []}
    project_submitted_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(team_assignment_id, developer_id)
);

-- Team Chats Table
CREATE TABLE IF NOT EXISTS team_chats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    team_assignment_id UUID NOT NULL REFERENCES team_assignments(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(team_assignment_id)
);

-- Team Chat Messages Table
CREATE TABLE IF NOT EXISTS team_chat_messages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    chat_id UUID NOT NULL REFERENCES team_chats(id) ON DELETE CASCADE,
    sender_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    message_type TEXT DEFAULT 'text' CHECK (message_type IN ('text', 'system', 'file')),
    attachments JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_team_assignments_project ON team_assignments(project_id);
CREATE INDEX IF NOT EXISTS idx_team_assignments_company ON team_assignments(company_id);
CREATE INDEX IF NOT EXISTS idx_team_assignment_members_team ON team_assignment_members(team_assignment_id);
CREATE INDEX IF NOT EXISTS idx_team_assignment_members_developer ON team_assignment_members(developer_id);
CREATE INDEX IF NOT EXISTS idx_team_chats_assignment ON team_chats(team_assignment_id);
CREATE INDEX IF NOT EXISTS idx_team_chat_messages_chat ON team_chat_messages(chat_id);
CREATE INDEX IF NOT EXISTS idx_team_chat_messages_created ON team_chat_messages(created_at);

-- Enable Row Level Security
ALTER TABLE team_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_assignment_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_chats ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_chat_messages ENABLE ROW LEVEL SECURITY;

-- RLS Policies for team_assignments
CREATE POLICY "Companies can view their own team assignments"
    ON team_assignments FOR SELECT
    USING (auth.uid() = company_id);

CREATE POLICY "Companies can create team assignments"
    ON team_assignments FOR INSERT
    WITH CHECK (auth.uid() = company_id);

CREATE POLICY "Companies can update their team assignments"
    ON team_assignments FOR UPDATE
    USING (auth.uid() = company_id);

-- RLS Policies for team_assignment_members
CREATE POLICY "Team members can view their memberships"
    ON team_assignment_members FOR SELECT
    USING (
        auth.uid() = developer_id OR
        auth.uid() IN (
            SELECT company_id FROM team_assignments 
            WHERE id = team_assignment_id
        )
    );

CREATE POLICY "Companies can add team members"
    ON team_assignment_members FOR INSERT
    WITH CHECK (
        auth.uid() IN (
            SELECT company_id FROM team_assignments 
            WHERE id = team_assignment_id
        )
    );

CREATE POLICY "Developers can update their own submissions"
    ON team_assignment_members FOR UPDATE
    USING (auth.uid() = developer_id);

-- RLS Policies for team_chats
CREATE POLICY "Team members and company can view chats"
    ON team_chats FOR SELECT
    USING (
        auth.uid() IN (
            SELECT company_id FROM team_assignments 
            WHERE id = team_assignment_id
        ) OR
        auth.uid() IN (
            SELECT developer_id FROM team_assignment_members 
            WHERE team_assignment_id = team_chats.team_assignment_id
        )
    );

CREATE POLICY "System can create chats"
    ON team_chats FOR INSERT
    WITH CHECK (true);

-- RLS Policies for team_chat_messages
CREATE POLICY "Team members and company can view messages"
    ON team_chat_messages FOR SELECT
    USING (
        auth.uid() IN (
            SELECT company_id FROM team_assignments ta
            JOIN team_chats tc ON tc.team_assignment_id = ta.id
            WHERE tc.id = chat_id
        ) OR
        auth.uid() IN (
            SELECT developer_id FROM team_assignment_members tam
            JOIN team_chats tc ON tc.team_assignment_id = tam.team_assignment_id
            WHERE tc.id = chat_id
        )
    );

CREATE POLICY "Team members and company can send messages"
    ON team_chat_messages FOR INSERT
    WITH CHECK (
        auth.uid() IN (
            SELECT company_id FROM team_assignments ta
            JOIN team_chats tc ON tc.team_assignment_id = ta.id
            WHERE tc.id = chat_id
        ) OR
        auth.uid() IN (
            SELECT developer_id FROM team_assignment_members tam
            JOIN team_chats tc ON tc.team_assignment_id = tam.team_assignment_id
            WHERE tc.id = chat_id
        )
    );

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers for updated_at
CREATE TRIGGER update_team_assignments_updated_at BEFORE UPDATE ON team_assignments
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_team_chats_updated_at BEFORE UPDATE ON team_chats
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
