/**
 * Author: joshua
 * Created at: 18/01/12, 4:24 PM
 * */
package com.almirun.lib.bab.collections {

/**
 * Simple data collection, inspired by java.util.List (but more basic).
 */
public interface List {
    
    // attributes

    /**
     * Number of elements in the list.
     */
    function get length():int;
    
    // methods

    /**
     * Access a specified element in this collection.
     * @param index Where to look for the element.
     * @return The element, if it is found, or null if there is no element at
     * the location specified.
     */
    function getAt(index:int):*;

    /**
     * Find the index of the first matching element for a given value. The
     * equality operator == is used to match elements with the value.
     * @param value
     * @return The index of the matching element, or -1 if no matches are
     * present.
     */
    function indexOf(value:*):int;

    /**
     * Get the items of this list.
     * <p>Note that because this returns a copy, you cannot use the returned
     * array to alter this collection (although it's a shallow copy, so you
     * *can* use it to modify the elements within the collection).</p0>
     * @return A copy of the underlying array.
     */
    function toArray():Array;
}
}
