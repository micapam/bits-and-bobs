/**
 * Author: Joshua
 * Created at: 23/01/12, 11:36 AM
 * */
package com.almirun.lib.bab.collections {

/**
 * Collection from which a (random) sample can be taken.
 */
public interface Samplable {

    /**
     * Get a random sample from this collection.
     * @param howMany How many items to include in the sample (up the point at
     * which all elements are exhausted). If omitted, return a sample of just
     * one.
     * @return Either a single value or an array of values (if howMany is
     * specified and is greater than one.
     */
    function sample(howMany:int = 1):*;
}
}