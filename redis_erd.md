```mermaid
classDiagram
    class Prefix {
        Key prefix
        Value origin_asn
    }

    class PathParent {
        Key asn
        Value parent_asn
    }

    class PathChild {
        Key asn
        Value[] children_asn
    }
```