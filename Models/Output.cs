using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;

namespace Models
{
    public class Output 
    { 
        /// <summary> 
        /// Convert class object to JSON string. USAGE: Output.SerializeJSON(test); 
        /// </summary> 
        /// <typeparam name="T">The type of the class</typeparam> 
        /// <param name="obj">The class object</param> 
        /// <returns>String</returns> 
        public static string SerializeJSON<T>(T obj)
        {
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(obj.GetType());
            MemoryStream ms = new MemoryStream();
            serializer.WriteObject(ms, obj);
            return Encoding.UTF8.GetString(ms.ToArray());
        }
        /// <summary>
        /// Convert JSON string to class object. USAGE: TestClass test = Output.DeserializeJSON&lt;TestClass&gt;(xml);
        /// </summary>
        /// <typeparam name="T">The type of the class</typeparam>
        /// <param name="json">The JSON string</param>
        /// <returns>Object</returns>
        public static T DeserializeJSON<T>(string json)
        {
            // First, convert to base64
            //string encoded = Statics.Base64Encode(json);
            //string decoded = Statics.Base64Decode(encoded);
            string decoded = Statics.Utf8Encoder.GetString(Statics.Utf8Encoder.GetBytes(json));
            T obj = Activator.CreateInstance<T>();
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(obj.GetType());
            using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(decoded)))
            {
                obj = (T)serializer.ReadObject(ms);
            }
            return obj;
        }
        /// <summary>
        /// Convert class object to XML string. USAGE: Output.SerializeXML(test);
        /// </summary>
        /// <typeparam name="T">The type of the class</typeparam>
        /// <param name="obj">The class object</param>
        /// <returns>String</returns>
        public static string SerializeXML<T>(T obj)
        {
            if (obj == null)
            {
                return string.Empty;
            }
            var xmlserializer = new XmlSerializer(typeof(T));
            var stringWriter = new StringWriter();
            using (var writer = XmlWriter.Create(stringWriter))
            {
                xmlserializer.Serialize(writer, obj);
                return stringWriter.ToString();
            }
        }
        /// <summary>
        /// Convert XML string to class object. USAGE: TestClass test = Output.DeserializeXML&lt;TestClass&gt;(xml);
        /// </summary>
        /// <typeparam name="T">The type of the class</typeparam>
        /// <param name="xml">The XML string</param>
        /// <returns>Object</returns>
        public static T DeserializeXML<T>(string xml)
        {
            T obj = Activator.CreateInstance<T>();
            XmlSerializer serializer = new XmlSerializer(typeof(T));
            using (StringReader tr = new StringReader(xml))
            {
                obj = (T)serializer.Deserialize(tr);
            }
            return obj;
        }
        public static T DeserializeXML<T>(string xml, XmlRootAttribute root)
        {
            T obj = Activator.CreateInstance<T>();
            XmlSerializer serializer = new XmlSerializer(typeof(T), root);
            using (StringReader tr = new StringReader(xml))
            {
                obj = (T)serializer.Deserialize(tr);
            }
            return obj;
        }

        //public static string Return(string DataType, CollaborateData data)
        //{
        //    string result = "";
        //    try
        //    {
        //        if (Statics.OutputType(DataType) == CollaborationOutputType.JSON)
        //            result = Output.SerializeJSON(data);
        //        else
        //            result = Output.SerializeXML(data);
        //    }
        //    catch (Exception ex)
        //    {
        //        while (ex.InnerException != null)
        //            ex = ex.InnerException;
        //        result = ex.Message;
        //    }
        //    return result;
        //}

    }
}
