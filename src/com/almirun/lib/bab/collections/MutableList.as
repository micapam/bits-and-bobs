/**
 * Author: joshua
 * Created at: 19/01/12, 12:27 PM
 * */
package com.almirun.lib.bab.collections {

/**
 * Collection that can be modified.
 */
public interface MutableList extends ObservableList {

    // attributes

    /**
     * Data contained with this collection, in array form.
     */
    function get source():Array;
    function set source(value:Array):void;

    // methods

    /**
     * Adds an item to this collection, optionally at a specific index. Note that
     * if an index position is specified, and that position is occupied, the
     * subsequent elements will shift up to make room.
     * @param element The object to be added.
     * @param index Where to insert the object; omit to add at the end.
     * @throws RangeError If the index is outside the range of the collection.
     */
    function add(element:*, index:int = -1):void;

    /**
     * Remove all elements from this collection.
     */
    function clear():void;

    /**
     * Remove the element at the specified index position. Note that the other
     * elements will be moved to make room.
     * @param index The index position from which an element should be removed.
     * @return The element that has been removed from the collection.
     * @throws RangeError If the index is outside the range of the collection.
     */
    function remove(index:int):*;

    /**
     * Replaces the element at the specified position in this list with the value
     * provided.
     * @param index Index position at which to place the value.
     * @param value Value to be inserted at the specified position.
     * @throws RangeError If the index is outside the range of the collection.
     */
    function setAt(index:int, value:*):void;
}
}
