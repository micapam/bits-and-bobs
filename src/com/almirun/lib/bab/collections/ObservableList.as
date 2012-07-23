/**
 * Author: joshua
 * Created at: 18/01/12, 4:51 PM
 * */
package com.almirun.lib.bab.collections {
import flash.events.IEventDispatcher;

/**
 * A list that dispatches events when it is modified.
 */
public interface ObservableList extends List, IEventDispatcher {

    /**
     * Create a viewable list suitable for a ListView.
     * @see com.almirun.lib.bab.ui.components.lists.ListView
     * @return
     */
    function getViewableList():ViewableList;
}
}
