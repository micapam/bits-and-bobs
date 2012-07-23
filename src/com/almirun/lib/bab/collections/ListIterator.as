/**
 * Author: joshua
 * Created at: 19/01/12, 10:54 AM
 * */
package com.almirun.lib.bab.collections {
import com.almirun.lib.bab.events.IterationEvent;

import flash.events.EventDispatcher;

/**
 *  Dispatched when the current selection of this iterator changes.
 *  @eventType com.almirun.lib.bab.events.IterationEvent.ITERATOR_INDEX_CHANGED
 */
[Event(name="iteratorIndexChanged", type="com.almirun.lib.bab.events.IterationEvent")]

/**
 * Basic implementation of Iterator for working with List collections.
 * @inheritDoc
 */
public class ListIterator extends EventDispatcher implements IndexedIterator {
    
    // public attributes

    /**
     * The currently selected item from the collection.
     * <p>Setting this attribute also changes the value of index.</p>
     * @throws ArgumentError If the given object is not found in the collection.
     * @see #index
     */
    public function get current():* {
        return collection.getAt(index);
    }
    public function set current(value:*):void {
        var foundIndex:int = collection.indexOf(value);

        if (foundIndex < 0 && null != value) {
            throw new ArgumentError("Object " + value + " not found in list.");
        }
        
        index = foundIndex;
    }

    public function get index():int { return _index; }
    public function set index(value:int):void {
        if (value < -1 || value >= collection.length) {
            throw new RangeError("Index " + value + " was out of range.")
        }
        
        _index = value;
        dispatchEvent(new IterationEvent(IterationEvent.ITERATOR_INDEX_CHANGED,
            index, current));
    }
    private var _index:int;

    public function get isValid():Boolean {
        return null != current;
    }
    
    // private attributes

    /**
     * Collection which this iterator traverses.
     */
    protected var collection:List;
    
    // public methods

    public function goNext():void {
        index += 1;
    }

    public function goPrevious():void {
        index -= 1;
    }

    public function goFirst():void {
        index = 0;
    }

    public function goLast():void {
        index = collection.length - 1;
    }

    public function ListIterator(list:List) {
        collection = list;
        index = -1;
    }
}
}
