[[MySql]]
[[GROUP_CONCAT]]

```mysql
SELECT
    main.id,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', related.id,
            'name', related.name,
            'status', related.status
        )
    ) AS related_data
FROM main_table main
LEFT JOIN related_table related ON main.id = related.main_id
GROUP BY main.id;
```