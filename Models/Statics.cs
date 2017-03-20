using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Models
{
    public class Statics
    {
        public static Regex AlphaNumericOnly = new Regex("[^a-zA-Z0-9]");
        public const string letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        public const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456780";
        public const string nums = "0123456780";
        public static int ParseInt(int? _value)
        {
            int intReturn = 0;
            if (_value != null)
                intReturn = ParseInt(_value.ToString());
            return intReturn;
        }
        public static int ParseInt(string _value)
        {
            int intReturn = 0;
            Int32.TryParse(_value, out intReturn);
            return intReturn;
        }
        public static int ParseInt(double _value)
        {
            int intReturn = 0;
            _value = Math.Round(Convert.ToDouble(_value));
            Int32.TryParse(_value.ToString(), out intReturn);
            return intReturn;
        }
        public static double ParseDouble(string _value)
        {
            double dblReturn = 0.00;
            double.TryParse(_value, out dblReturn);
            return dblReturn;
        }
        public static DateTime ParseDateTime(string _value)
        {
            return ParseDateTime(_value, false);
        }
        public static DateTime ParseDateTime(string _value, bool _convert_to_utc)
        {
            DateTime datReturn = DateTime.MinValue;
            DateTime.TryParse(_value, out datReturn);
            if (_convert_to_utc)
                return DateTimeUTC(datReturn);
            else
                return datReturn;
        }
        public static DateTime DateTimeToDateTime(string _value, string _timezone)
        {
            DateTime datReturn = DateTime.UtcNow;
            DateTime.TryParse(_value, out datReturn);
            return datReturn;
        }
        public static string DateTimeToString(object _value, ParseDateTimeType _type, string _timezone)
        {
            if (_value != null)
                return DateTimeToString(_value.ToString(), _type, _timezone);
            else
                return "";
        }
        public static string DateTimeToString(string _value, ParseDateTimeType _type, string _timezone)
        {
            DateTime datReturn = DateTime.UtcNow;
            if (DateTime.TryParse(_value, out datReturn) == true)
                return DateTimeToString(datReturn, _type, _timezone);
            else
                return "";
        }
        public static string DateTimeToString(DateTime? datReturn, ParseDateTimeType _type, string _timezone)
        {
            DateTime datZone = DateTimeZone(datReturn, _timezone);
            return DateTimeToString(datZone, _type);
        }
        public static string DateTimeToString(object _value, ParseDateTimeType _type)
        {
            if (_value != null)
            {
                try { return DateTimeToString(DateTime.Parse(_value.ToString()), _type); }
                catch { return ""; }
            }
            else
                return "";
        }
        public static string DateTimeToString(DateTime datReturn, ParseDateTimeType _type)
        {
            string strReturn = "";
            switch (_type)
            {
                case ParseDateTimeType.ShortDateTime:
                    strReturn = datReturn.ToString();
                    break;
                case ParseDateTimeType.LongDateTime:
                    strReturn = datReturn.ToLongDateString() + " at " + datReturn.ToLongTimeString();
                    break;
                case ParseDateTimeType.LongDate:
                    strReturn = datReturn.ToLongDateString();
                    break;
                case ParseDateTimeType.MonthDate:
                    strReturn = datReturn.ToLongDateString().Substring(datReturn.ToLongDateString().IndexOf(",") + 1).Trim();
                    break;
                case ParseDateTimeType.LongTime:
                    strReturn = datReturn.ToLongTimeString();
                    break;
                case ParseDateTimeType.ShortDate:
                    strReturn = datReturn.ToShortDateString();
                    break;
                case ParseDateTimeType.ShortTime:
                    strReturn = datReturn.ToShortTimeString();
                    break;
                case ParseDateTimeType.AbbrDate:
                    strReturn = datReturn.ToString("MMM", CultureInfo.InvariantCulture) + " " + datReturn.Day.ToString() + ", " + datReturn.Year.ToString();
                    break;
            }
            return strReturn;
        }
        public static bool ParseBool(string _value)
        {
            bool boolReturn = false;
            bool.TryParse(_value, out boolReturn);
            return boolReturn;
        }
        public static bool ParseBool(bool? _value)
        {
            bool boolReturn = false;
            if (_value != null)
                boolReturn = (bool)_value;
            return boolReturn;
        }
        public static bool IsBitTrue(string _value)
        {
            return (_value == "True");
        }
        public static string encryptQueryString(string strQueryString)
        {
            return (Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(strQueryString)));
        }
        public static string decryptQueryString(string strQueryString)
        {
            try
            {
                return System.Text.ASCIIEncoding.ASCII.GetString(Convert.FromBase64String(strQueryString));
            }
            catch
            {
                return "";
            }
        }
        public static string Now(string _timezone)
        {
            DateTime _now = DateTimeZone(DateTime.UtcNow, _timezone);
            return _now.Day.ToString() + _now.Month.ToString() + _now.Year.ToString() + _now.Hour.ToString() + _now.Minute.ToString() + _now.Second.ToString() + _now.Millisecond.ToString();
        }
        public static DateTime DateTimeUTC()
        {
            // NEEDS TO BE THE SAME AS Data.Core.Logging.DateTimeUTC
            return DateTimeUTC(DateTime.Now);
        }
        public static DateTime DateTimeUTC(DateTime _datetime)
        {
            // NEEDS TO BE THE SAME AS Data.Core.Logging.DateTimeUTC
            return _datetime.ToUniversalTime();
        }
        public static DateTime DateTimeMin()
        {
            return DateTime.Parse(SqlDateTime.MinValue.ToString());
        }
        public static DateTime DateTimeZone(DateTime? _datetime, string _timezone)
        {
            if (_timezone == null)
                _timezone = System.TimeZone.CurrentTimeZone.StandardName;
            TimeZoneInfo zone = TimeZoneInfo.FindSystemTimeZoneById(_timezone);
            DateTime date = DateTime.UtcNow;
            if (_datetime != null)
            {
                date = (DateTime)_datetime;
                date = DateTime.SpecifyKind(date, DateTimeKind.Utc);
            }
            return TimeZoneInfo.ConvertTimeFromUtc(date, zone);
        }
        public static int Ceiling(int int1, int int2)
        {
            double dbl1 = ParseDouble(int1.ToString("0"));
            double dbl2 = ParseDouble(int2.ToString("0"));
            double ceiling = Math.Ceiling(dbl1 / dbl2);
            return ParseInt(ceiling.ToString("0"));
        }
        public static string EscapeSingleJS(string javascript)
        {
            return javascript.Replace("'", "\\'");
        }
        public static string EllipseText(string text, int after)
        {
            int indexOfSpace = text.IndexOf(" ", after);
            int indexOfPeriod = text.IndexOf(".", after);

            if (indexOfSpace > -1)
            {
                if (indexOfSpace < indexOfPeriod)
                    text = text.Substring(0, indexOfSpace) + "...";
                else
                    text = text.Substring(0, indexOfPeriod) + "...";
            }
            else if (indexOfPeriod > 0)
            {
                text = text.Substring(0, indexOfPeriod) + "...";
            }
            else
                text = text.Substring(0, after) + "...";
            return text;

        }
        public static string TextToHtml(string text)
        {
            return TextToHtml(text, false);
        }
        public static string TextToHtml(object _string, bool encode)
        {
            if (_string == null)
                return "";
            else
            {
                string text = _string.ToString();
                if (String.IsNullOrEmpty(text))
                    return text;
                if (encode)
                    text = HttpContext.Current.Server.HtmlEncode(text);
                text = text.Replace(System.Environment.NewLine, "<br/>");
                if (encode)
                    text = text.Replace(" ", "&nbsp;");
                return text;
            }
        }
        public static string ToTitleCase(string _value)
        {
            TextInfo _text = new CultureInfo("en-US", false).TextInfo;
            return _text.ToTitleCase(_value.ToLower());
        }
        public static bool IsAlphanumeric(string s)
        {
            Regex r = new Regex("^[a-zA-Z0-9]*$");
            return r.IsMatch(s);
        }
        public static string Trim(string s, int length)
        {
            if (s.Length > length)
                return s.Substring(0, length);
            else
                return s;
        }
        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
        public static readonly Encoding Utf8Encoder = Encoding.GetEncoding(
            "UTF-8",
            new EncoderReplacementFallback(string.Empty),
            new DecoderExceptionFallback()
        );
        public static void EnterClick(WebControl _control, WebControl _button)
        {
            _control.Attributes.Add("onkeydown", EnterClick(_button.ClientID));
        }
        public static string EnterClick(string _buttonID)
        {
            return "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + _buttonID + "').click();return false;}} else {return true}; ";
        }
        public static string Left(string value, int maxLength)
        {
            if (string.IsNullOrEmpty(value))
                return value;
            maxLength = Math.Abs(maxLength);
            return (value.Length <= maxLength
                   ? value
                   : value.Substring(0, maxLength)
                   );
        }
        public static string Length(string _name, int _length)
        {
            string strName = _name;
            int intLength = strName.Length;
            while (intLength < _length)
            {
                intLength++;
                strName += "&nbsp;";
            }
            if (intLength > _length)
                strName = strName.Substring(0, _length) + "...";
            return strName;
        }
        /// <summary>
        /// Will parse the Value for all instances of StartsWith and replace with a hyperlink specified in the Link.
        /// </summary>
        /// <param name="Value">The string to be searched</param>
        /// <param name="StartsWith">The string to search for</param>
        /// <param name="Link">When the StartsWith is found, it will be replaced with this value. (Use %value% to inject the string that is found)</param>
        /// <param name="IncludeStartsWith">When building the found parameter, IncludeStartsWith will add StartsWith to found.</param>
        /// <returns></returns>
        public static string ParseHyperlinks(string Value, string StartsWith, string Link, bool IncludeStartsWith)
        {
            // Example: 
            string NewValue = "";
            if (Value.Contains(StartsWith))
            {
                for (int ii = 0; ii < 20 && Value.Contains(StartsWith); ii++)
                {
                    string link = Link;
                    string before = Value.Substring(0, Value.IndexOf(StartsWith));
                    Value = Value.Substring(Value.IndexOf(StartsWith) + StartsWith.Length);
                    string found = "";
                    if (Value.Contains(" "))
                    {
                        found = Value.Substring(0, Value.IndexOf(" "));
                        Value = Value.Substring(Value.IndexOf(" "));
                    }
                    else if (Value.Contains(". "))
                    {
                        found = Value.Substring(0, Value.IndexOf(". "));
                        Value = Value.Substring(Value.IndexOf(". "));
                    }
                    else
                    {
                        found = Value;
                        Value = "";
                    }
                    if (IncludeStartsWith)
                        found = StartsWith + found;
                    if (String.IsNullOrEmpty(link))
                    {
                        // Use the found value as the link
                        found = "<a href=\"" + found + "\">" + found + "</a>";
                    }
                    else
                    {
                        while (link.Contains("%value%"))
                            link = link.Replace("%value%", found);
                        found = link;

                    }
                    NewValue += before + found;
                }
            }
            NewValue += Value;
            return NewValue;
        }
        public static string IPAddress(HttpRequest Request)
        {
            string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipList))
            {
                return ipList.Split(',')[0];
            }

            return Request.ServerVariables["REMOTE_ADDR"];
        }
        public static string RequestPathHttp(HttpRequest request, bool includePage)
        {
            string strPort = (request.Url.Port == 80 || request.Url.Port < 1 ? "" : ":" + request.Url.Port.ToString());
            return request.Url.Scheme + "://" + request.Url.Host + strPort + HttpRuntime.AppDomainAppVirtualPath + (includePage ? request.Path : "");
        }
        public static string ConvertJSON(object data)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(data.GetType());
            MemoryStream ms = new MemoryStream();
            ser.WriteObject(ms, data);
            string jsonString = Encoding.UTF8.GetString(ms.ToArray());
            ms.Close();
            return jsonString;
        }
        public static Control FindControl(string id, Control page)
        {
            Control control = page.FindControl(id);
            if (control == null)
            {
                foreach (Control one in page.Controls)
                {
                    control = FindControl(id, one);
                    if (control != null)
                        break;
                }
            }
            return control;
        }
        public static bool Between(string num, string lower, string upper, bool inclusive = false)
        {
            return Between(ParseInt(num), ParseInt(lower), ParseInt(upper), inclusive);
        }
        public static bool Between(int num, int lower, int upper, bool inclusive = false)
        {
            return inclusive
                ? lower <= num && num <= upper
                : lower < num && num < upper;
        }
        public static string Random(int length, bool numbers)
        {
            Random random = new Random((int)DateTime.Now.Ticks);
            if (numbers)
                return new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
            else
                return new string(Enumerable.Repeat(letters, length).Select(s => s[random.Next(s.Length)]).ToArray());
        }
        public static int Random(int length)
        {
            Random random = new Random((int)DateTime.Now.Ticks);
            return ParseInt(new string(Enumerable.Repeat(nums, length).Select(s => s[random.Next(s.Length)]).ToArray()));
        }
        public static string ClearPhone(string _phone)
        {
            while (_phone.Contains("("))
                _phone = _phone.Replace("(", "");
            while (_phone.Contains(")"))
                _phone = _phone.Replace(")", "");
            while (_phone.Contains("-"))
                _phone = _phone.Replace("-", "");
            while (_phone.Contains(" "))
                _phone = _phone.Replace(" ", "");
            return _phone;
        }
        public static string FormatPhone(object _string)
        {
            if (_string == null)
                return "";
            else
            {
                string _phone = _string.ToString();
                string Phone = ClearPhone(_phone);
                if (Phone.Length == 10)
                    return "+1 (" + Phone.Substring(0, 3) + ") " + Phone.Substring(3, 3) + "-" + Phone.Substring(6);
                else
                    return _phone;
            }
        }
        public static string FormatEmail(object _string)
        {
            if (_string == null)
                return "";
            else
            {
                string _email = _string.ToString();
                string Email = ClearPhone(_email);
                return "<a href=\"mailto:" + Email + "\">" + Email + "</a>";
            }
        }
        public static void ExpandTree(TreeView oTree, TreeNode oSelected)
        {
            ExpandTree(oTree, oSelected, "", "");
        }
        public static void ExpandTree(TreeView oTree, TreeNode oSelected, string CssReplaceWhat, string CssReplaceWith)
        {
            bool boolExpanded = false;
            TreeNodeCollection oNodes = oTree.Nodes;
            foreach (TreeNode oNode in oNodes)
            {
                if (oNode == oSelected)
                    boolExpanded = true;
                else
                    boolExpanded = ExpandTree(oNode, oSelected, CssReplaceWhat, CssReplaceWith);
                if (boolExpanded == true)
                    break;
            }
        }
        private static bool ExpandTree(TreeNode oParent, TreeNode oSelected, string CssReplaceWhat, string CssReplaceWith)
        {
            bool boolExpanded = false;
            TreeNodeCollection oNodes = oParent.ChildNodes;
            foreach (TreeNode oNode in oNodes)
            {
                if (oNode == oSelected)
                    boolExpanded = Expand(oNode, CssReplaceWhat, CssReplaceWith);
                else
                    boolExpanded = ExpandTree(oNode, oSelected, CssReplaceWhat, CssReplaceWith);
                if (boolExpanded == true)
                    break;
            }
            if (boolExpanded == true)
                Expand(oParent, CssReplaceWhat, CssReplaceWith);
            return boolExpanded;
        }
        private static bool Expand(TreeNode oNode, string CssReplaceWhat, string CssReplaceWith)
        {
            if (string.IsNullOrEmpty(CssReplaceWhat) == false
                && string.IsNullOrEmpty(CssReplaceWith) == false
                && oNode.Text.Contains(CssReplaceWhat))
                oNode.Text = oNode.Text.Replace(CssReplaceWhat, CssReplaceWith);
            oNode.Expand();
            return true;
        }
    }
}
