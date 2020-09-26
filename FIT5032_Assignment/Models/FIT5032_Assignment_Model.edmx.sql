
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/26/2020 20:34:37
-- Generated from EDMX file: D:\Documents\GitHub\FIT5032_Assignment\FIT5032_Assignment\Models\FIT5032_Assignment_Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FIT5032_Assignment];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TrainingCourseTrainingCourseTimetable]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainingCourseTimetables] DROP CONSTRAINT [FK_TrainingCourseTrainingCourseTimetable];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseTimetableTrainningCourseCoach]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainningCourseCoaches] DROP CONSTRAINT [FK_TrainingCourseTimetableTrainningCourseCoach];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseUserSkills]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSkills] DROP CONSTRAINT [FK_TrainingCourseUserSkills];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseCourseWishList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseWishLists] DROP CONSTRAINT [FK_TrainingCourseCourseWishList];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUser];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserCourseWishList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseWishLists] DROP CONSTRAINT [FK_AspNetUserCourseWishList];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserCourseBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseBookings] DROP CONSTRAINT [FK_AspNetUserCourseBooking];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserSubScribe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubScribes] DROP CONSTRAINT [FK_AspNetUserSubScribe];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserTrainingCourse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainingCourses] DROP CONSTRAINT [FK_AspNetUserTrainingCourse];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserUserSkills]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSkills] DROP CONSTRAINT [FK_AspNetUserUserSkills];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserTrainningCourseCoach]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainningCourseCoaches] DROP CONSTRAINT [FK_AspNetUserTrainningCourseCoach];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseCourseBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseBookings] DROP CONSTRAINT [FK_TrainingCourseCourseBooking];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TrainingCourses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrainingCourses];
GO
IF OBJECT_ID(N'[dbo].[TrainingCourseTimetables]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrainingCourseTimetables];
GO
IF OBJECT_ID(N'[dbo].[TrainningCourseCoaches]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrainningCourseCoaches];
GO
IF OBJECT_ID(N'[dbo].[CourseBookings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CourseBookings];
GO
IF OBJECT_ID(N'[dbo].[UserSkills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSkills];
GO
IF OBJECT_ID(N'[dbo].[CourseWishLists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CourseWishLists];
GO
IF OBJECT_ID(N'[dbo].[SubScribes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubScribes];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TrainingCourses'
CREATE TABLE [dbo].[TrainingCourses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [CourseCapacity] int  NOT NULL,
    [CourseHeldLocation] nvarchar(max)  NULL,
    [CourseDescribtion] nvarchar(max)  NULL,
    [IsOver] bit  NOT NULL,
    [Rate] smallint  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL,
    [PreRequestId] int  NULL,
    [PublishDate] datetime  NULL,
    [LocationLongitude] float  NULL,
    [LocationLatitude] float  NULL
);
GO

-- Creating table 'TrainingCourseTimetables'
CREATE TABLE [dbo].[TrainingCourseTimetables] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CourseStartTime] datetime  NOT NULL,
    [CourseEndTime] datetime  NOT NULL,
    [TrainingCourseId] int  NOT NULL,
    [IsLastOne] bit  NOT NULL
);
GO

-- Creating table 'TrainningCourseCoaches'
CREATE TABLE [dbo].[TrainningCourseCoaches] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TrainingCourseTimetableId] int  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'CourseBookings'
CREATE TABLE [dbo].[CourseBookings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Feedback] nvarchar(max)  NULL,
    [BookingTime] datetime  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL,
    [TrainingCourseId] int  NULL,
    [IsRated] bit  NOT NULL,
    [RatingScore] smallint  NOT NULL
);
GO

-- Creating table 'UserSkills'
CREATE TABLE [dbo].[UserSkills] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TrainingCourseId] int  NOT NULL,
    [SkillReceivedDate] nvarchar(max)  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'CourseWishLists'
CREATE TABLE [dbo].[CourseWishLists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InsertDate] datetime  NOT NULL,
    [TrainingCourseId] int  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'SubScribes'
CREATE TABLE [dbo].[SubScribes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SubscribeType] int  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RoleId] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'TrainingCourses'
ALTER TABLE [dbo].[TrainingCourses]
ADD CONSTRAINT [PK_TrainingCourses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TrainingCourseTimetables'
ALTER TABLE [dbo].[TrainingCourseTimetables]
ADD CONSTRAINT [PK_TrainingCourseTimetables]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TrainningCourseCoaches'
ALTER TABLE [dbo].[TrainningCourseCoaches]
ADD CONSTRAINT [PK_TrainningCourseCoaches]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CourseBookings'
ALTER TABLE [dbo].[CourseBookings]
ADD CONSTRAINT [PK_CourseBookings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserSkills'
ALTER TABLE [dbo].[UserSkills]
ADD CONSTRAINT [PK_UserSkills]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CourseWishLists'
ALTER TABLE [dbo].[CourseWishLists]
ADD CONSTRAINT [PK_CourseWishLists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubScribes'
ALTER TABLE [dbo].[SubScribes]
ADD CONSTRAINT [PK_SubScribes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id], [RoleId], [UserId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([Id], [RoleId], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TrainingCourseId] in table 'TrainingCourseTimetables'
ALTER TABLE [dbo].[TrainingCourseTimetables]
ADD CONSTRAINT [FK_TrainingCourseTrainingCourseTimetable]
    FOREIGN KEY ([TrainingCourseId])
    REFERENCES [dbo].[TrainingCourses]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseTrainingCourseTimetable'
CREATE INDEX [IX_FK_TrainingCourseTrainingCourseTimetable]
ON [dbo].[TrainingCourseTimetables]
    ([TrainingCourseId]);
GO

-- Creating foreign key on [TrainingCourseTimetableId] in table 'TrainningCourseCoaches'
ALTER TABLE [dbo].[TrainningCourseCoaches]
ADD CONSTRAINT [FK_TrainingCourseTimetableTrainningCourseCoach]
    FOREIGN KEY ([TrainingCourseTimetableId])
    REFERENCES [dbo].[TrainingCourseTimetables]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseTimetableTrainningCourseCoach'
CREATE INDEX [IX_FK_TrainingCourseTimetableTrainningCourseCoach]
ON [dbo].[TrainningCourseCoaches]
    ([TrainingCourseTimetableId]);
GO

-- Creating foreign key on [TrainingCourseId] in table 'UserSkills'
ALTER TABLE [dbo].[UserSkills]
ADD CONSTRAINT [FK_TrainingCourseUserSkills]
    FOREIGN KEY ([TrainingCourseId])
    REFERENCES [dbo].[TrainingCourses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseUserSkills'
CREATE INDEX [IX_FK_TrainingCourseUserSkills]
ON [dbo].[UserSkills]
    ([TrainingCourseId]);
GO

-- Creating foreign key on [TrainingCourseId] in table 'CourseWishLists'
ALTER TABLE [dbo].[CourseWishLists]
ADD CONSTRAINT [FK_TrainingCourseCourseWishList]
    FOREIGN KEY ([TrainingCourseId])
    REFERENCES [dbo].[TrainingCourses]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseCourseWishList'
CREATE INDEX [IX_FK_TrainingCourseCourseWishList]
ON [dbo].[CourseWishLists]
    ([TrainingCourseId]);
GO

-- Creating foreign key on [RoleId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetRoles'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetRoles]
ON [dbo].[AspNetUserRoles]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([UserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'CourseWishLists'
ALTER TABLE [dbo].[CourseWishLists]
ADD CONSTRAINT [FK_AspNetUserCourseWishList]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserCourseWishList'
CREATE INDEX [IX_FK_AspNetUserCourseWishList]
ON [dbo].[CourseWishLists]
    ([AspNetUserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'CourseBookings'
ALTER TABLE [dbo].[CourseBookings]
ADD CONSTRAINT [FK_AspNetUserCourseBooking]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserCourseBooking'
CREATE INDEX [IX_FK_AspNetUserCourseBooking]
ON [dbo].[CourseBookings]
    ([AspNetUserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'SubScribes'
ALTER TABLE [dbo].[SubScribes]
ADD CONSTRAINT [FK_AspNetUserSubScribe]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserSubScribe'
CREATE INDEX [IX_FK_AspNetUserSubScribe]
ON [dbo].[SubScribes]
    ([AspNetUserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'TrainingCourses'
ALTER TABLE [dbo].[TrainingCourses]
ADD CONSTRAINT [FK_AspNetUserTrainingCourse]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserTrainingCourse'
CREATE INDEX [IX_FK_AspNetUserTrainingCourse]
ON [dbo].[TrainingCourses]
    ([AspNetUserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'UserSkills'
ALTER TABLE [dbo].[UserSkills]
ADD CONSTRAINT [FK_AspNetUserUserSkills]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserUserSkills'
CREATE INDEX [IX_FK_AspNetUserUserSkills]
ON [dbo].[UserSkills]
    ([AspNetUserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'TrainningCourseCoaches'
ALTER TABLE [dbo].[TrainningCourseCoaches]
ADD CONSTRAINT [FK_AspNetUserTrainningCourseCoach]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserTrainningCourseCoach'
CREATE INDEX [IX_FK_AspNetUserTrainningCourseCoach]
ON [dbo].[TrainningCourseCoaches]
    ([AspNetUserId]);
GO

-- Creating foreign key on [TrainingCourseId] in table 'CourseBookings'
ALTER TABLE [dbo].[CourseBookings]
ADD CONSTRAINT [FK_TrainingCourseCourseBooking]
    FOREIGN KEY ([TrainingCourseId])
    REFERENCES [dbo].[TrainingCourses]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseCourseBooking'
CREATE INDEX [IX_FK_TrainingCourseCourseBooking]
ON [dbo].[CourseBookings]
    ([TrainingCourseId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------