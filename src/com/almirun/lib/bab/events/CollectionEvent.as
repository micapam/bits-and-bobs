/**
 * Author: joshua
 * Created at: 19/01/12, 10:22 AM
 * */
package com.almirun.lib.bab.events {
import flash.events.Event;

/**
 * Events regarding data updates in collections.
 */
public class CollectionEvent extends Event {

    /**
     * Type of event to dispatch when data in a collection is updated.
     * @eventType collectionDataUpdated
     */
    public static const COLLECTION_DATA_UPDATED:String = "collectionDataUpdated";
    
    // public methods
    
    override public function clone():Event {
        return new CollectionEvent(type, bubbles, cancelable);
    }
    
    // constructor

    public function CollectionEvent(type:String, bubbles:Boolean = false,
            cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }
}
}
