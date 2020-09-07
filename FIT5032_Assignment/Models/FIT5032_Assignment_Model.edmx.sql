
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/07/2020 11:28:45
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
IF OBJECT_ID(N'[dbo].[FK_CoachTrainningCourseCoach]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainningCourseCoaches] DROP CONSTRAINT [FK_CoachTrainningCourseCoach];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseTimetableCourseBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseBookings] DROP CONSTRAINT [FK_TrainingCourseTimetableCourseBooking];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCourseBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseBookings] DROP CONSTRAINT [FK_UserCourseBooking];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseTrainingCourse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainingCourses] DROP CONSTRAINT [FK_TrainingCourseTrainingCourse];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserSkills]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSkills] DROP CONSTRAINT [FK_UserUserSkills];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseUserSkills]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSkills] DROP CONSTRAINT [FK_TrainingCourseUserSkills];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCourseWishList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseWishLists] DROP CONSTRAINT [FK_UserCourseWishList];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingCourseCourseWishList]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseWishLists] DROP CONSTRAINT [FK_TrainingCourseCourseWishList];
GO
IF OBJECT_ID(N'[dbo].[FK_BasicUserSubScribe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubScribes] DROP CONSTRAINT [FK_BasicUserSubScribe];
GO
IF OBJECT_ID(N'[dbo].[FK_BasicUserUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_BasicUserUserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_RoleUserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_Coach_inherits_BasicUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BasicUsers_Coach] DROP CONSTRAINT [FK_Coach_inherits_BasicUser];
GO
IF OBJECT_ID(N'[dbo].[FK_User_inherits_BasicUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BasicUsers_User] DROP CONSTRAINT [FK_User_inherits_BasicUser];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TrainingCourses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrainingCourses];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
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
IF OBJECT_ID(N'[dbo].[BasicUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BasicUsers];
GO
IF OBJECT_ID(N'[dbo].[UserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRoles];
GO
IF OBJECT_ID(N'[dbo].[BasicUsers_Coach]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BasicUsers_Coach];
GO
IF OBJECT_ID(N'[dbo].[BasicUsers_User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BasicUsers_User];
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
    [preRequestCourse_Id] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
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
    [CoachId] int  NOT NULL
);
GO

-- Creating table 'CourseBookings'
CREATE TABLE [dbo].[CourseBookings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TrainingCourseTimetableId] int  NOT NULL,
    [UserId] int  NOT NULL,
    [Feedback] nvarchar(max)  NULL,
    [BookingTime] datetime  NOT NULL
);
GO

-- Creating table 'UserSkills'
CREATE TABLE [dbo].[UserSkills] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [TrainingCourseId] int  NOT NULL,
    [SkillReceivedDate] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CourseWishLists'
CREATE TABLE [dbo].[CourseWishLists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InsertDate] datetime  NOT NULL,
    [UserId] int  NOT NULL,
    [TrainingCourseId] int  NOT NULL
);
GO

-- Creating table 'SubScribes'
CREATE TABLE [dbo].[SubScribes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SubscribeType] int  NOT NULL,
    [BasicUserId] int  NOT NULL
);
GO

-- Creating table 'BasicUsers'
CREATE TABLE [dbo].[BasicUsers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Birthday] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NOT NULL,
    [registerTime] datetime  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BasicUserId] int  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'BasicUsers_Coach'
CREATE TABLE [dbo].[BasicUsers_Coach] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'BasicUsers_User'
CREATE TABLE [dbo].[BasicUsers_User] (
    [Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
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

-- Creating primary key on [Id] in table 'BasicUsers'
ALTER TABLE [dbo].[BasicUsers]
ADD CONSTRAINT [PK_BasicUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BasicUsers_Coach'
ALTER TABLE [dbo].[BasicUsers_Coach]
ADD CONSTRAINT [PK_BasicUsers_Coach]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BasicUsers_User'
ALTER TABLE [dbo].[BasicUsers_User]
ADD CONSTRAINT [PK_BasicUsers_User]
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

-- Creating foreign key on [CoachId] in table 'TrainningCourseCoaches'
ALTER TABLE [dbo].[TrainningCourseCoaches]
ADD CONSTRAINT [FK_CoachTrainningCourseCoach]
    FOREIGN KEY ([CoachId])
    REFERENCES [dbo].[BasicUsers_Coach]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoachTrainningCourseCoach'
CREATE INDEX [IX_FK_CoachTrainningCourseCoach]
ON [dbo].[TrainningCourseCoaches]
    ([CoachId]);
GO

-- Creating foreign key on [TrainingCourseTimetableId] in table 'CourseBookings'
ALTER TABLE [dbo].[CourseBookings]
ADD CONSTRAINT [FK_TrainingCourseTimetableCourseBooking]
    FOREIGN KEY ([TrainingCourseTimetableId])
    REFERENCES [dbo].[TrainingCourseTimetables]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseTimetableCourseBooking'
CREATE INDEX [IX_FK_TrainingCourseTimetableCourseBooking]
ON [dbo].[CourseBookings]
    ([TrainingCourseTimetableId]);
GO

-- Creating foreign key on [UserId] in table 'CourseBookings'
ALTER TABLE [dbo].[CourseBookings]
ADD CONSTRAINT [FK_UserCourseBooking]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[BasicUsers_User]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCourseBooking'
CREATE INDEX [IX_FK_UserCourseBooking]
ON [dbo].[CourseBookings]
    ([UserId]);
GO

-- Creating foreign key on [preRequestCourse_Id] in table 'TrainingCourses'
ALTER TABLE [dbo].[TrainingCourses]
ADD CONSTRAINT [FK_TrainingCourseTrainingCourse]
    FOREIGN KEY ([preRequestCourse_Id])
    REFERENCES [dbo].[TrainingCourses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseTrainingCourse'
CREATE INDEX [IX_FK_TrainingCourseTrainingCourse]
ON [dbo].[TrainingCourses]
    ([preRequestCourse_Id]);
GO

-- Creating foreign key on [UserId] in table 'UserSkills'
ALTER TABLE [dbo].[UserSkills]
ADD CONSTRAINT [FK_UserUserSkills]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[BasicUsers_User]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserSkills'
CREATE INDEX [IX_FK_UserUserSkills]
ON [dbo].[UserSkills]
    ([UserId]);
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

-- Creating foreign key on [UserId] in table 'CourseWishLists'
ALTER TABLE [dbo].[CourseWishLists]
ADD CONSTRAINT [FK_UserCourseWishList]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[BasicUsers_User]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCourseWishList'
CREATE INDEX [IX_FK_UserCourseWishList]
ON [dbo].[CourseWishLists]
    ([UserId]);
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

-- Creating foreign key on [BasicUserId] in table 'SubScribes'
ALTER TABLE [dbo].[SubScribes]
ADD CONSTRAINT [FK_BasicUserSubScribe]
    FOREIGN KEY ([BasicUserId])
    REFERENCES [dbo].[BasicUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BasicUserSubScribe'
CREATE INDEX [IX_FK_BasicUserSubScribe]
ON [dbo].[SubScribes]
    ([BasicUserId]);
GO

-- Creating foreign key on [BasicUserId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_BasicUserUserRole]
    FOREIGN KEY ([BasicUserId])
    REFERENCES [dbo].[BasicUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BasicUserUserRole'
CREATE INDEX [IX_FK_BasicUserUserRole]
ON [dbo].[UserRoles]
    ([BasicUserId]);
GO

-- Creating foreign key on [RoleId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_RoleUserRole]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleUserRole'
CREATE INDEX [IX_FK_RoleUserRole]
ON [dbo].[UserRoles]
    ([RoleId]);
GO

-- Creating foreign key on [Id] in table 'BasicUsers_Coach'
ALTER TABLE [dbo].[BasicUsers_Coach]
ADD CONSTRAINT [FK_Coach_inherits_BasicUser]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[BasicUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'BasicUsers_User'
ALTER TABLE [dbo].[BasicUsers_User]
ADD CONSTRAINT [FK_User_inherits_BasicUser]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[BasicUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------