module uim.mvc.interfaces.event;

@safe:
import uim.mvc;

interface IEvent : IMVCObject {
    // TODO datatype
    // Returns the subject of this event.
    // "auto" getSubject();

    // Stops the event from being used anymore.
    void stopPropagation();

    // Checks if the event is stopped. Returns true if the event is stopped
    bool isStopped();

    // The result value of the event listeners.
    Json result();

    // Listeners can attach a result value to the event.
    IEvent result(Json value = Json(null));

    // Accesses the event data/payload. If the key does not exist a null value is returned.
    STRINGAA data(string key);
    // Accesses the event data/payload. If the keys do not exist a null value is returned. If keys = null all data will be returned
    STRINGAA data(string[] keys = null);

    // Assigns a value to the data/payload of this event.
    IEvent data(string key, string value);

    // Assigns values to the data/payload of this event.
    IEvent data(STRINGAA values);
}