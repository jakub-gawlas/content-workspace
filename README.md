# Content workspace

## Run

```bash
docker run -it --rm --name workspace -p 3000:3000 -p 5000:5000 -v {{SOURCES_PATH}}:/src/ jakubgawlas/content-workspace
```

- **{{SOURCES_PATH}}** path to dir contains file `docu.config.json` and `docu` dir (you can use [src](https://github.com/jakub-gawlas/content-workspace/tree/master/src) dir from this repo)

### Example flow

Open [GraphiQL IDE](http://localhost:3000/graphiql) and run query:

```gql
subscription {
  changedDocumentation {
    name
    description
    documents {
      title
      tags
      content
    }
  }
}
```

Try edit your documentation, and save edited file. Changes should be immediately reflected in *GraphiQL* IDE.