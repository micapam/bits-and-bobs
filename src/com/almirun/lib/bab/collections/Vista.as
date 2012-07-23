/**
 * Author: joshua
 * Created at: 19/01/12, 12:47 PM
 * */
package com.almirun.lib.bab.collections {
import com.almirun.lib.bab.events.CollectionEvent;

import flash.events.EventDispatcher;

/**
 *  Dispatched when this collection's filter or sort has been changed (or
 *  the underlying collection has been modified).
 *  @eventType com.almirun.lib.bab.events.LocalDataEvent.COLLECTION_DATA_UPDATED
 */
[Event(name="collectionDataUpdated", type="com.almirun.lib.bab.events.CollectionEvent")]

/**
 * An immutable list that provides sorting and filtering on another list's
 * data.
 * <p>Useful for separating out filtering and sorting from the main list
 * so that views and mediators don't have to muddy the waters in models.</p>
 * <p>This class is called Vista rather than View because I don't want to
 * use the word 'view' for non-display-related code.</p>
 * @inheritDoc
 */
public class Vista extends EventDispatcher implements ViewableList {

    // public attributes   

    public function get isSortCaseSensitive():Boolean
        { return _isSortCaseSensitive; }
    public function set isSortCaseSensitive(value:Boolean):void
        { _isSortCaseSensitive; }
    private var _isSortCaseSensitive:Boolean;

    public function get isSortNumeric():Boolean { return _isSortNumeric; }
    public function set isSortNumeric(value:Boolean):void
        { _isSortNumeric = value; }
    private var _isSortNumeric:Boolean;

    public function get length():int {
        return items.length;
    }

    public function get sortDirection():SortDirection { return _sortDirection; }
    public function set sortDirection(value:SortDirection):void
        { _sortDirection = value; }
    private var _sortDirection:SortDirection;

    // private attributes

    /**
     * Method by which to filter the data.
     */
    protected var filter:Function;

    /**
     * Filtered and sorted data.
     */
    protected var items:Array;

    /**
     * Collection that this vista wraps: source of its data.
     */
    protected var list:ObservableList;

    /**
     * Method by which to sort the data.
     * <p>Mutually exclusive with sortAttribute.</p>
     * @see Array#sort
     */
    protected var sortMethod:Function;

    /**
     * Attribute name by which to sort the data.
     * <p>Mutually exclusive with sortMethod.</p>
     * @see Array#sortOn
     */
    protected var sortAttribute:String;

    /**
     * Bit-flags for sorting.
     * @see Array#sort()
     * @see Array#sortOn()
     */
    protected function get sortOptions():int {
        var options:int = Array.RETURNINDEXEDARRAY;
        
        if (!isSortCaseSensitive) {
            options |= Array.CASEINSENSITIVE;
        }
        
        if (isSortNumeric) {
            options |= Array.NUMERIC;
        }
        
        if (SortDirection.DESCENDING.equals(sortDirection)) {
            options |= Array.DESCENDING;
        }
        
        return options;
    }

    // public methods

    public function filterBy(method:Function = null):void {
        filter = method;
    }

    public function getAt(index:int):* {
        return items[index];
    }

    public function getIterator():IndexedIterator {
        return new ListIterator(this);
    }

    // Not sure why you want to do this - hang a Vista off another one ... but
    // if you feel masochistic, go ahead...
    public function getViewableList():ViewableList {
        return new Vista(this);
    }

    public function indexOf(value:*):int {
        return items.indexOf(value);
    }

    public function sortBy(criterion:* = null):void {
        sortMethod = null;
        sortAttribute = null;

        if (criterion is Function) {
            sortMethod = criterion as Function;
        }
        else if (criterion is String) {
            sortAttribute = criterion as String;
        }
    }

    public function toArray():Array {
        return items.concat();
    }

    // constructor

    public function Vista(list:ObservableList) {
        this.list = list;
        sortDirection = SortDirection.ASCENDING;
        generateItems();

        list.addEventListener(CollectionEvent.COLLECTION_DATA_UPDATED,
            handleCollectionDataUpdated);
    }

    // public methods

    public function refresh():void {
        generateItems();
        dispatchEvent(new CollectionEvent(
            CollectionEvent.COLLECTION_DATA_UPDATED));
    }

    // private methods

    protected function generateItems():void {
        items = list.toArray();

        if (null != filter) {
            items = items.filter(filter);
        }
        
        if (null != sortMethod) {
            items = items.sort(sortMethod, sortOptions);
        }
        else if (null != sortAttribute) {
            items = items.sortOn(sortAttribute, sortOptions);
        }
    }

    // event handlers
    
    private function handleCollectionDataUpdated(event:CollectionEvent):void {
        refresh();
    }
}
}