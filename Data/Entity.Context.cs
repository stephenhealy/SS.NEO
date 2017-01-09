﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DB : DbContext
    {
        public DB()
            : base("name=DB")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Asset> Assets { get; set; }
        public DbSet<Carousel> Carousels { get; set; }
        public DbSet<EventLog> EventLogs { get; set; }
        public DbSet<Event> Events { get; set; }
        public DbSet<Key> Keys { get; set; }
        public DbSet<Lesson> Lessons { get; set; }
        public DbSet<LessonsRegister> LessonsRegisters { get; set; }
        public DbSet<Log> Logs { get; set; }
        public DbSet<LogDetail> LogDetails { get; set; }
        public DbSet<News> News { get; set; }
        public DbSet<Player> Players { get; set; }
        public DbSet<Position> Positions { get; set; }
        public DbSet<Session> Sessions { get; set; }
        public DbSet<SubscriptionMember> SubscriptionMembers { get; set; }
        public DbSet<Subscription> Subscriptions { get; set; }
        public DbSet<SubscriptionType> SubscriptionTypes { get; set; }
        public DbSet<Testimonial> Testimonials { get; set; }
        public DbSet<Tournament> Tournaments { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Seeking> Seekings { get; set; }
        public DbSet<PositionMember> PositionMembers { get; set; }
        public DbSet<EventRegistration> EventRegistrations { get; set; }
        public DbSet<Setting> Settings { get; set; }
        public DbSet<League> Leagues { get; set; }
        public DbSet<Clinic> Clinics { get; set; }
        public DbSet<PhotoAlbum> PhotoAlbums { get; set; }
        public DbSet<PhotoCategory> PhotoCategories { get; set; }
        public DbSet<Photo> Photos { get; set; }
        public DbSet<Sport> Sports { get; set; }
        public DbSet<AdvertisementClick> AdvertisementClicks { get; set; }
        public DbSet<Advertisement> Advertisements { get; set; }
        public DbSet<Bocce> Bocces { get; set; }
        public DbSet<Sidebar> Sidebars { get; set; }
        public DbSet<Sponsor> Sponsors { get; set; }
        public DbSet<HallOfFame> HallOfFames { get; set; }
    }
}
