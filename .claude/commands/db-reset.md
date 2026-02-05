# Reset Database

Reset the database to a clean state.

## Warning
This will DELETE all data in the development database.

## Steps
1. Stop the database container
2. Remove the database volume
3. Restart the database container
4. Wait for initialization to complete

## Command
```bash
make db-reset
```
