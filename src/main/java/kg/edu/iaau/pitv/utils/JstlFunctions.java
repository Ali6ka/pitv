package kg.edu.iaau.pitv.utils;

import java.util.Set;

public class JstlFunctions
{
    public static Boolean containsValue(Set<Object> bigSet, Object val) {
        if(bigSet.equals(null) || val.equals(null))
            return false;
        return bigSet.contains(val);
    }
}
