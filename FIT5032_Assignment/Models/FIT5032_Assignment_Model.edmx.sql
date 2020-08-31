
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/31/2020 22:16:51
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


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

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Birthday] datetime  NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Coaches'
CREATE TABLE [dbo].[Coaches] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Birthday] datetime  NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'CoachRoles'
CREATE TABLE [dbo].[CoachRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CoachId] int  NOT NULL,
    [RoleId] int  NOT NULL
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
    [SubscribeEmail] nvarchar(max)  NOT NULL,
    [SubscribeType] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Coaches'
ALTER TABLE [dbo].[Coaches]
ADD CONSTRAINT [PK_Coaches]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CoachRoles'
ALTER TABLE [dbo].[CoachRoles]
ADD CONSTRAINT [PK_CoachRoles]
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

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CoachId] in table 'CoachRoles'
ALTER TABLE [dbo].[CoachRoles]
ADD CONSTRAINT [FK_CoachCoachRole]
    FOREIGN KEY ([CoachId])
    REFERENCES [dbo].[Coaches]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoachCoachRole'
CREATE INDEX [IX_FK_CoachCoachRole]
ON [dbo].[CoachRoles]
    ([CoachId]);
GO

-- Creating foreign key on [RoleId] in table 'CoachRoles'
ALTER TABLE [dbo].[CoachRoles]
ADD CONSTRAINT [FK_RoleCoachRole]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleCoachRole'
CREATE INDEX [IX_FK_RoleCoachRole]
ON [dbo].[CoachRoles]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserUserRole]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserRole'
CREATE INDEX [IX_FK_UserUserRole]
ON [dbo].[UserRoles]
    ([UserId]);
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

-- Creating foreign key on [TrainingCourseId] in table 'TrainingCourseTimetables'
ALTER TABLE [dbo].[TrainingCourseTimetables]
ADD CONSTRAINT [FK_TrainingCourseTrainingCourseTimetable]
    FOREIGN KEY ([TrainingCourseId])
    REFERENCES [dbo].[TrainingCourses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
    REFERENCES [dbo].[Coaches]
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
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingCourseCourseWishList'
CREATE INDEX [IX_FK_TrainingCourseCourseWishList]
ON [dbo].[CourseWishLists]
    ([TrainingCourseId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------