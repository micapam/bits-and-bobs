/**
 * Author: joshua
 * Created at: 19/01/12, 2:05 PM
 * */
package com.almirun.lib.bab.collections {
public class SortDirection {

    // static members

    public static const ASCENDING:SortDirection = new SortDirection("ascending");
    public static const DESCENDING:SortDirection = new SortDirection("descending");

    private static var runtime:Boolean = false;

    // static block (prevents runtime instantiation)
    { runtime = true; }

    // private attributes

    private var name:String;

    // public methods

    public function equals(o:Object):Boolean {
        return o is SortDirection && (o as SortDirection).name == name;
    }

    public function toString():String {
        return name;
    }

    // constructor

    public function SortDirection(name:String) {
        if (runtime) {
            throw new Error("SortDirection is an enum and cannot be instantiated at runtime.")
        }

        this.name = name;
    }
}
}
