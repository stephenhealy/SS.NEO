using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Repository<T> where T : class
    {
        private DB db = new DB();
        protected DbSet<T> DbSet { get; set; }
        public Repository()
        {
            DbSet = db.Set<T>();
        }
        public T Get(int AssetID)
        {
            return DbSet.Find(AssetID);
        }
        public T Add(T entity)
        {
            return DbSet.Add(entity);
        }
        public int SaveChanges()
        {
            return db.SaveChanges();
        }

        public int Restore(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                T item = Get(master.AssetID);
                if (item != null)
                {
                    update(item, false);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Sport item = master.db.Sports.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        update(item, false);
                        total++;
                    }
                }
            }
            return total;
        }

        public int Purge(string _records)
        {
            int total = 0;
            if (master.AssetID > 0)
            {
                Data.Sport item = master.Selector.Sport(master.AssetID);
                if (item != null)
                {
                    master.db.Sports.Remove(item);
                    total = 1;
                }
            }
            else
            {
                string[] records = _records.Split(new char[] { ',' });
                foreach (string record in records)
                {
                    int id = Statics.ParseInt(record);
                    Data.Sport item = master.db.Sports.FirstOrDefault(x => x.AssetID == id && x.Deleted == false);
                    if (item != null)
                    {
                        master.db.Sports.Remove(item);
                        total++;
                    }
                }
            }
            master.db.SaveChanges();
            return total;
        }

    }
}
