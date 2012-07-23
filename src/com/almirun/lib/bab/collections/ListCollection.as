/**
 * Author: joshua
 * Created at: 19/01/12, 10:16 AM
 * */
package com.almirun.lib.bab.collections {
import com.almirun.lib.bab.events.CollectionEvent;

import flash.events.EventDispatcher;

/**
 *  Dispatched when this collection's data has been changed.
 *
 *  @eventType com.almirun.lib.bab.events.LocalDataEvent.COLLECTION_DATA_UPDATED
 */
[Event(name="collectionDataUpdated", type="com.almirun.lib.bab.events.CollectionEvent")]

/**
 * Basic implementation of ObservableList.
 * @inheritDoc
 */
public class ListCollection extends EventDispatcher implements MutableList, Samplable {

    // public attributes

    public function get length():int {
        return source.length;
    }

    public function get source():Array { return _source; }
    public function set source(value:Array):void { 
        _source = value;
        dispatchUpdateEvent();
    }
    private var _source:Array;

    // public methods

    public function add(element:*, index:int = -1):void {
        if (index < 0) {
            source.push(element);
        }
        else {
            if (index > length) {
                throw new RangeError("Index " + index + " is out of range.")
            }
            
            source.splice(index, 0, element);
        }

        dispatchUpdateEvent();
    }

    public function clear():void {
        _source = [];
        dispatchUpdateEvent();
    }

    public function getAt (index:int):* {
        return source[index];
    }

    public function getViewableList():ViewableList {
        return new Vista(this);
    }

    public function indexOf(value:*):int {
        return source.indexOf(value);
    }

    public function remove(index:int):* {
        checkIndexRange(index);
        source.splice(index, 1);
        dispatchUpdateEvent();
    }

    public function sample(howMany:int = 1):* {
        if (length == 0) {
            return null;
        }
        else if (1 == howMany) {
            return source[Math.floor(Math.random() * source.length)];
        }
        else {
            var all:Array = source.concat();
            var sampled:Array = [];
            
            for (var i:int = 0; i < howMany; i++) {
                if (0 == all.length) {
                    break;
                }

                sampled.push(all.splice(Math.floor(Math.random() * all.length),
                    1)[0]);
            }

            return sampled;
        }
    }

    public function setAt (index:int, value:*):void {
        checkIndexRange(index);
        source.splice(index, 1, value);
        dispatchUpdateEvent();
    }

    public function toArray():Array {
        return source.concat();
    }

    // constructor

    public function ListCollection(items:Array = null) {
        source = null == items
            ? []
            : items;
    }

    // private methods

    private function checkIndexRange(index:int):void {
        if (index < 0 || index >= length) {
            throw new RangeError("Index specified (" + index + ") is out of range.")
        }
    }

    private function dispatchUpdateEvent():void {
        dispatchEvent(new CollectionEvent(CollectionEvent.COLLECTION_DATA_UPDATED));
    }
}
}