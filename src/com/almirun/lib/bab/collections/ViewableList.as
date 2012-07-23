/**
 * Author: joshua
 * Created at: 19/01/12, 2:23 PM
 * */
package com.almirun.lib.bab.collections {

/**
 * A collection suitable for viewing with a ListView.
 */
public interface ViewableList extends ObservableList, Filterable, Sortable {

    /**
     * Create an iterator for traversing this list and tracking a selection.
     * @return
     */
    function getIterator():IndexedIterator;
}
}
