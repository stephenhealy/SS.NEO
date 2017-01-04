using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class DB : DbContext
    {
        public int LogID { get; set; }
        public List<string> Exclusions = new List<string>(new string[] { "ID", "CREATEDBY", "CREATEDON", "LATEST" });
        public List<string> SaveChanges(string title, int assetid, int createdBy)
        {
            return SaveChanges(title, assetid, createdBy, false);
        }

        /// <summary>
        /// This function overrides the normal entity framework function and should be used where logging is required
        /// </summary>
        /// <param name="title">The key of the log - such as Controls, Pages, etc..</param>
        /// <param name="assetid">(Optional) - either 0 or the ID of the asset being modified</param>
        /// <param name="createdBy">The UserID of the person modifying the record</param>
        /// <returns></returns>
        public List<string> SaveChanges()
        {
            List<string> errors = new List<string>();
            try
            {
                base.SaveChanges();
            }
            catch (DbEntityValidationException z)
            {
                try
                {
                    Logging Logging = new Logging();
                    errors = Logging.Errors(z);
                }
                catch { }
            }
            return errors;
        }
        public List<string> SaveChanges(string title, int assetid, int createdBy, bool always)
        {
            Logging Logging = new Logging();
            List<DbEntityEntry> entries = this.ChangeTracker.Entries().Where(e => e.State != System.Data.EntityState.Unchanged).ToList();
            if (always)
            {
                // First, add the assetid
                Logging.Add("AssetID", "", assetid.ToString());
            }
            foreach (var entry in entries)
            {
                var currentValues = entry.CurrentValues;
                if (entry.State == System.Data.EntityState.Added)
                {
                    foreach (string modifiedProperty in currentValues.PropertyNames)
                    {
                        if (Exclusions.Exists(o => o.Equals(modifiedProperty.ToUpper())) == false)
                        {
                            if (currentValues[modifiedProperty] != null)
                                Logging.Add(modifiedProperty, "", currentValues.GetValue<object>(modifiedProperty).ToString());
                        }
                    }
                }
                else
                {
                    var originalValues = entry.OriginalValues;
                    foreach (string modifiedProperty in currentValues.PropertyNames)
                    {
                        if (Exclusions.Exists(o => o.Equals(modifiedProperty.ToUpper())) == false
                            && !object.Equals(originalValues.GetValue<object>(modifiedProperty),
                                         currentValues.GetValue<object>(modifiedProperty)))
                        {
                            if (always == false && Logging.details.Count == 0 && assetid > 0)
                            {
                                // First, add the assetid
                                Logging.Add("AssetId", "", assetid.ToString());
                            }
                            string original = "";
                            if (originalValues.GetValue<object>(modifiedProperty) != null)
                                original = originalValues.GetValue<object>(modifiedProperty).ToString();
                            if (currentValues.GetValue<object>(modifiedProperty) != null)
                                Logging.Add(modifiedProperty, original,
                                    currentValues.GetValue<object>(modifiedProperty).ToString());
                            else
                                Logging.Add(modifiedProperty, original, "");
                        }
                    }
                }
            }
            List<string> errors = new List<string>();
            if (always || Logging.details.Count > 0)
                errors = Logging.Save(title, assetid, createdBy, this);
            try
            {
                base.SaveChanges();
            }
            catch (DbEntityValidationException z)
            {
                errors = Logging.Errors(z);
            }
            LogID = Logging.LogID;
            return errors;
        }
    }
}
