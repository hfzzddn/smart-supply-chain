**Trigger**

```sql
CREATE TRIGGER preventDelcustomerStoreAddress ON customer_store_address
INSTEAD OF DELETE
AS
BEGIN
     RAISERROR ('Deletion are not permitted',16,1);
END;

CREATE TRIGGER preventDelorderitem ON order_item
INSTEAD OF DELETE
AS
BEGIN
     RAISERROR ('Deletion are not permitted',16,1);
END;

```
