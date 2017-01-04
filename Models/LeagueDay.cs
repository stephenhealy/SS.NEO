using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class LeagueDay
    {
        public List<LeagueDayOfWeek> Week { get; set; }
        public LeagueDay()
        {
            Week = new List<LeagueDayOfWeek>();
            Week.Add(new LeagueDayOfWeek() { Name = "Monday", Number = 1 });
            Week.Add(new LeagueDayOfWeek() { Name = "Tuesday", Number = 2 });
            Week.Add(new LeagueDayOfWeek() { Name = "Wednesday", Number = 3 });
            Week.Add(new LeagueDayOfWeek() { Name = "Thursday", Number = 4 });
            Week.Add(new LeagueDayOfWeek() { Name = "Friday", Number = 5 });
            Week.Add(new LeagueDayOfWeek() { Name = "Sunday", Number = 7 });
        }
    }
    public class LeagueDayOfWeek
    {
        public string Name { get; set; }
        public int Number { get; set; }
    }
}
