-- File Sharing Tables for Team Assignments

-- Table for shared files
CREATE TABLE IF NOT EXISTS shared_files (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    assignment_id UUID NOT NULL REFERENCES team_assignments(id) ON DELETE CASCADE,
    shared_by UUID NOT NULL REFERENCES auth.users(id),
    file_name TEXT NOT NULL,
    file_url TEXT NOT NULL,
    file_size BIGINT,
    file_type TEXT,
    shared_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Table for shared links
CREATE TABLE IF NOT EXISTS shared_links (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    assignment_id UUID NOT NULL REFERENCES team_assignments(id) ON DELETE CASCADE,
    shared_by UUID NOT NULL REFERENCES auth.users(id),
    link_url TEXT NOT NULL,
    link_description TEXT,
    shared_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Indexes for better performance
CREATE INDEX IF NOT EXISTS idx_shared_files_assignment ON shared_files(assignment_id);
CREATE INDEX IF NOT EXISTS idx_shared_files_shared_by ON shared_files(shared_by);
CREATE INDEX IF NOT EXISTS idx_shared_links_assignment ON shared_links(assignment_id);
CREATE INDEX IF NOT EXISTS idx_shared_links_shared_by ON shared_links(shared_by);

-- Enable Row Level Security
ALTER TABLE shared_files ENABLE ROW LEVEL SECURITY;
ALTER TABLE shared_links ENABLE ROW LEVEL SECURITY;

-- RLS Policies for shared_files
CREATE POLICY "Users can view files in their team assignments"
    ON shared_files FOR SELECT
    USING (
        assignment_id IN (
            SELECT id FROM team_assignments
            WHERE company_id = auth.uid()
            OR id IN (
                SELECT assignment_id FROM team_assignment_members
                WHERE developer_id = auth.uid()
            )
        )
    );

CREATE POLICY "Users can insert files in their team assignments"
    ON shared_files FOR INSERT
    WITH CHECK (
        assignment_id IN (
            SELECT id FROM team_assignments
            WHERE company_id = auth.uid()
            OR id IN (
                SELECT assignment_id FROM team_assignment_members
                WHERE developer_id = auth.uid()
            )
        )
    );

CREATE POLICY "Users can delete their own shared files"
    ON shared_files FOR DELETE
    USING (shared_by = auth.uid());

-- RLS Policies for shared_links
CREATE POLICY "Users can view links in their team assignments"
    ON shared_links FOR SELECT
    USING (
        assignment_id IN (
            SELECT id FROM team_assignments
            WHERE company_id = auth.uid()
            OR id IN (
                SELECT assignment_id FROM team_assignment_members
                WHERE developer_id = auth.uid()
            )
        )
    );

CREATE POLICY "Users can insert links in their team assignments"
    ON shared_links FOR INSERT
    WITH CHECK (
        assignment_id IN (
            SELECT id FROM team_assignments
            WHERE company_id = auth.uid()
            OR id IN (
                SELECT assignment_id FROM team_assignment_members
                WHERE developer_id = auth.uid()
            )
        )
    );

CREATE POLICY "Users can delete their own shared links"
    ON shared_links FOR DELETE
    USING (shared_by = auth.uid());
