/**
 * Author: Joshua
 * Created at: 23/01/12, 2:26 PM
 * */
package com.almirun.lib.bab.events {
import flash.events.Event;

/**
 * Event relating to iterators.
 */
public class IterationEvent extends Event {

    /**
     * Type of event to dispatch when the index of an iterator changes.
     * @eventType iteratorIndexChanged
     */
    public static const ITERATOR_INDEX_CHANGED:String = "iteratorIndexChanged";

    /**
     * Convenience access to affected iterator's index value.
     */
    public function get index():int { return _index; }
    private var _index:int;

    /**
     * Convenience access to newly selected item of the affected iterator.
     */
    public function get item():* { return _item; }
    private var _item:*;

    // public methods

    override public function clone():Event {
        return new IterationEvent(type, index, item, bubbles, cancelable);
    }

    // constructor

    public function IterationEvent(type:String, index:int = -1, item:* = null,
            bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        _item = item;
        _index = index;
    }
}
}
