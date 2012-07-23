/**
 * Author: joshua
 * Created at: 29/03/12, 10:19 AM
 * */
package com.almirun.lib.bab.util.collections {
import com.almirun.lib.bab.collections.List;

public class ListUtil {

    // static members
    public static function vectorToArray(source:*):Array {
        var arr:Array = [];
        if (source) {
            for (var i:int = 0; i < source.length; i++) {
                arr.push(source[i]);
            }
        }
        return arr;
    }

    public static function isEmpty(list:* = null):Boolean {
        var isIt:Boolean = true;

        if (null != list) {
            if (list is Array) {
                isIt = 0 == (list as Array).length;
            }
            else if (list is List) {
                isIt = 0 == (list as List).length;
            }
            else if (isVector(list)) {
                isIt = 0 == list.length;
            }
        }

        return isIt;
    }

    public static function isVector(value:*):Boolean {
        var valueIsVector:Boolean = true;

        try {
            var vector:Vector.<Object> = Vector.<Object>(value);
        } catch (e:Error) {
            valueIsVector = false;
        }

        return valueIsVector;
    }

    // public attributes

    // private attributes

    // public methods

    // constructor

    // private methods

    // event handlers
}
}
