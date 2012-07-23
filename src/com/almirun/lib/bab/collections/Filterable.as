/**
 * Author: joshua
 * Created at: 19/01/12, 11:45 AM
 * */
package com.almirun.lib.bab.collections {

/**
 * A collection that allows filtering.
 */
public interface Filterable extends Refreshable {

    /**
     * Apply a filter to the collection.
     * <p>Method should have the same signature as used on Array.filter:
     * function(item:*, index:int, array:Array):Boolean;</p>
     * @param method
     */
    function filterBy(method:Function = null):void;
}
}
