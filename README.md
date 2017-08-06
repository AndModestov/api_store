## API_STORE

### STORES  
**PATH:** GET /api/v1/stores

**PARAMS:**

```
{  
    filter_type: <filter_type>
    filter_params: { ... }
}  
```

#### possible filter types:
  - 'publisher', filter_params: { publisher_id: <publisher_id> }


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
    "errors": ["filter error"]
}
```



### EXEMPLARS
**PATH:** PATCH /api/v1/exemplars

**PARAMS:**

```
{  
    ids: [<exemplar_ids>],
    exemplar: {
      status: <exemplar_status>,
      store_id: <store_id> 
    }
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
