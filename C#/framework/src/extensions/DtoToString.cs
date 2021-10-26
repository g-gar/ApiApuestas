using System;
using System.Reflection;

namespace framework.extensions{
    public static class DtoToString{
        public static string ToStringImproved(this Dto obj)
        {
            string result = obj.GetType().FullName + ":";
            Type t = obj.GetType(); // Where obj is object whose properties you need.
            PropertyInfo [] pi = t.GetProperties();
            foreach (PropertyInfo p in pi)
            {
                result += String.Format("{attr}={value}", p.Name, p.GetValue(obj));
            }

            return result + "\n";
        }
    }
}