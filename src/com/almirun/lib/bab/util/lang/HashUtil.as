/**
 * Author: Joshua
 * Created at: 23/07/12, 4:01 PM
 * */
package com.almirun.lib.bab.util.lang {
public class HashUtil {

    /**
     * Merges one hash with another to create a new merged hash.
     * <p>Both hash and otherHash remain unchanged, unlike the behaviour of
     * mergeInPlace(). In case of any key duplication with otherHash,
     * otherHash's values take priority.</p>
     * @param hash A hash of default values to populate the merged hash.
     * @param otherHash A hash of values that override the default values in
     * hash. This argument is optional, so that it can be used in the context of
     * a named option hash argument in the calling method.
     * @return The merged hash.
     */
    public static function merge(hash:Object, otherHash:Object = null):Object {
        var key:String;
        var merged:Object = {};

        for (key in hash) {
            merged[key] = hash[key];
        }

        if (null != otherHash) {
            for (key in otherHash) {
                merged[key] = otherHash[key];
            }
        }

        return merged;
    }

    /**
     * Adds the content of otherHash to hash.
     * @param hash The hash into which any new values will be added. Note that
     * if keys already exist in this hash, they will be overwritten.
     * @param otherHash The hash containing new values to add. This hash will
     * remain unchanged.
     */
    public static function mergeInPlace(hash:Object, otherHash:Object):void {
        for (var key:String in otherHash) {
            hash[key] = otherHash[key];
        }
    }
}
}