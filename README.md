# building
- create and populate keys folder
```
docker build -t infrastructure .
```

# running
- create and populate .env file
```
docker run --rm --name infrastructure --env-file .env infrastructure
```