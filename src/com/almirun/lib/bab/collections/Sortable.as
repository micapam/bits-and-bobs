/**
 * Author: joshua
 * Created at: 19/01/12, 12:51 PM
 * */
package com.almirun.lib.bab.collections {

/**
 * A collection that allows sorting.
 */
public interface Sortable extends Refreshable {

    // attributes

    /**
     * Which direction to sort in. Default is SortDirection.ASCENDING.
     */
    function get sortDirection():SortDirection;
    function set sortDirection(value:SortDirection):void;

    /**
     * Whether to use case sensitivity in sorting. Default is false.
     */
    function get isSortCaseSensitive():Boolean;
    function set isSortCaseSensitive(value:Boolean):void;

    /**
     * Whether to sort numerically rather than by string character values.
     * Default is false.
     */
    function get isSortNumeric():Boolean;
    function set isSortNumeric(value:Boolean):void;

    // methods

    /**
     * Apply a sort to the collection
     * @param criterion Either a method (use the same signature as for Array.sort)
     * or a string representing the name of an attribute on the items in this
     * collection (as per Array.sortOn)
     */
    function sortBy(criterion:* = null):void;
}
}
