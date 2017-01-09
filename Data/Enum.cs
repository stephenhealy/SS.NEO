using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public enum ParseDateTimeType
    {
        ShortDateTime,
        LongDateTime,
        LongDate,
        MonthDate,
        LongTime,
        ShortDate,
        ShortTime,
        AbbrDate,
    }
    public class LoggingKeys
    {
        // Also update Models.Common.LoadDictionary()
        public const string Advertisements = "Advertisements";
        public const string Bocce = "Bocce";
        public const string Carousel = "Carousel";
        public const string Clinics = "Clinics";
        public const string EventRegistration = "EventRegistration";
        public const string Events = "Events";
        public const string HallOfFame = "HallOfFame";
        public const string Leagues = "Leagues";
        public const string Lessons = "Lessons";
        public const string LessonsRegister = "LessonsRegister";
        public const string News = "News";
        public const string PhotoCategories = "PhotoCategories";
        public const string PhotoAlbums = "PhotoAlbums";
        public const string Photos = "Photos";
        public const string Positions = "Positions";
        public const string Sessions = "Sessions";
        public const string Sponsors = "Sponsors";
        public const string Sports = "Sports";
        public const string SubscriptionTypes = "SubscriptionTypes";
        public const string Testimonials = "Testimonials";
        public const string Tournaments = "Tournaments";
        public const string Users = "Users";
    }
}
