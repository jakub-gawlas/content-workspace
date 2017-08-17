# Content Workspace

Built of:
- [Content Generator](https://github.com/jakub-gawlas/content-generator)
- [Content Deliverer](https://github.com/jakub-gawlas/content-deliverer)
- [Content Viewer](https://github.com/jakub-gawlas/content-viewer)

![Demo](https://raw.githubusercontent.com/jakub-gawlas/content-workspace/master/src/docu/files/content-workspace-demo.gif)

## Run

```bash
docker run -it -p 3000:3000 -p 5000:5000 -p 8080:8080 -v {{SOURCES_PATH}}:/src/ jakubgawlas/content-workspace
```

- **{{SOURCES_PATH}}** path to dir contains file `docu.config.json` and `docu` dir (you can use [src](https://github.com/jakub-gawlas/content-workspace/tree/master/src) dir from this repo)

## Example flows

### Viewer

1. Open [Content Viewer](http://localhost:8080).
2. Edit and save your documentation.
3. Magic just happened! Back to browser, if you don't belive :D

### GraphiQL

1. Open [GraphiQL IDE](http://localhost:3000/graphiql).
2. Run query:

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

3. Edit and save your documentation. Changes should be immediately reflected in *GraphiQL*.