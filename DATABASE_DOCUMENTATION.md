# DOKUMENTASI DATABASE VENA PICTURES
## Photography/Videography Business Management System

![Database Schema](https://img.shields.io/badge/Database-PostgreSQL-336791)
![Tables](https://img.shields.io/badge/Tables-48-blue)
![Relationships](https://img.shields.io/badge/Relationships-Multi--tenant-green)

---

## 📋 DAFTAR ISI

1. [Gambaran Umum](#gambaran-umum)
2. [Arsitektur Database](#arsitektur-database)
3. [Entitas Utama & Hubungan](#entitas-utama--hubungan)
4. [Detail Tabel](#detail-tabel)
5. [Mock Data Overview](#mock-data-overview)
6. [Query Examples](#query-examples)
7. [Indexes & Performance](#indexes--performance)

---

## 🎯 GAMBARAN UMUM

**Vena Pictures Database** adalah sistem database PostgreSQL yang dirancang untuk mengelola bisnis fotografi/videografi secara komprehensif. Database ini mendukung multi-tenancy dan mencakup:

### Core Features:
- ✅ **Multi-tenant Architecture** - Mendukung multiple organizations
- ✅ **Client & Lead Management** - CRM lengkap dengan lead tracking
- ✅ **Project Management** - Advanced project tracking dengan sub-status
- ✅ **Team & Freelancer Management** - Payment tracking & performance notes
- ✅ **Financial Management** - Multi-card system dengan pocket budgeting
- ✅ **Asset Management** - Equipment tracking
- ✅ **Contract Management** - Digital contracts dengan e-signature
- ✅ **Social Media Planning** - Content scheduling
- ✅ **Knowledge Management** - SOPs dan templates
- ✅ **Notification System** - Real-time alerts
- ✅ **Calendar Integration** - Event scheduling

---

## 🏗️ ARSITEKTUR DATABASE

### Multi-Tenant Design
```
Organizations (Root Level)
├── Users & Permissions
├── Clients & Projects  
├── Team Members
├── Financial Data
├── Assets & SOPs
└── Settings
```

### Normalisasi
- **3NF (Third Normal Form)** - Menghindari redundansi data
- **Foreign Key Constraints** - Memastikan integritas referensial
- **Check Constraints** - Validasi data pada level database
- **Triggers** - Auto-update timestamps

---

## 🔗 ENTITAS UTAMA & HUBUNGAN

### 1. **CORE SYSTEM**
```sql
organizations (1) ──── (M) users
organizations (1) ──── (M) organization_profiles
users (1) ──────────── (M) user_permissions
```

### 2. **CLIENT MANAGEMENT**
```sql
organizations (1) ──── (M) leads
organizations (1) ──── (M) clients
clients (1) ─────────── (M) projects
```

### 3. **PROJECT ECOSYSTEM**
```sql
projects (1) ────────── (M) project_add_ons
projects (1) ────────── (M) project_team_assignments
projects (1) ────────── (M) project_revisions
projects (1) ────────── (M) project_chat_messages
```

### 4. **FINANCIAL SYSTEM**
```sql
organizations (1) ──── (M) financial_cards
organizations (1) ──── (M) financial_pockets
organizations (1) ──── (M) financial_transactions
financial_pockets (1) ─ (M) financial_pocket_members
```

### 5. **TEAM MANAGEMENT**
```sql
organizations (1) ──── (M) team_members
team_members (1) ────── (M) team_performance_notes
team_members (1) ────── (M) team_project_payments
team_members (1) ────── (M) reward_ledger_entries
```

---

## 📊 DETAIL TABEL

### 🏢 **CORE SYSTEM TABLES (10 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `organizations` | UUID | 3 | Multi-tenant root |
| `users` | UUID | 3 | System users |
| `user_permissions` | UUID | 5 | Role-based permissions |
| `organization_profiles` | UUID | 1 | Company settings |
| `income_categories` | UUID | 6 | Income categorization |
| `expense_categories` | UUID | 9 | Expense categorization |
| `project_types` | UUID | 7 | Project classifications |
| `event_types` | UUID | 6 | Calendar event types |
| `asset_categories` | UUID | 7 | Asset classifications |
| `sop_categories` | UUID | 5 | SOP classifications |

### 👥 **CLIENT MANAGEMENT (2 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `leads` | UUID | 5 | Prospect tracking |
| `clients` | UUID | 10 | Client database |

**Key Features:**
- Lead conversion tracking
- Client status lifecycle
- Contact channel attribution
- Portal access management

### 🎯 **PROJECT MANAGEMENT (10 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `projects` | UUID | 11 | Main projects |
| `project_add_ons` | UUID | 4 | Project add-ons |
| `project_team_assignments` | UUID | 14 | Team assignments |
| `project_active_sub_statuses` | UUID | 3 | Current sub-status |
| `project_confirmed_sub_statuses` | UUID | 0 | Client confirmations |
| `project_sub_status_confirmations` | UUID | 0 | Confirmation tracking |
| `project_completed_digital_items` | UUID | 0 | Deliverable tracking |
| `project_custom_sub_statuses` | UUID | 0 | Custom workflows |
| `project_revisions` | UUID | 2 | Revision management |
| `project_chat_messages` | UUID | 5 | Communication log |

**Advanced Features:**
- Dynamic status workflows
- Client confirmation tracking
- Revision management
- Real-time chat integration

### 👨‍💼 **TEAM MANAGEMENT (5 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `team_members` | UUID | 8 | Freelancer database |
| `team_performance_notes` | UUID | 5 | Performance tracking |
| `team_project_payments` | UUID | 14 | Individual payments |
| `team_payment_records` | UUID | 4 | Batch payments |
| `team_payment_record_items` | UUID | 6 | Payment linkage |

**Payment Features:**
- Individual project payments
- Batch payment processing
- Reward system integration
- Performance evaluation

### 💰 **FINANCIAL MANAGEMENT (6 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `financial_cards` | UUID | 5 | Account management |
| `financial_pockets` | UUID | 5 | Budget allocation |
| `financial_pocket_members` | UUID | 5 | Shared budgets |
| `financial_transactions` | UUID | 14 | Transaction log |
| `reward_ledger_entries` | UUID | 5 | Reward tracking |

**Advanced Financial Features:**
- Multi-card management
- Pocket budgeting system
- Reward point system
- Transaction categorization

### 📦 **PACKAGE MANAGEMENT (5 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `packages` | UUID | 7 | Service packages |
| `package_physical_items` | UUID | 7 | Physical deliverables |
| `package_digital_items` | UUID | 14 | Digital deliverables |
| `add_ons` | UUID | 7 | Additional services |

### 📋 **CONTRACT & ASSETS (3 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `contracts` | UUID | 3 | Digital contracts |
| `assets` | UUID | 10 | Equipment tracking |
| `promo_codes` | UUID | 4 | Discount management |

### 📱 **SOCIAL & COMMUNICATION (8 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `social_media_posts` | UUID | 7 | Content planning |
| `sops` | UUID | 4 | Standard procedures |
| `chat_templates` | UUID | 5 | Message templates |
| `client_feedback` | UUID | 5 | Satisfaction tracking |
| `freelancer_feedback` | UUID | 3 | Team feedback |
| `notifications` | UUID | 5 | Alert system |
| `calendar_events` | UUID | 6 | Event scheduling |

### ⚙️ **CONFIGURATION (5 tables)**

| Tabel | Primary Key | Records | Deskripsi |
|-------|------------|---------|-----------|
| `project_status_configs` | UUID | 8 | Workflow states |
| `project_sub_status_configs` | UUID | 9 | Sub-workflows |
| `public_page_configs` | UUID | 1 | Website settings |
| `notification_settings` | UUID | 1 | Alert preferences |
| `security_settings` | UUID | 1 | Security options |

---

## 📁 MOCK DATA OVERVIEW

### **Data Volume Summary**
- **Total Tables**: 48
- **Total Mock Records**: ~200+
- **Organizations**: 3 (Vena Pictures, Momen Studio, Capture Dreams)
- **Users**: 3 (1 Admin, 2 Members)
- **Clients**: 10 (Mix of individuals and companies)
- **Projects**: 11 (Various stages from preparation to completed)
- **Team Members**: 8 (Different roles and specialties)

### **Realistic Business Scenarios**

#### 🎭 **Project Lifecycle Examples**

1. **Completed Wedding** (Budi & Sinta)
   - Status: Selesai (100%)
   - Payment: Lunas (Rp 26.5M)
   - Team: 3 members with rewards
   - Add-ons: Drone shooting
   - Contract: Fully signed

2. **Ongoing Corporate Event** (PT Sejahtera Abadi)
   - Status: Editing (60%)
   - Payment: DP Terbayar (Rp 4M/8M)
   - Active Sub-status: Color Grading Video
   - Add-ons: Live Streaming Setup

3. **Revision Stage** (Farhan & Aisyah Prewedding)
   - Status: Revisi (80%)
   - Revision: Tone warna lebih warm
   - Location: Bromo, Jawa Timur
   - Challenge: Transport cost Rp 500K

#### 💼 **Financial Scenarios**

1. **Multi-Card System**
   - BCA Debit: Rp 52.5M (Primary business)
   - Mandiri Credit: -Rp 2.5M (Operational)
   - Cash: Rp 5M (Petty cash)

2. **Pocket Budgeting**
   - Tax Reserve: Rp 5M (Locked until March 2025)
   - Equipment Saving: Rp 8.5M/40M goal
   - Freelancer Reward Pool: Rp 500K

#### 🤝 **Team Management**

1. **Performance Tracking**
   - Andi Pratama: 4.8★ rating, Rp 250K rewards
   - Fira Anjani: 5.0★ rating (MUA specialist)
   - Performance notes include praise and concerns

2. **Payment Processing**
   - Individual project payments tracked
   - Batch payment records with signatures
   - Reward ledger with positive/negative entries

---

## 🔍 QUERY EXAMPLES

### **Business Intelligence Queries**

#### 1. Revenue Analysis
```sql
-- Monthly revenue breakdown
SELECT 
    DATE_TRUNC('month', transaction_date) as month,
    SUM(amount) as revenue,
    COUNT(*) as transaction_count
FROM financial_transactions 
WHERE transaction_type = 'Pemasukan'
    AND organization_id = '550e8400-e29b-41d4-a716-446655440000'
GROUP BY month
ORDER BY month DESC;
```

#### 2. Project Performance
```sql
-- Projects by status with financial summary
SELECT 
    p.status,
    COUNT(*) as project_count,
    SUM(p.total_cost) as total_value,
    SUM(p.amount_paid) as total_paid,
    AVG(p.progress) as avg_progress
FROM projects p
WHERE p.organization_id = '550e8400-e29b-41d4-a716-446655440000'
GROUP BY p.status
ORDER BY total_value DESC;
```

#### 3. Team Performance
```sql
-- Team member performance with earnings
SELECT 
    tm.name,
    tm.role,
    tm.rating,
    COUNT(pta.id) as project_count,
    SUM(pta.fee) as total_earnings,
    SUM(pta.reward) as total_rewards
FROM team_members tm
LEFT JOIN project_team_assignments pta ON tm.id = pta.team_member_id
WHERE tm.organization_id = '550e8400-e29b-41d4-a716-446655440000'
GROUP BY tm.id, tm.name, tm.role, tm.rating
ORDER BY total_earnings DESC;
```

#### 4. Client Acquisition Analysis
```sql
-- Lead conversion funnel
SELECT 
    contact_channel,
    COUNT(*) as total_leads,
    COUNT(CASE WHEN status = 'Dikonversi' THEN 1 END) as converted,
    ROUND(
        100.0 * COUNT(CASE WHEN status = 'Dikonversi' THEN 1 END) / COUNT(*), 
        2
    ) as conversion_rate
FROM leads
WHERE organization_id = '550e8400-e29b-41d4-a716-446655440000'
GROUP BY contact_channel
ORDER BY conversion_rate DESC;
```

### **Operational Queries**

#### 5. Active Projects Dashboard
```sql
-- Current active projects with team and status
SELECT 
    p.project_name,
    c.name as client_name,
    p.status,
    p.progress,
    p.deadline_date,
    string_agg(tm.name, ', ') as team_members,
    string_agg(pas.sub_status_name, ', ') as active_substatus
FROM projects p
JOIN clients c ON p.client_id = c.id
LEFT JOIN project_team_assignments pta ON p.id = pta.project_id
LEFT JOIN team_members tm ON pta.team_member_id = tm.id
LEFT JOIN project_active_sub_statuses pas ON p.id = pas.project_id
WHERE p.status NOT IN ('Selesai', 'Dibatalkan')
    AND p.organization_id = '550e8400-e29b-41d4-a716-446655440000'
GROUP BY p.id, p.project_name, c.name, p.status, p.progress, p.deadline_date
ORDER BY p.deadline_date ASC NULLS LAST;
```

#### 6. Financial Health Check
```sql
-- Current financial position
SELECT 
    'Cards' as category,
    SUM(balance) as total_amount
FROM financial_cards 
WHERE organization_id = '550e8400-e29b-41d4-a716-446655440000'
    AND is_active = true

UNION ALL

SELECT 
    'Pockets' as category,
    SUM(amount) as total_amount
FROM financial_pockets
WHERE organization_id = '550e8400-e29b-41d4-a716-446655440000'
    AND is_active = true

ORDER BY category;
```

---

## 📈 INDEXES & PERFORMANCE

### **Primary Indexes**
- All tables have UUID primary keys with auto-generated values
- Foreign key constraints automatically create indexes

### **Business Logic Indexes**
```sql
-- Organization-based queries
CREATE INDEX idx_clients_organization_id ON clients(organization_id);
CREATE INDEX idx_projects_organization_id ON projects(organization_id);

-- Status-based filtering
CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_leads_status ON leads(status);

-- Date-based queries
CREATE INDEX idx_projects_date ON projects(date);
CREATE INDEX idx_financial_transactions_date ON financial_transactions(transaction_date);

-- Portal access
CREATE INDEX idx_clients_portal_access_id ON clients(portal_access_id);
CREATE INDEX idx_team_members_portal_access_id ON team_members(portal_access_id);
```

### **Performance Considerations**
1. **Partitioning**: Consider date-based partitioning for large transaction tables
2. **Archiving**: Archive old projects and financial data annually
3. **Connection Pooling**: Use pgBouncer for connection management
4. **Read Replicas**: Consider read replicas for reporting queries

---

## 🔒 SECURITY FEATURES

### **Data Protection**
- **Row Level Security (RLS)**: Multi-tenant isolation
- **Foreign Key Constraints**: Data integrity
- **Check Constraints**: Data validation
- **Encrypted Passwords**: bcrypt hashing

### **Access Control**
- **Role-based permissions** via `user_permissions` table
- **Portal access control** for clients and freelancers
- **Organization isolation** prevents cross-tenant data access

---

## 🚀 DEPLOYMENT NOTES

### **Database Setup**
1. Create PostgreSQL database
2. Run `database_schema.sql` for table creation
3. Run `database_mock_data.sql` for sample data
4. Verify all foreign key constraints
5. Run sample queries to validate setup

### **Environment Variables**
```env
DATABASE_URL=postgresql://user:password@localhost:5432/vena_pictures
DATABASE_SSL_MODE=require
DATABASE_POOL_SIZE=20
```

### **Monitoring**
- Monitor query performance with `pg_stat_statements`
- Set up alerts for long-running queries
- Regular VACUUM and ANALYZE operations
- Monitor disk usage and plan for growth

---

## 📚 ADDITIONAL RESOURCES

### **Related Documentation**
- [API Documentation](./API_DOCS.md)
- [Frontend Integration Guide](./FRONTEND_GUIDE.md)
- [Deployment Guide](./DEPLOYMENT.md)

### **Tools & Libraries**
- **Database**: PostgreSQL 14+
- **Migration Tool**: Prisma/TypeORM/Raw SQL
- **Connection**: pg (Node.js) / asyncpg (Python)
- **Monitoring**: pg_stat_monitor, DataDog

---

## 📞 SUPPORT & CONTACT

Untuk pertanyaan teknis atau dukungan implementasi:
- **Email**: tech@venapictures.com  
- **Documentation**: GitHub Wiki
- **Issues**: GitHub Issues

---

*Dokumentasi ini dibuat pada September 2024 untuk Vena Pictures Database v1.0*

**Status**: ✅ Production Ready  
**Last Updated**: September 12, 2024  
**Version**: 1.0.0
