/**
 * Author: joshua
 * Created at: 18/01/12, 4:35 PM
 */
package com.almirun.lib.bab.collections {
import flash.events.IEventDispatcher;

/**
 * For traversing collections
 */
public interface Iterator extends IEventDispatcher {

    /**
     * Element at the current index position, if any
     */
    function get current():*;
    function set current(value:*):void;

    /**
     * Whether or not there is an index at the current position.
     */
    function get isValid():Boolean;

    /**
     * Shift the current index position to the next.
     */
    function goNext():void;

    /**
     * Shift the current index position to the previous.
     */
    function goPrevious():void;

    /**
     * Shift the current index position to the first (0).
     */
    function goFirst():void;

    /**
     * Shift the current index position to the last (length of the collection minus one).
     */
    function goLast():void;
}
}
