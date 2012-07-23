/**
 * Author: joshua
 * Created at: 19/01/12, 11:12 AM
 * */
package com.almirun.lib.bab.collections {

/**
 * Iterator that shows its current position within the collection, and allows
 * jumping to any point in the collection.
 *
 * <p>Suitable for array-based collections e.g. ListCollection, but not suitable
 * for other collections e.g. a linked list.</p>
 */
public interface IndexedIterator extends Iterator {

    /**
     * Current position within the collection.
     */
    function get index():int;
    function set index(value:int):void;
}
}
