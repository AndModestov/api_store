## API_STORE

### STORES  
**PATH:** GET /api/v1/stores

**PARAMS:**

```
{  
    publisher_id: <publisher_id>,  
}  
```

**RESPONSE:**  

* 200 Ok
```
{
    "stores": [
        { "id": <>, "name": <> },
        { "id": <>, "name": <> }
    ]
}
```

* 400 Bad request
```
{
    "errors": ["publisher not found"]
}
```



### EXEMPLARS
**PATH:** PATCH /api/v1/exemplars/sell

**PARAMS:**

```
{  
    ids: <exemplar_ids>*,  
}  
```

**RESPONSE:**  

* 200 Ok
```
{
    "exemplars": [
        { "id": <>, "store_id": <>, "product_id": <>, "product_type": <>},
        { "id": <>, "store_id": <>, "product_id": <>, "product_type": <>}
    ]
}
```

* 400 Bad request
```
{
    "errors": ["no exemplar ids provided"]
}
```
